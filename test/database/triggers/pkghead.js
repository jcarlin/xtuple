var _    = require('underscore'),
  assert = require('chai').assert,
  dblib  = require('../dblib');

(function () {
  'use strict';

  describe('pkghead trigger(s) test', function () {
    var datasource  = dblib.datasource,
        adminCred   = dblib.generateCreds(),
        start       = new Date(),
        pkghead
        ;

    it('should allow inserting a pkghead record', function (done) {
      var sql = "INSERT INTO pkghead ("                                 +
                "  pkghead_name, pkghead_descrip, pkghead_version,"     +
                "  pkghead_developer, pkghead_notes, pkghead_created,"  +
                "  pkghead_updated,   pkghead_indev"                    +
                ") VALUES ("                                            +
                "  'testpkg',    'testing',  '1.0.0-alpha',"            +
                "  'TestDev',    'notes!',   now() + interval '1 day'," +
                "  now() + interval '2 days', false"                    +
                ") RETURNING *;"
                ;

      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount, 1);
        pkghead = res.rows[0];

        assert.operator(pkghead.pkghead_id, ">", 0);
        assert.equal(pkghead.pkghead_created.getDate(), start.getDate());
        assert.equal(pkghead.pkghead_updated.getDate(), start.getDate());
        assert.equal(pkghead.pkghead_updated.valueOf(), pkghead.pkghead_created.valueOf());

        done();
      });
    });

    it('should allow updating a pkghead', function (done) {
      var sql = "UPDATE pkghead SET pkghead_indev = true"     +
                " WHERE pkghead_id = $1"                      +
                " RETURNING *;",
          options = _.extend({}, adminCred,
                             { parameters: [ pkghead.pkghead_id ] });
      datasource.query(sql, options, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount, 1);
        assert.isTrue(res.rows[0].pkghead_indev);
        assert.equal(res.rows[0].pkghead_created.valueOf(), pkghead.pkghead_created.valueOf());
        assert.operator(res.rows[0].pkghead_updated.valueOf(), ">", pkghead.pkghead_created.valueOf());
        pkghead = res.rows[0];
        done();
      });
    });

    it('should not allow deleting the pkghead without a schema', function (done) {
      var sql = "DELETE FROM pkghead WHERE pkghead_id = $1"     +
                " RETURNING *;",
          options = _.extend({}, adminCred,
                             { parameters: [ pkghead.pkghead_id ] });
      datasource.query(sql, options, function (err, res) {
        assert.isNotNull(err);
        done();
      });
    });

    it('needs a schema matching the pkghead', function (done) {
      var sql = "CREATE SCHEMA testpkg;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        done();
      });
    });

    it('should allow deleting the pkghead', function (done) {
      var sql = "DELETE FROM pkghead WHERE pkghead_id = $1"     +
                " RETURNING *;",
          options = _.extend({}, adminCred,
                             { parameters: [ pkghead.pkghead_id ] });
      datasource.query(sql, options, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount, 1);
        assert.equal(res.rows[0].pkghead_id, pkghead.pkghead_id);
        done();
      });
    });

    it('should have removed the pkghead', function (done) {
      var sql = "SELECT EXISTS(SELECT 1 FROM pkghead"   +
                "               WHERE pkghead_name = 'testpkg') AS result;";
      datasource.query(sql, adminCred, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount, 1);
        assert.isFalse(res.rows[0].result);
        done();
      });
    });

  });
}());
