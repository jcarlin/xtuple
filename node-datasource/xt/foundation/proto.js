/*jshint node:true, indent:2, curly:false, eqeqeq:true, immed:true, latedef:true, newcap:true, noarg:true,
regexp:true, undef:true, strict:true, trailing:true, white:true */
/*global X:true */

(function () {
  "use strict";

  X.proto = {};

  require("./string");

  X.mixin(Array.prototype, {
    contains: function (needle) {
      return (this.indexOf(needle) > -1);
    }
  });

  X.mixin(String.prototype, {
    format: function () {
      return X.String.format.apply(this, arguments);
    },

    f: function () {
      return X.String.format.apply(this, arguments);
    },

    capitalize: function () {
      return X.String.capitalize.apply(this, arguments);
    },

    cap: function () {
      return X.String.capitalize.apply(this, arguments);
    },

    trim: function () {
      return X.String.trim.apply(this, arguments);
    },

    pre: function () {
      return X.String.pre.apply(this, arguments);
    },

    suf: function () {
      return X.String.suf.apply(this, arguments);
    },

    camelize: function () {
      return X.String.camelize.apply(this, arguments);
    },

    camelToHyphen: function () {
      return X.String.camelToHyphen.apply(this, arguments);
    },

    decamelize: function () {
      return X.String.decamelize.apply(this, arguments);
    },

    escape: function () {
      return X.String.escape.call(this);
    }
  });
}());
