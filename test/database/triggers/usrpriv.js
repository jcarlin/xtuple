var _      = require("underscore"),
    assert = require("chai").assert;

(function () {
  "use strict";

  describe("usrpriv trigger", function () {
    var dblib      = require('../dblib.js'),
        adminCred  = dblib.adminCred,
        datasource = dblib.datasource,
        otherCred  = dblib.generateCreds('manager'),
        groupid    = -1,
        addPrivSql = "insert into usrpriv (" +
                     "  usrpriv_priv_id, usrpriv_username"   +
                     ") select priv_id, $1" +
                     "    from priv where priv_name = $2;",
        testPriv  = "fixACL"
    ;

    it('needs manager group', function (done) {
      var result;
      dblib.createGroup('manager', 'managers group', result, done);
    });

    it("needs group members to maintain privileges", function (done) {
      dblib.grantPrivToGroup('manager', 'MaintainUsers', done);
    });

    it("needs an unprivileged user", function (done) {
      dblib.createUser(otherCred, done);
    });

    it("should prevent the unprivileged user from granting privs", function (done) {
      var other = _.extend({}, otherCred,
                           { parameters: [ otherCred.user, testPriv ] });
      datasource.query(addPrivSql, other, function (err, res) {
        assert.isNotNull(err, "expect an error adding a privilege");
        assert.isTrue(String(err).indexOf("modify") > 0);
        done();
      });
    });

    it("should grant the unprivileged user direct priv", function (done) {
      dblib.grantPrivToUser(otherCred, 'MaintainUsers', done);
    });

    it("should allow the unprivileged user to grant privs", function (done) {
      var other = _.extend({}, otherCred,
                           { parameters: [ otherCred.user, testPriv ] });
      datasource.query(addPrivSql, other, function (err, res) {
        assert.isNull(err, "expect no error adding a privilege");
        done();
      });
    });

    it("should revoke the unprivileged user direct priv", function (done) {
      var sql = "select revokePriv($1, 'MaintainUsers') as ok;",
          admin = _.extend({}, adminCred, { parameters: [ otherCred.user ] });
      datasource.query(sql, admin, function (err, res) {
        assert.equal(res.rowCount, 1);
        assert.isTrue(res.rows[0].ok, "the priv should be revoked");
        done();
      });
    });

    it("should prevent the unprivileged user from granting privs", function (done) {
      var other = _.extend({}, otherCred,
                           { parameters: [ otherCred.user, testPriv ] });
      datasource.query(addPrivSql, other, function (err, res) {
        assert.isNotNull(err, "expect an error adding a privilege");
        assert.isTrue(String(err).indexOf("modify") > 0);
        done();
      });
    });

    it('should add user to manager group', function (done) {
      dblib.addUserToGroup(otherCred.user, 'manager', done);
    });

    it("should allow the unprivileged user to grant privs", function (done) {
      var other = _.extend({}, otherCred,
                           { parameters: [ otherCred.user, testPriv ] });
      datasource.query(addPrivSql, other, function (err, res) {
        assert.isNull(err, "expect no error adding a privilege");
        done();
      });
    });

    it("should prevent granting an invalid priv", function (done) {
      var sql = "insert into usrpriv(usrpriv_priv_id, usrpriv_username" +
                ") values (-256, $1);",
          admin = _.extend({}, adminCred, { parameters: [ otherCred.user ] });
      datasource.query(sql, admin, function (err, res) {
        assert.isNotNull(err, "expect no error adding a privilege");
        assert.isTrue(String(err).indexOf("exist") > 0);
        done();
      });
    });

    after(function (done) {
      var sql = "select revokeGroup($1, $2);",
          admin = _.extend({}, adminCred,
                           { parameters: [ otherCred.user, groupid ] });
      datasource.query(sql, admin, done);
    });

    after(function (done) {
      var sql = "select revokePrivGroup($1, priv_id)" +
		"  from priv where priv_name = 'MaintainUsers';",
          admin = _.extend({}, adminCred, { parameters: [ groupid ] });
      datasource.query(sql, admin, done);
    });

    after(function (done) {
      var sql = "delete from grp where grp_id = $1;",
          admin = _.extend({}, adminCred, { parameters: [ groupid ] });
      datasource.query(sql, admin, done);
    });

    after(function (done) {
      var sql = "delete from usrpriv where usrpriv_username = $1;",
          admin = _.extend({}, adminCred, { parameters: [ otherCred.user ] });
      datasource.query(sql, admin, done);
    });

    after(function (done) {
      var sql = "delete from xt.usrlite where usr_username = $1;",
          admin = _.extend({}, adminCred, { parameters: [ otherCred.user ] });
      datasource.query(sql, admin, done);
    });

    after(function (done) {
      var sql = "drop user " + otherCred.user + ";";
      datasource.query(sql, adminCred, done);
    });

  });
})();
