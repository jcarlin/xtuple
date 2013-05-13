/*jshint indent:2, curly:true eqeqeq:true, immed:true, latedef:true,
newcap:true, noarg:true, regexp:true, undef:true, strict:true, trailing:true
white:true*/
/*global XT:true, XM:true, Backbone:true, _:true, console:true */

(function () {
  "use strict";

  /**
    @class

    @extends XM.Document
  */
  XM.SiteType = XM.Document.extend(/** @lends XM.Site.prototype */{

    recordType: 'XM.SiteType',

    documentKey: 'name'

  });

  /**
    @class

    @extends XM.Document
  */
  XM.Site = XM.Document.extend(/** @lends XM.Site.prototype */{

    recordType: 'XM.Site',

    documentKey: 'code'

  });

  /**
    @class

    @extends XM.Comments
  */
  XM.SiteComment = XM.Comment.extend(/** @lends XM.SiteComment.prototype */{

    recordType: 'XM.SiteComment',

    sourceName: 'W'

  });

  /**
    @class

    @extends XM.Info
  */
  XM.SiteRelation = XM.Info.extend(/** @lends XM.SiteRelation.prototype */{

    recordType: 'XM.SiteRelation',

    editableModel: 'XM.Site'

  });

  /**
    @class

    @extends XM.Info
  */
  XM.SiteListItem = XM.Info.extend(/** @lends XM.SiteListItem.prototype */{

    recordType: 'XM.SiteListItem',

    editableModel: 'XM.Site'

  });

  // ..........................................................
  // COLLECTIONS
  //

  /**
    @class

    @extends XM.Collection
  */
  XM.SiteCollection = XM.Collection.extend(/** @lends XM.SiteCollection.prototype */{

    model: XM.Site
  });

  /**
    @class

    @extends XM.Collection
  */
  XM.SiteTypeCollection = XM.Collection.extend(/** @lends XM.SiteTypeCollection.prototype */{

    model: XM.SiteType
  });

  /**
    @class

    @extends XM.Collection
  */
  XM.SiteRelationCollection = XM.Collection.extend(/** @lends XM.SiteRelationCollection.prototype */{

    model: XM.SiteRelation
  });

  /**
    @class

    @extends XM.Collection
  */
  XM.SiteListItemCollection = XM.Collection.extend(/** @lends XM.SiteListItemCollection.prototype */{

    model: XM.SiteListItem
  });

}());
