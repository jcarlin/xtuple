var _      = require("underscore"),
    assert = require('chai').assert,
    dblib  = require('../dblib');

(function () {
  "use strict";

  describe('explodeWO()', function () {

    var datasource = dblib.datasource,
        adminCred  = dblib.generateCreds(),
        charuse,
        metric,
        wo         = {}
        ;

    it("needs some metric values", function (done) {
      var sql = "select fetchMetricBool('BBOM') as BBOM,"               +
                "       fetchmetricBool('Routings') as Routings,"       +
                "       fetchMetricBool('AutoExplodeWO') as AutoExplodeWO;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount, 1);
        metric = res.rows[0];
        done();
      });
    });

    it("needs autoexplode turned off", function (done) {
      var sql = "select setMetric('AutoExplodeWO', 'f') as result;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount, 1);
        done();
      });
    });

    after(function (done) {
      var sql  = "select setMetric('AutoExplodeWO', 't');";
      if (metric.AutoExplodeWO) {
        datasource.query(sql, adminCred, function (/*err, res*/) {
          done();
        });
      } else {
        done();
      }
    });

    it("needs a work order characteristic", function (done) {
      var sql = "select * from charuse where charuse_target_type = 'W' limit 1;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        assert.operator(res.rowCount, "<=", 1);
        if (res.rowCount === 1) {
          charuse = res.rows[0];
          done();
        } else {
          var sql = "insert into charuse ("                           +
                    "  charuse_char_id, charuse_target_type"          +
                    ") select char_id, 'W' from \"char\""             +
                    "   where not exists(select 1 from charuse"       +
                    "               where charuse_target_type = 'W')" +
                    " limit 1 returning *;";
          datasource.query(sql, adminCred, function (err, res) {
            assert.isNull(err);
            assert.equal(res.rowCount, 1);
            charuse = res.rows[0];
            charuse.added = true;
            done();
          });
        }
      });
    });

    after(function (done) {
      var sql  = "delete from charuse where charuse_id = $1;",
          cred = _.extend({}, adminCred, { parameters: [ charuse.charuse_id ] });
      if (charuse.added) {
        datasource.query(sql, cred, function (/*err, res*/) {
          done();
        });
      } else {
        done();
      }
    });

    it("needs one open and one closed workorder", function (done) {
      // the open order must have child manufactured items
      var sql =
                "select min(wo_id) as wo_id, wo_status from wo"                 +
                " where wo_status = 'C' group by wo_status"                     +
                " union "                                                       +
                "select createWo(fetchWoNumber(), itemsite_id, 10, 7,"          +
                "                current_date, 'test explodewo()'), 'O'"        +
                "  from (select pi.itemsite_id from itemsite pi"                +
                "  join bomitem on pi.itemsite_item_id=bomitem_parent_item_id"  +
                "        and getActiveRevId('BOM', pi.itemsite_item_id)=bomitem_rev_id" +
                "        and current_date between bomitem_effective and (bomitem_expires-1)" +
                "  join itemsite ci on bomitem_item_id = ci.itemsite_item_id"   +
                "        and pi.itemsite_warehous_id = ci.itemsite_warehous_id" +
                "  join item on ci.itemsite_item_id = item_id"                  +
                " where pi.itemsite_wosupply and ci.itemsite_wosupply"          +
                "   and ci.itemsite_active and ci.itemsite_costmethod != 'J'"   +
                "   and pi.itemsite_active and pi.itemsite_costmethod != 'J'"   +
                "   and item_type = 'M' and bomitem_createwo"                   +
                " limit 1) as getItemsiteId;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount, 2);
        _.each(res.rows, function (e) { wo[e.wo_status] = e.wo_id; });
        done();
      });
    });

    it("should fail on a closed work order", function (done) {
      var sql  = "select explodeWO($1, false) as result;",
          cred = _.extend({}, adminCred, { parameters: [ wo.C ] });
      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        dblib.assertErrorCode(err, res, 'explodeWO', -4);
        done();
      });
    });

    it.skip("should fail -2 for job costed components");

    it.skip("fail -3 if at least one breeder child itemsite is missing");

    it("needs a characteristic to test copying", function (done) {
      var sql  = "insert into charass ("                        +
                 "  charass_char_id, charass_target_id,"        +
                 "  charass_target_type, charass_value"         +
                 ") values ($1, $2, 'W', 'test')"               +
                 " returning charass_id;",
          cred = _.extend({}, adminCred,
                          { parameters: [ charuse.charuse_char_id, wo.O ] });
      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount, 1);
        assert.operator(res.rows[0].charass_id, ">", 0);
        done();
      });
    });

    it("should explode an open work order", function (done) {
      var sql  = "select explodeWO($1, true) as result;",
          cred = _.extend({}, adminCred, { parameters: [ wo.O ] });
      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount, 1);
        assert.equal(res.rows[0].result, wo.O);
        done();
      });
    });

    // TODO: how many? check for 'SI' charass_target_type when wo_ordtype == 'S'
    it("should have created womatl records", function (done) {
      var sql  = "select exists(select 1 from womatl where womatl_wo_id = $1)" +
                 "    as result;",
          cred = _.extend({}, adminCred, { parameters: [ wo.O ] });
      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount, 1);
        assert.isTrue(res.rows[0].result);
        done();
      });
    });

    it("should have created woopers if Routings", function (done) {
      var sql  = "select exists(select 1 from xtmfg.wooper"      +
                 "               where wooper.wo_id = $1) as result;",
          cred = _.extend({}, adminCred, { parameters: [ wo.O ] });
      datasource.query(sql, cred, function (err, res) {
        if (metric.Routing) {
          assert.isNull(err);
          assert.equal(res.rowCount, 1);
          assert.isTrue(res.rows[0].result);
        } else if (! err) {
          assert.equal(res.rowCount, 1);
          assert.isFalse(res.rows[0].result);
        } else {
          assert.isUndefined(res);
        }
        done();
      });
    });

    it.skip("should have set womatl_wooper_id if Routings");
    it.skip("should have set pr_prj_id := wo_prj_id where pr is tied to womatl");
    it.skip("should create brddist records for BBOM");
    it.skip("should create womatl records for 'F'antom item_type");

    it("should create child orders for manufactured parts", function (done) {
      var sql  = "select exists(select 1"                                      +
                 "                from wo cwo"                                 +
                 "                join wo pwo on cwo.wo_number=pwo.wo_number"  +
                 "                           and cwo.wo_id != pwo.wo_id"       +
                 "               where pwo.wo_id = $1) as result;",
          cred = _.extend({}, adminCred, { parameters: [ wo.O ] });
      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount, 1);
        assert.isTrue(res.rows[0].result);
        done();
      });
    });

    it("should have wo_status = 'E'", function (done) {
      var sql  = "select wo_status = 'E' as result from wo where wo_id = $1;",
          cred = _.extend({}, adminCred, { parameters: [ wo.O ] });
      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount, 1);
        assert.isTrue(res.rows[0].result);
        done();
      });
    });

    it("should get 'W' characteristics", function (done) {
      var sql  = "select exists(select 1 from charass"                  +
                 "                where charass_target_id = $1"         +
                 "                  and charass_target_type = 'W') as result;",
          cred = _.extend({}, adminCred, { parameters: [ wo.O ] });
      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount, 1);
        assert.isTrue(res.rows[0].result);
        done();
      });
    });

    it("should honor pExplodeChildren == true", function (done) {
      var sql  = "select bool_and(c.wo_status = 'E') as result"         +
                 "  from wo c join wo p on c.wo_number = p.wo_number"   +
                 " where c.wo_subnumber != p.wo_subnumber and p.wo_id = $1;",
          cred = _.extend({}, adminCred, { parameters: [ wo.O ] });
      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount, 1);
        assert.isTrue(res.rows[0].result);
        done();
      });
    });

    it.skip("should honor pExplodeChildren == false");

  });

}());
