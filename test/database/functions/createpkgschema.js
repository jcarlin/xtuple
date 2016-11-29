var _      = require('underscore'),
    assert = require('chai').assert,
    dblib  = require('../dblib');

(function () {
  'use strict';
  describe('createpkgschema()', function () {

    var datasource = dblib.datasource,
        creds      = dblib.adminCred,
        firstOid   = -1;

    it('needs no existing pkg to test properly', function (done) {
      var sql = "select exists(select 1 from pkghead"   +
                "               where pkghead_name = 'test') as result;";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount, 1);
        assert.isFalse(res.rows[0].result);
        done();
      })
    });

    it('should create a schema', function (done) {
      var sql = "select createpkgschema('test', 'test comment') as soid;";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        firstOid = res.rows[0].soid;
        assert.isTrue(firstOid >= 0);
        done();
      });
    });

    it('should have created several tables', function (done) {
      var sql = "select relname"                                        +
                "  from pg_class c"                                     +
                "  join pg_namespace n on c.relnamespace = n.oid"       +
                " where nspname = 'test';";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        _.each([ "pkgcmd",    "pkgcmdarg", "pkgimage", "pkgmetasql", "pkgpriv",
                 "pkgreport", "pkgscript", "pkguiform" ],
               function (table) {
                 assert.isObject(_.find(res.rows, function (row) {
                   return row.relname === table;
                 }), table);
              });
        done();
      });
    });

    it('should have created a pkghead record', function (done) {
      var sql = "select count(*) as result from pkghead"   +
                " where pkghead_name = 'test';";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount, 1);
        assert.equal(res.rows[0].result, 1);
        done();
      })
    });

    it('should be idempotent', function (done) {
      var sql = "select createpkgschema('test', 'test comment') as soid;";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        assert.equal(firstOid, res.rows[0].soid);
        assert.operator(firstOid, ">=", 0);
        done();
      });
    });

    it('should not have created a second pkghead record', function (done) {
      var sql = "select count(*) as result from pkghead"   +
                " where pkghead_name = 'test';";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount, 1);
        assert.equal(res.rows[0].result, 1);
        done();
      })
    });

    after(function (done) {
      var sql = "select deletepackage(pkghead_id) from pkghead" +
                " where pkghead_name = 'test';";
      datasource.query(sql, creds, done);
    });
  });
})();
