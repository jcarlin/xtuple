var _      = require('underscore'),
    assert = require('chai').assert,
    dblib  = require('../dblib');

(function () {
  'use strict';

  describe('applyAPCreditMemoToBalance()', function () {

    var adminCred  = dblib.adminCred,
        datasource = dblib.datasource,
        apopenfail,
        apopensucceed
        ;

    it("needs a failing apopen record", function(done) {
      var sql = "INSERT INTO apopen (" +
                " apopen_amount, apopen_paid," +
                " apopen_curr_rate)" +
                " VALUES (" +
                " 1.0, 2.0," +
                " 1.0)" +
                " RETURNING apopen_id;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        apopenfail = res.rows[0].apopen_id;
        done();
      });
    });

    it("needs a succeeding apopen record", function(done) {
      var sql = "SELECT apopen_id FROM apopen" +
                " LIMIT 1;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        apopensucceed = res.rows[0].apopen_id;
        done();
      });
    });

    it("should fail with a negative balance", function(done) {
      var sql = "SELECT applyAPCreditMemoToBalance($1) AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ apopenfail ] });

      datasource.query(sql, cred, function (err, res) {
        dblib.assertErrorCode(err, res, "applyAPCreditMemoToBalance", -1);
        done();
      });
    });
/*
    after(function () {
      var sql = "DELETE FROM apopen WHERE apopen_id=$1;",
          cred = _.extend({}, adminCred, { parameters: [ apopenfail ] });

      datasource.query(sql, cred);
    });
*/
    it("should run without error", function (done) {
      var sql = "SELECT applyAPCreditMemoToBalance($1) AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ apopensucceed ] });

      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rows[0].result, 1);
        done();
      });
    });
  });
})();
