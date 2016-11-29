var _      = require('underscore'),
    assert = require('chai').assert,
    dblib  = require('../dblib');

(function () {
  'use strict';

  describe('attachQuoteToOpportunity()', function () {

    var adminCred  = dblib.adminCred,
        datasource = dblib.datasource,
        quheadfail,
        quheadsucceed,
        ophead
        ;

    it("needs a failing quhead record", function(done) {
      var sql = "SELECT quhead_id FROM quhead" +
                " WHERE quhead_ophead_id IS NOT NULL" +
                " LIMIT 1;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        quheadfail = res.rows[0].quhead_id;
        done();
      });
    });

    it("needs a succeeding quhead record", function(done) {
      var sql = "INSERT INTO quhead (" +
                " quhead_number, quhead_cust_id)" +
                " SELECT '2', quhead_cust_id" +
                " FROM quhead " +
                " LIMIT 1" +
                " RETURNING quhead_id;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        quheadsucceed = res.rows[0].quhead_id;
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

    it("should fail with an invalid quote", function(done) {
      var sql = "SELECT attachQuoteToOpportunity(-1, $1) AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ ophead ] });

      datasource.query(sql, cred, function (err, res) {
        dblib.assertErrorCode(err, res, "attachQuoteToOpportunity", -1);
        done();
      });
    });

    it("should fail with an invalid opportunity", function(done) {
      var sql = "SELECT attachQuoteToOpportunity($1, -1) AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ quheadsucceed ] });

      datasource.query(sql, cred, function (err, res) {
        dblib.assertErrorCode(err, res, "attachQuoteToOpportunity", -2);
        done();
      });
    });

    it("should fail with a quote that already has an opportunity", function(done) {
      var sql = "SELECT attachQuoteToOpportunity($1, $2) AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ quheadfail,
                                          ophead ] });

      datasource.query(sql, cred, function (err, res) {
        dblib.assertErrorCode(err, res, "attachQuoteToOpportunity", -3);
        done();
      });
    });

    it("should run without error", function (done) {
      var sql = "SELECT attachQuoteToOpportunity($1, $2) AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ quheadsucceed,
                                          ophead ] });

      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rows[0].result, 0);
        done();
      });
    });
/*
    after(function () {
      var sql = "DELETE FROM quhead WHERE quhead_id=$1;",
      cred = _.extend({}, adminCred, { parameters: [ quheadsucceed ] });

      datasource.query(sql, cred);
    });
*/
  });
})();
