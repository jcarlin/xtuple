var _      = require('underscore'),
    assert = require('chai').assert,
    dblib  = require('../dblib');

(function () {
  'use strict';

  describe('adjustInvValue()', function () {

    var adminCred  = dblib.adminCred,
        datasource = dblib.datasource,
        itemsite,
        accnt
        ;

    it("needs an itemsite", function(done) {
      var sql = "SELECT itemsite_id FROM itemsite" +
                " LIMIT 1;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        itemsite = res.rows[0].itemsite_id;
        done();
      });
    });

    it("needs an accnt", function(done) {
      var sql = "SELECT accnt_id FROM accnt" +
                " LIMIT 1;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        accnt = res.rows[0].accnt_id;
        done();
      });
    });

    it("should fail with an invalid itemsite", function(done) {
      var sql = "SELECT adjustInvValue(-1, 1.0, $1) AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ accnt ] });

      datasource.query(sql, cred, function (err, res) {
        dblib.assertErrorCode(err, res, "adjustInvValue", -1);
        done();
      });
    });

    it("should run without error", function (done) {
      var sql = "SELECT adjustInvValue($1, 1.0, $2) AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ itemsite,
                                          accnt ] });

      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        assert.operator(res.rows[0].result, '>', 0);
        done();
      });
    });
  });
})();
