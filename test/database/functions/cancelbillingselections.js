var _      = require('underscore'),
    assert = require('chai').assert,
    dblib  = require('../dblib');

(function () {
  'use strict';

  describe('cancelBillingSelection()', function () {

    var adminCred  = dblib.adminCred,
        datasource = dblib.datasource,
        cobmiscfail,
        cobmiscsucceed
        ;

    it("needs a failing cobmisc record", function(done) {
      var sql = "SELECT cobmisc_id" +
                " FROM cobmisc" +
                " WHERE cobmisc_posted" +
                " LIMIT 1;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        cobmiscfail = res.rows[0].cobmisc_id;
        done();
      });
    });

    it("needs a succeeding cobmisc record", function(done) {
      var sql = "UPDATE cobmisc c" +
                " SET cobmisc_posted=FALSE" +
                " FROM (" +
                " SELECT cobmisc_id" +
                " FROM cobmisc" +
                " WHERE cobmisc_posted" +
                " AND cobmisc_id!=$1" +
                " LIMIT 1) sub" +
                " WHERE c.cobmisc_id=sub.cobmisc_id" +
                " RETURNING c.cobmisc_id;",
          cred = _.extend({}, adminCred,
                          { parameters: [ cobmiscfail ] });

      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        cobmiscsucceed = res.rows[0].cobmisc_id;
        done();
      });
    });

    it("should fail for posted cobmisc records", function(done) {
      var sql = "SELECT cancelBillingSelection($1) AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ cobmiscfail ] });

      datasource.query(sql, cred, function (err, res) {
        dblib.assertErrorCode(err, res, "cancelBillingSelection", -1);
        done();
      });
    });

    it("should run without error", function (done) {
      var sql = "SELECT cancelBillingSelection($1) AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ cobmiscsucceed ] });

      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rows[0].result, 1);
        done();
      });
    });
  });
})();
