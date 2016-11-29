var _      = require('underscore'),
    assert = require('chai').assert,
    dblib  = require('../dblib');

(function () {
  'use strict';

  describe('calccashbudget()', function () {

    var adminCred  = dblib.adminCred,
        datasource = dblib.datasource,
        accntfail,
        accntsucceed,
        period
        ;

    it("needs a failing accnt record", function(done) {
      var sql = "SELECT accnt_id" +
                " FROM accnt" +
                " WHERE accnt_type NOT IN ('A', 'L', 'Q')" +
                " LIMIT 1;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        accntfail = res.rows[0].accnt_id;
        done();
      });
    });

    it("needs a succeeding accnt record", function(done) {
      var sql = "SELECT accnt_id" +
                " FROM accnt" +
                " WHERE accnt_type IN ('A', 'L', 'Q')" +
                " LIMIT 1;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        accntsucceed = res.rows[0].accnt_id;
        done();
      });
    });

    it("needs a period record", function(done) {
      var sql = "SELECT period_id" +
                " FROM period" +
                " LIMIT 1;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        period = res.rows[0].period_id;
        done();
      });
    });

    it("should fail with inappropriate account types", function(done) {
      var sql = "SELECT calccashbudget($1, $2, 'M') AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ accntfail,
                                          period ] });

      datasource.query(sql, cred, function (err, res) {
        dblib.assertErrorCode(err, res, "calccashbudget", -1);
        done();
      });
    });

    it("should run without error", function (done) {
      var sql = "SELECT calccashbudget($1, $2, 'M') AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ accntsucceed,
                                          period ] });

      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        assert.isNotNull(res.rows[0].result);
        done();
      });
    });
  });
})();
