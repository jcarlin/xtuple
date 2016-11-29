var _      = require('underscore'),
    assert = require('chai').assert,
    dblib  = require('../dblib');

(function () {
  'use strict';

  describe('applyapcredits()', function () {

    var adminCred  = dblib.adminCred,
        datasource = dblib.datasource,
        vend
        ;

    it("needs a vendor", function(done) {
      var sql = "SELECT vend_id FROM vendinfo" +
                " WHERE EXISTS(SELECT 1 FROM apopen WHERE apopen_vend_id=vend_id)" +
                " LIMIT 1;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        vend = res.rows[0].vend_id;
        done();
      });
    });

    it("should run without error", function (done) {
      var sql = "SELECT applyapcredits($1) AS result;",
          cred = _.extend({}, adminCred,
                          { parameters: [ vend ] });

      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rows[0].result, 1);
        done();
      });
    });
  });
})();
