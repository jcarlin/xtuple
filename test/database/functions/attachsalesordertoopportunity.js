var _      = require('underscore'),
    assert = require('chai').assert,
    dblib  = require('../dblib');

(function () {
  'use strict';

  describe('attachSalesOrderToOpportunity()', function () {

    var adminCred  = dblib.adminCred,
        datasource = dblib.datasource,
        coheadfail,
        coheadsucceed,
        ophead
        ;

    it("needs a failing cohead record", function(done) {
      var sql = "SELECT cohead_id FROM cohead" +
                " WHERE cohead_ophead_id IS NOT NULL" +
                " LIMIT 1;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        coheadfail = res.rows[0].cohead_id;
        done();
      });
    });

    it("needs a failing succeeding cohead record", function(done) {
      var sql = "SELECT cohead_id FROM cohead" +
                " WHERE cohead_ophead_id IS NULL" +
                " LIMIT 1;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        coheadsucceed = res.rows[0].cohead_id;
        done();
      });
    });

    it("needs an ophead", function(done) {
      var sql = "SELECT ophead_id FROM ophead" +
                " LIMIT 1;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        ophead = res.rows[0].ophead_id;
        done();
      });
    });

    it("should fail with an invalid sales order", function(done) {
      var sql = "SELECT attachSalesOrderToOpportunity(-1, $1) AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ ophead ] });

      datasource.query(sql, cred, function (err, res) {
        dblib.assertErrorCode(err, res, "attachSalesOrderToOpportunity", -1);
        done();
      });
    });

    it("should fail with an invalid opportunity", function(done) {
      var sql = "SELECT attachSalesOrderToOpportunity($1, -1) AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ coheadsucceed ] });

      datasource.query(sql, cred, function (err, res) {
        dblib.assertErrorCode(err, res, "attachSalesOrderToOpportunity", -2);
        done();
      });
    });

    it("should fail with a sales order that already has an opportunity", function(done) {
      var sql = "SELECT attachSalesOrderToOpportunity($1, $2) AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ coheadfail,
                                          ophead ] });

      datasource.query(sql, cred, function (err, res) {
        dblib.assertErrorCode(err, res, "attachSalesOrderToOpportunity", -3);
        done();
      });
    });

    it("should run without error", function (done) {
      var sql = "SELECT attachSalesOrderToOpportunity($1, $2) AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ coheadsucceed,
                                          ophead ] });

      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rows[0].result, 0);
        done();
      });
    });
  });
})();
