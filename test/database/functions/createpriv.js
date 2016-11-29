var _ = require("underscore"),
  assert = require('chai').assert,
  path = require('path');

(function () {
  "use strict";
  describe('createPriv()', function () {

    var loginData = require(path.join(__dirname, "../../lib/login_data.js")).data,
      datasource = require('../../../node-datasource/lib/ext/datasource').dataSource,
      config = require(path.join(__dirname, "../../../node-datasource/config.js")),
      creds = _.extend({}, config.databaseServer, {database: loginData.org}),
      id = {},
      tableoid = {};

    it("should create a new priv test3Args", function (done) {
      var sql = "select createPriv('test', 'test3Args',"        +
                "'call createPriv with 3 args') as result;";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        id.test3Args = res.rows[0].result;
        assert(id.test3Args > 0);
        done();
      });
    });

    it("should have set 3 columns", function (done) {
      var sql = "select *, tableoid from priv where priv_name = 'test3Args';";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount,             1);
        assert.equal(res.rows[0].priv_id,      id.test3Args);
        assert.equal(res.rows[0].priv_module,  'test');
        assert.equal(res.rows[0].priv_descrip, 'call createPriv with 3 args');
        assert.isNull(res.rows[0].priv_seq);
        tableoid.test3Args = res.rows[0].tableoid;
        done();
      });
    });

    it("should not create a new test3Args", function (done) {
      var sql = "select createPriv('test', 'test3Args',"        +
                "'update createPriv with 3 args') as result;";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rows[0].result, id.test3Args);
        done();
      });
    });

    it("should have updated test3Args", function (done) {
      var sql = "select *, tableoid from priv where priv_name = 'test3Args';";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount,             1);
        assert.equal(res.rows[0].priv_id,      id.test3Args);
        assert.equal(res.rows[0].priv_module,  'test');
        assert.equal(res.rows[0].priv_descrip, 'update createPriv with 3 args');
        assert.isNull(res.rows[0].priv_seq);
        assert.equal(res.rows[0].tableoid, tableoid.test3Args);
        done();
      });
    });

    /************************************/

    it("should create a new priv test4Args", function (done) {
      var sql = "select createPriv('test', 'test4Args',"        +
                "'call createPriv with 4 args', 10) as result;";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        id.test4Args = res.rows[0].result;
        assert(id.test4Args > 0);
        assert(id.test4Args > id.test3Args);
        done();
      });
    });

    it("should have set 4 columns", function (done) {
      var sql = "select *, tableoid from priv where priv_name = 'test4Args';";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount,             1);
        assert.equal(res.rows[0].priv_id,      id.test4Args);
        assert.equal(res.rows[0].priv_module,  'test');
        assert.equal(res.rows[0].priv_descrip, 'call createPriv with 4 args');
        assert.equal(res.rows[0].priv_seq,     10);
        tableoid.test4Args = res.rows[0].tableoid;
        assert.equal(tableoid.test4Args, tableoid.test3Args);
        done();
      });
    });

    it("should not create a new priv test4Args", function (done) {
      var sql = "select createPriv('test', 'test4Args',"        +
                "'update createPriv with 4 args', 20) as result;";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rows[0].result, id.test4Args);
        done();
      });
    });

    it("should have updated the test4Args", function (done) {
      var sql = "select * from priv where priv_name = 'test4Args';";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount,             1);
        assert.equal(res.rows[0].priv_id,      id.test4Args);
        assert.equal(res.rows[0].priv_module,  'test');
        assert.equal(res.rows[0].priv_descrip, 'update createPriv with 4 args');
        assert.equal(res.rows[0].priv_seq,     20);
        done();
      });
    });

    /************************************/

    it("should create a new priv test5Args", function (done) {
      var sql = "select createPriv('test', 'test5Args',"        +
                "'call createPriv with 5 args', 10, 'xt') as result;";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        id.test5Args = res.rows[0].result;
        assert(id.test5Args > 0);
        assert(id.test5Args > id.test3Args);
        assert(id.test5Args > id.test4Args);
        done();
      });
    });

    it("should have set 4 columns with 5 args", function (done) {
      var sql = "select *, tableoid from priv where priv_name = 'test5Args';";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount,             1);
        assert.equal(res.rows[0].priv_id,      id.test5Args);
        assert.equal(res.rows[0].priv_module,  'test');
        assert.equal(res.rows[0].priv_descrip, 'call createPriv with 5 args');
        assert.equal(res.rows[0].priv_seq,     10);
        tableoid.test5Args = res.rows[0].tableoid;
        assert.notEqual(tableoid.test5Args, tableoid.test3Args);
        done();
      });
    });

    it("should not create a new priv test5Args", function (done) {
      var sql = "select createPriv('test', 'test5Args',"        +
                "'update createPriv with 5 args', 20) as result;";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rows[0].result, id.test5Args);
        done();
      });
    });

    it("should have updated the test5Args", function (done) {
      var sql = "select *, tableoid from priv where priv_name = 'test5Args';";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount,             1);
        assert.equal(res.rows[0].priv_id,      id.test5Args);
        assert.equal(res.rows[0].priv_module,  'test');
        assert.equal(res.rows[0].priv_descrip, 'update createPriv with 5 args');
        assert.equal(res.rows[0].priv_seq,     20);
        assert.equal(tableoid.test5Args, res.rows[0].tableoid);
        done();
      });
    });

    /************************************/

    it("should have created 3 privs in 'test' module", function (done) {
      var sql = "select *, tableoid from priv where priv_module = 'test';";
      datasource.query(sql, creds, function (err, res) {
        assert.isNull(err);
        assert.equal(res.rowCount,            3);
        done();
      });
    });

    after(function (done) {
      var sql = "delete from priv where priv_module = 'test';";
      datasource.query(sql, creds, done);
    });

  });
}());
