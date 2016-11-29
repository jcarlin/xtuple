var _      = require('underscore'),
    assert = require('chai').assert,
    dblib  = require('../dblib');

(function () {
  'use strict';

  describe('balanceItemsite()', function () {

    var adminCred  = dblib.adminCred,
        datasource = dblib.datasource,
        itemsitefail,
        itemsitesucceed
        ;

    it("needs a failing itemsite record", function(done) {
      var sql = "UPDATE itemsite i" +
                " SET itemsite_freeze=TRUE" +
                " FROM (" +
                " SELECT itemsite_id" +
                " FROM itemsite" +
                " WHERE NOT itemsite_freeze" +
                " AND itemsite_loccntrl" +
                " LIMIT 1) sub" +
                " WHERE i.itemsite_id=sub.itemsite_id" +
                " RETURNING i.itemsite_id;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        itemsitefail = res.rows[0].itemsite_id;
        done();
      });
    });

    it("needs a succeeding itemsite record", function(done) {
      var sql = "SELECT itemsite_id FROM itemsite" +
                " WHERE NOT itemsite_freeze" +
                " AND itemsite_loccntrl" +
                " LIMIT 1;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        itemsitesucceed = res.rows[0].itemsite_id;
        done();
      });
    });

    it("should fail with a frozen itemsite", function(done) {
      var sql = "SELECT balanceItemsite($1) AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ itemsitefail ] });

      datasource.query(sql, cred, function (err, res) {
        dblib.assertErrorCode(err, res, "balanceItemsite", -1);
        done();
      });
    });
/*
    after(function () {
      var sql = "UPDATE itemsite SET itemsite_freeze=FALSE WHERE itemsite_id=$1;",
      cred = _.extend({}, adminCred, { parameters: [ itemsitefail ] });

      datasource.query(sql, cred);
    });
*/
    it("should run without error", function (done) {
      var sql = "SELECT balanceItemsite($1) AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ itemsitesucceed ] });

      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rows[0].result, 1);
        done();
      });
    });
  });
})();
