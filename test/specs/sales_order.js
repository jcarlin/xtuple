/*jshint indent:2, curly:true, eqeqeq:true, immed:true, latedef:true,
newcap:true, noarg:true, regexp:true, undef:true, strict:true, trailing:true,
white:true*/
/*global XV:true, XT:true, _:true, console:true, XM:true, Backbone:true, require:true, assert:true,
setTimeout:true, before:true, clearTimeout:true, exports:true, it:true, describe:true, beforeEach:true */

(function () {
  "use strict";

  var async = require("async"),
    _ = require("underscore"),
    common = require("../lib/common"),
    assert = require("chai").assert;
  var newSalesOrder;

  //
  // Complicated business logic for quote and sales order saving
  //
  var primeSubmodels = function (done) {
    var submodels = {};
    async.series([
      function (callback) {
        submodels.customerModel = new XM.CustomerProspectRelation();
        submodels.customerModel.fetch({number: "TTOYS", success: function () {
          callback();
        }});
      },
      function (callback) {
        submodels.itemModel = new XM.ItemRelation();
        submodels.itemModel.fetch({number: "BTRUCK1", success: function () {
          callback();
        }});
      },
      function (callback) {
        submodels.siteModel = new XM.SiteRelation();
        submodels.siteModel.fetch({code: "WH1", success: function () {
          callback();
        }});
      }
    ], function (err) {
      done(submodels);
    });
  };

  //
  // Useful for any model that uses XM.SalesOrderLineMixin
  //
  var getBeforeSaveAction = function (lineRecordType) {
    return function (data, next) {
      var lineItem = new XM[lineRecordType.substring(3)](),
        itemInitialized = function (submodels) {
          var unitUpdated = function () {
            // make sure all the fields we need to save successfully have been calculated
            if ((lineRecordType === "XM.PurchaseOrderLine" || lineItem.get("price")) &&
                (!_.contains(lineItem.getAttributeNames(), "customerPrice") || lineItem.get("customerPrice"))) {

              //lineItem.off("all", unitUpdated);
              if (!movedOn) {
                movedOn = true;
                next();
              }
            }
          };

          // Changing the item site will trigger a change which will ultimately change these three
          // fields. Run the callback when they all have been set.
          lineItem.on("all", unitUpdated);
          data.model.get("lineItems").add(lineItem);
          // XXX This currency should be already set
          var currency = _.find(XM.currencies.models, function (curr) {
            return curr.get("isBase");
          });
          data.model.set({currency: currency});
          lineItem.setIfExists({dueDate: new Date()});
          lineItem.setIfExists({quantity: 7});
          lineItem.setIfExists({billed: 7});
          lineItem.setIfExists({credited: 7});
          lineItem.set({item: submodels.itemModel});
          lineItem.set({site: submodels.siteModel});
        };


      var movedOn = false;
      lineItem.on("statusChange", function () {
        if (lineItem.getStatus() === XM.Model.READY_NEW) {
          primeSubmodels(itemInitialized);
        }
      });
      lineItem.initialize(null, {isNew: true});
    };
  };
  /**
    Sales Order Description
    @class
    @alias SalesOrder
  */
  var spec = {
    recordType: "XM.SalesOrder",
    collectionType: "XM.SalesOrderListItemCollection",
    cacheName: null,
    listKind: "XV.SalesOrderList",
    instanceOf: "XM.Document",
    /**
      @member -
      @memberof SalesOrder
      @description Sales orders are lockable.
    */
    isLockable: true,
    /**
      @member -
      @memberof SalesOrder
      @description The ID attribute is "number", which will be automatically uppercased.
    */
    idAttribute: "number",
    enforceUpperKey: true,
    attributes: ["number", "characteristics"],
    /**
      @member -
      @memberof SalesOrder
      @description Used in the sales module
    */
    extensions: ["sales"],
    /**
      @member -
      @memberof SalesOrder
      @description Sales Orders can be read by people with "ViewSalesOrders"
       and can be created, updated,
       or deleted by users with the "MaintainSalesOrders" privilege.
    */
    privileges: {
      createUpdateDelete: "MaintainSalesOrders",
      read: "ViewSalesOrders"
    },
    createHash: {
      customer: { number: "TTOYS" },
      terms: { code: "2-10N30" }
    },
    //
    // An extra bit of work we have to do after the createHash fields are set:
    // create a valid line item.
    //
    beforeSaveActions: [{it: 'sets up a valid line item',
      action: getBeforeSaveAction("XM.SalesOrderLine")}],
    afterSaveActions: [{it: 'has the credit card information', action: function (data, next) {
      newSalesOrder = data.model;
      //assert.equal(data.model.getValue("customer.creditCards")
        //.models[0].get("number"), "************1111");
      // XXX: the commented-out code is better but relies on the encrpytion key being the demo key
      // TODO: populate our own credit card into customer and test that
      assert.equal(data.model.getValue("customer.creditCards").models[0]
        .get("number").substring(0, 12), "************");
      next();
    }}],
    beforeSaveUIActions: [{it: 'sets up a valid line item',
      action: function (workspace, done) {
        var gridRow,
          gridBox = workspace.$.salesOrderLineItemBox;

        primeSubmodels(function (submodels) {
          gridBox.newItem();
          gridRow = gridBox.$.editableGridRow;
          gridRow.$.itemSiteWidget.doValueChange({value: {item: submodels.itemModel,
            site: submodels.siteModel}});
          gridRow.$.quantityWidget.doValueChange({value: 5});
          setTimeout(function () {
            done();
          }, 3000);
        });
      }
    }],
    updateHash: {
      orderNotes: "foo"
    }
  };

  // Don't CRUD test update or delete. Test uses the created Sales Order for workflow testing.
  spec.skipDelete = true;
  spec.skipUpdate = true;

  var additionalTests = function () {

    describe("Sales order business logic", function () {
      it('should take the defaults from the customer', function (done) {
        var terms = new XM.Terms(),
          customer = new XM.SalesCustomer(),
          salesOrder = new XM.SalesOrder(),
          initCallback = function () {
            terms.set({code: "COD"});
            customer.set({terms: terms, billtoContact: "Bob"});
            assert.equal(salesOrder.getValue("terms.code"), "");
            salesOrder.set({customer: customer});

            // The customer.terms.code gets copied to terms.code.
            assert.equal(salesOrder.getValue("terms.code"), "COD");
            done();
          };

        salesOrder.on('change:number', initCallback);
        salesOrder.initialize(null, {isNew: true});
      });

      it.skip("Action gear exists in the Salesorder workspace with two options :" +
              "Issue to Shipping and Express Checkout", function () {});

      it.skip("Selecting 'Issue to Shipping' should open the Issue to Shipping screen" +
              "with the Sales order prepopulated", function () {});

      it.skip("The user should be required to save the sales order before issuing to  " +
              "shipping if the sales order is in unsaved state", function () {});

      describe.skip("Express Checkout", function () {
        it("should Issue all outstanding materials", function () {});

        it("should Prompt user for distribution detail if applicable", function () {});

        it("should Approve for billing", function () {});

        it("should create and print invoice", function () {});
      });

      it.skip("User requires 'IssueStockToShipping' and 'PostMiscInvoices' privileges assigned" +
              "to it to access Express Checkout option", function () {});
    });

    describe("Sales order characteristics", function () {
      it("XM.Characteristic includes isSalesOrders as a context attribute", function () {
        var characteristic = new XM.Characteristic();
        assert.include(characteristic.getAttributeNames(), "isSalesOrders");
      });

      it("convention for characteristic assignments", function () {
        var model;

        assert.isFunction(XM.SalesOrderCharacteristic);
        model = new XM.SalesOrderCharacteristic();
        assert.isTrue(model instanceof XM.CharacteristicAssignment);
      });

      it("can be set by a widget in the characteristics workspace", function () {
        var characteristicWorkspace = new XV.CharacteristicWorkspace();
        assert.include(_.map(characteristicWorkspace.$, function (control) {
          return control.attr;
        }), "isSalesOrders");
      });
    });

    describe("Sales Order list", function () {
      it("XV.SalesOrderList should be printable", function () {
        var list = new XV.SalesOrderList(),
          actions = list.actions;
        assert.include(_.pluck(actions, 'name'), 'printForm');
        assert.include(_.pluck(actions, 'name'), 'email');
      });
    });

    describe("Sales Order workspace", function () {
      it("XV.SalesOrderWorkspace should have these actions: ", function () {
        var workspace = new XV.SalesOrderWorkspace(),
          actions = workspace.actions;
        assert.include(_.pluck(actions, 'name'), 'email');
      });
    });

    describe("Sales order workflow", function () {
      var isSalesOrdersChar,
        salesOrderModel,
        workflowModel;

      before(function (done) {
        async.parallel([
          function (done) {
            var saleTypeChar = new XM.Characteristic();
            var reloadSalesOrdersChar = new XM.Characteristic();

            saleTypeChar.initialize(null, {isNew: true});
            saleTypeChar.set({
              name: "TESTSALESORDERCHAR" + Math.random(),
              isSalesOrders: true,
              isSearchable: true
            });

            var fetchSalesOrdersCharSuccess = function () {
              isSalesOrdersChar = reloadSalesOrdersChar;
              // Everything is setup. Continue.
              done();
            };

            var saveSaleCharSuccess = function () {
              reloadSalesOrdersChar.fetch({
                name: saleTypeChar.get("name"),
                success: fetchSalesOrdersCharSuccess
              });
            };

            saleTypeChar.save(null, {
              success: saveSaleCharSuccess
            });
          },
          function (done) {
            salesOrderModel = newSalesOrder;
            done();
          },
          function (done) {
            common.initializeModel(workflowModel, XM.SalesOrderWorkflow, function (err, model) {
              workflowModel = model;
              done();
            });
          }
        ], done);
      });

      // TODO: This is somewhat limited.
      it("can get added to a sales order", function () {
        var workflowCount;

        assert.isTrue(workflowModel.isReady());
        workflowModel.set({
          name: "First step",
          priority: XM.priorities.models[0]
        });
        workflowCount = salesOrderModel.get("workflow").length;
        salesOrderModel.get("workflow").add(workflowModel);
        assert.equal(salesOrderModel.get("workflow").length - workflowCount, 1);
        salesOrderModel.get("workflow").remove(workflowModel);
      });

      it.skip("Workflows can be added, updated and removed to an existing Sales order", function () {});

      it.skip("Sales orders cannot be saved with incomplete workflows", function () {});

      describe("when the sale type changes", function () {
        var saleTypeModel;
        this.timeout(6000);

        before(function (done) {
          async.parallel([
            function (done) {
              common.initializeModel(saleTypeModel, XM.SaleType, function (err, model) {
                var saleTypeChar = new XM.SaleTypeCharacteristic();
                var reloadSalesOrder = new XM.SalesOrder();

                saleTypeChar.initialize(null, {isNew: true});
                saleTypeChar.set({
                  characteristic: isSalesOrdersChar,
                  value: "testvalue"
                });

                var saleTypeWf = new XM.SaleTypeWorkflow();
                saleTypeWf.initialize(null, {isNew: true});
                saleTypeWf.set({
                  name: "First step",
                  priority: XM.priorities.models[0],
                  workflowType: XM.SalesOrderWorkflow.TYPE_CREDIT_CHECK
                });

                saleTypeModel = model;
                saleTypeModel.set({
                  code: "TESTSALE" + Math.random(),
                  description: "Test Sale Type",
                  defaultHoldType: "N"
                });
                saleTypeModel.get("characteristics").add(saleTypeChar);
                saleTypeModel.get("workflow").add(saleTypeWf);

                // When `XM.SalesOrder.saleTypeDidChange()` triggers `notify("_updateHoldType?", ...)`, confirm it.
                salesOrderModel.on('notify', function (model, value, options) {
                  options.callback({answer: true})
                });

                var fetchSalesOrderSucess = function () {
                  salesOrderModel = reloadSalesOrder;
                  // Everything is setup. Continue.
                  done();
                };

                var saveSalesOrderSuccess = function () {
                  reloadSalesOrder.fetch({
                    number: salesOrderModel.get("number"),
                    success: fetchSalesOrderSucess
                  });
                };

                var saveSaleTypeSuccess = function () {
                  salesOrderModel.set({saleType: saleTypeModel});
                  salesOrderModel.save(null, {
                    success: saveSalesOrderSuccess
                  });
                };

                saleTypeModel.save(null, {
                  success: saveSaleTypeSuccess
                });
              });
            }
          ], done);
        });

        it("copies sale type hold type", function () {
          assert.equal(salesOrderModel.get("holdType"), "N");
        });

        it("copies sale type characteristics", function (done) {
          var salesOrderChar;
          var saleTypeChar = saleTypeModel.get("characteristics").models[0];

          assert.equal(salesOrderModel.get("characteristics").length, 1);
          salesOrderChar = salesOrderModel.get("characteristics").models[0];
          assert.equal(salesOrderChar.recordType, "XM.SalesOrderCharacteristic");
          assert.equal(salesOrderChar.get("value"), saleTypeChar.get("value"));
          assert.equal(salesOrderChar.get("characteristic").id,
            saleTypeChar.get("characteristic").id);

          done();
        });

        it("copies sale type workflow", function () {
          var salesOrderWorkflow;
          var saleTypeWorkflow = saleTypeModel.get("workflow").models[0];

          assert.equal(salesOrderModel.get("workflow").length, 1);
          salesOrderWorkflow = salesOrderModel.get("workflow").models[0];
          assert.equal(salesOrderWorkflow.recordType, "XM.SalesOrderWorkflow");
          assert.equal(salesOrderWorkflow.get("name"), saleTypeWorkflow.get("name"));
          assert.equal(salesOrderWorkflow.get("priority").id,
            saleTypeWorkflow.get("priority").id);
        });

        // TODO: Reimplement in inventory?
        it.skip("The due date for Pack workflow items will default to the Pack date on the order", function () {
          var copiedWorkflow;

          saleTypeModel.get("workflow").models[0]
            .set({workflowType: XM.SalesOrderWorkflow.TYPE_PACK});
          salesOrderModel.set({packDate: new Date("1/1/2004")});
          salesOrderModel.set({saleType: saleTypeModel});
          assert.equal(salesOrderModel.get("workflow").length, 1);
          copiedWorkflow = salesOrderModel.get("workflow").models[0];
          assert.equal(copiedWorkflow.get("dueDate").getDate(), new Date("1/1/2004").getDate());
        });

        // TODO: Reimplement in inventory?
        it.skip("The due date for Ship workflow items will default to the schedule date on the order", function () {
          var copiedWorkflow;

          saleTypeModel.get("workflow").models[0]
            .set({workflowType: XM.SalesOrderWorkflow.TYPE_SHIP});
          salesOrderModel.set({scheduleDate: new Date("1/10/2004")});
          salesOrderModel.set({saleType: saleTypeModel});
          assert.equal(salesOrderModel.get("workflow").length, 1);
          copiedWorkflow = salesOrderModel.get("workflow").models[0];
          assert.equal(copiedWorkflow.get("dueDate").getDate(), new Date("1/10/2004").getDate());
        });


        it("When hold type of an order is changed to None, all credit " +
           "check type workflow items will be marked completed.", function () {
          var copiedWorkflow;

          assert.equal(salesOrderModel.get("workflow").length, 1);
          salesOrderModel.set({holdType: XM.holdTypes.models[0]});
          copiedWorkflow = salesOrderModel.get("workflow").models[0];
          assert.notEqual(copiedWorkflow.get("status"), XM.Workflow.COMPLETED);
          salesOrderModel.set({holdType: undefined});
          copiedWorkflow = salesOrderModel.get("workflow").models[0];
          assert.equal(copiedWorkflow.get("status"), XM.Workflow.COMPLETED);
          salesOrderModel.set({saleType: null});
          salesOrderModel.get("workflow").reset([]);
          salesOrderModel.get("characteristics").reset([]);
        });

      }),

      it("When a workflow item is completed or deferred, the hold type of the sales " +
         "order will be set to be the applicable target hold type of the workflow item. ", function () {
        workflowModel.set({completedParentStatus: "R"});
        salesOrderModel.get("workflow").add(workflowModel);
        workflowModel.set({status: "C"});
        assert.equal(salesOrderModel.get("holdType"), "R");
        salesOrderModel.set({saleType: null});
        salesOrderModel.get("workflow").reset([]);
        salesOrderModel.get("characteristics").reset([]);
      });

      it("When a workflow item is completed it should not update the status of the sales order", function () {
        workflowModel.set({status: "I"});
        salesOrderModel.get("workflow").add(workflowModel);
        workflowModel.set({status: "C"});
        assert.equal(salesOrderModel.get("status"), "O");
        salesOrderModel.set({saleType: null});
        salesOrderModel.get("workflow").reset([]);
        salesOrderModel.get("characteristics").reset([]);
      });

      it.skip("For the Workflow items copied from the Sale types, the start date and due date " +
              "should be calculated correctly based on the offset", function () {});

      it.skip("When a Sale type with workflows, of an existing sales order is changed," +
              "to a sale type with no workflows, the existing workflows should be cleared" +
              "on the sales order", function () {});

      // TODO: Reimplement in inventory?
      it.skip("Changing the Pack Date will update Pack workflow item's due date", function () {
        var copiedWorkflow = salesOrderModel.get("workflow").models[0];
        assert.equal(copiedWorkflow.get("dueDate").getDate(), new Date("1/1/2004").getDate());
        salesOrderModel.set({packDate: new Date("1/4/2004")});
        assert.equal(copiedWorkflow.get("dueDate").getDate(), new Date("1/4/2004").getDate());
        salesOrderModel.set({saleType: null});
        salesOrderModel.get("workflow").reset([]);
        salesOrderModel.get("characteristics").reset([]);
      });

      // TODO: Reimplement in inventory?
      it.skip("Changing the schedule Date will update Ship workflow item's due date", function () {
        var copiedWorkflow = salesOrderModel.get("workflow").models[0];
        assert.equal(copiedWorkflow.get("dueDate").getDate(), new Date("1/10/2004").getDate());
        salesOrderModel.set({scheduleDate: new Date("1/14/2004")});
        assert.equal(copiedWorkflow.get("dueDate").getDate(), new Date("1/14/2004").getDate());
        salesOrderModel.set({saleType: null});
        salesOrderModel.get("workflow").reset([]);
        salesOrderModel.get("characteristics").reset([]);
      });
    });

    describe("Sales order line", function () {
      var lineItem,
        item,
        alias;

      before(function (done) {
        async.parallel([
          function (done) {
            common.initializeModel(lineItem, XM.SalesOrderLine, function (err, model) {
              lineItem = model;
              done();
            });
          },
          function (done) {
            common.fetchModel(item, XM.ItemRelation, {number: "BPAINT1"}, function (err, model) {
              item = model;
              done();
            });
          },
          function (done) {
            common.initializeModel(alias, XM.ItemAlias, function (err, model) {
              alias = model;
              done();
            });
          }
        ], done);
      });

      // This is much trickier now that we match the alias account to the parent customer.
      it.skip("puts the alias in the customer part number field when an item is selected", function () {
        var aliasNumber;

        if (item.get("aliases").length > 0) {
          // This item already has an alias.
          aliasNumber = item.get("aliases").models[0].get("aliasNumber");
        } else {
          // We have to set up an alias for the purpose of the test.
          aliasNumber = "ALIAS123";
          alias.set({aliasNumber: aliasNumber});
          item.get("aliases").add(alias);
        }

        lineItem.set({item: item});
        assert.equal(lineItem.get("customerPartNumber"), aliasNumber);
      });

      it.skip("For a new sales order, enter the customer, Start the first line item." +
              "Type \"BTRUCK1\" in for the item number" +
              "Tab and put in quantity.Tab all the way through until the next line is created." +
              "The second line should not be populated with the item number", function () {});

      it.skip("In a sales order with multiple line items, selecting to change the quantity of an" +
              " existing Sales order line and tabbing out to the second line should display the" +
              " changed quantity in line 1", function () {});

      it.skip("Selecting to change the sales order line item quantity should display" +
              "a confirmation dialog asking whether to update the price or not.Selecting 'Yes', should" +
              "update the price, selecting 'No' should remain the prices unchanged", function () {});
    });


    describe.skip("Sales Order Payment", function () {
      it("Change 'credit card' to 'payment' panel", function () {});

      it("fundsType will control the behavior of the screen, when an option like 'Credit Card'" +
         "is selected the credit card information entry will be visible", function () {});

      describe.skip("CashReceipt panel/view", function () {
        describe("Following fields should be shown:", function () {
          it("orderTotal from SO _cashTotal, uneditable", function () {});

          it("balance from SO _cashBalance, uneditable", function () {});

          it("amountReceived which is the total _cashReceived with selectable currency and" +
             "editable field", function () {});

          it("Funds Type picker menu should contain the following options: Cash, Visa, " +
             "American Express, Discover, MasterCard, Other Credit Card, Check," +
             "Certified Check, Wired Transfer, Other", function () {});

          it("check/Document- editable string field 'documentNumber'", function () {});

          it("Post Cash Payment selectable button, this option will 'save' the Sales Order and " +
             "post the payment to the Sales Order", function () {});
        });
      });

      describe.skip("Privs/Validation", function () {
        it("Any user should be able to a view a XM.CashReceipt object.", function () {});

        it("Only users with the 'MaintainCashReceipts' privilege should be should be able" +
           "to create, update or delete a XM.CashReceipt object.", function () {});

        it(" A XM.CashReceipt object can not be deleted if it has been posted.", function () {});

        it("If currency on salesOrder does not match 'PostTo' bank account" +
           "(ex. USD on SO, EUR on account), return prompt to ask user if they'd like to convert" +
           "to bankAccount currency", function () {});

        it("Selecting to post cash payment with 'Amount Received' is greater than" +
           "balance return error", function () {});

        it("Selecting to post cash payment with blank or zero in 'Amount Received'  " +
           "field should display an error message", function () {});
      });

      it("Balance amount should be recalculated on selecting to" +
         "Post Cash Payment", function () {});

      it("Allocated Credit field in the Line Items panel should display the " +
         "amount posted", function () {});

      it("Selecting to Save the sales order without posting the cash payment" +
         "should display an error dialog", function () {});
    });
  };

  exports.spec = spec;
  exports.primeSubmodels = primeSubmodels;
  exports.additionalTests = additionalTests;
  exports.getBeforeSaveAction = getBeforeSaveAction;

}());
