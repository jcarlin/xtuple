var _ = require("underscore"),
  assert = require('chai').assert,
  path = require('path');

(function () {
  "use strict";
  describe('Document Associations', function () {
    var loginData = require(path.join(__dirname, "../lib/login_data.js")).data,
      datasource = require('../../node-datasource/lib/ext/datasource').dataSource,
      config = require(path.join(__dirname, "../../node-datasource/config.js")),
      creds = config.databaseServer,
      databaseName = loginData.org,
      id, type;

    this.timeout(60*1000);      // the docinfo view is slow

    it('should succeed calling login() to set search_path', function (done) {
      var sql = "select login() as result;";
      creds.database = databaseName;
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        var result = res.rows[0].result;
        assert(res.rows[0].result >= 0, 'login() returned without error');
        done();
      });
    });

    it('should have a reasonable search_path', function (done) {
      var sql = "select show_search_path() as result;";
      creds.database = databaseName;
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        var path = res.rows[0].result;
        console.log(path);
        assert.match(path, /xt/,         'search path includes xt');
        assert.match(path, /public/,     'search path includes public');
        assert.match(path, /api/,        'search path includes api');
        done();
      });
    });

    it('should be retrievable from the function', function (done) {
      var sql = "select * from _docinfo("                       +
                "  (select docass_source_id"                    +
                "    from docass order by docass_id limit 1),"  +
                "  (select docass_source_type"                  +
                "     from docass order by docass_id limit 1));";
      creds.database = databaseName;
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        assert(res.rowCount >= 1);
        id   = res.rows[0].source_id;
        type = res.rows[0].source_type;
        done();
      });
    });

    it('should be retrievable from the view (but slow)', function (done) {
      var sql = "select * from docinfo"   +
                " where source_id   = $1" +
                "   and source_type = $2;",
          cred = _.extend({}, creds, { database: databaseName,
                                       parameters: [ id, type ] });
      datasource.query(sql, cred, function (err, res) {
        assert.isNull(err);
        assert(res.rowCount >= 1);
        done();
      });
    });

  });
}());
