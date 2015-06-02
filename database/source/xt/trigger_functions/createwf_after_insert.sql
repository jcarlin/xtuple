create or replace function xt.createwf_after_insert() returns trigger as $$
/* Copyright (c) 1999-2014 by OpenMFG LLC, d/b/a xTuple.
   See www.xm.ple.com/CPAL for the full text of the software license. */

return (function () {

  if (TG_OP === 'INSERT') {
    if (plv8.execute("select fetchmetricbool('TriggerWorkflow') as val;")[0].val) {
      var parent,
        parentId,
        parentIdSql,
        sourceModSql = "select wftype_src_tblname as srctblname from xt.wftype where wftype_code = $1 ",
        sourceModel;

      if (TG_TABLE_NAME === 'cohead') {
        sourceModel = plv8.execute(sourceModSql, ['SO'])[0].srctblname;

        if (!sourceModel) {
          plv8.elog(WARNING, "Missing sourceModel and/or parentId needed to generate workflow!");
        }
        plv8.execute("SELECT xt.workflow_inheritsource($1, $2, $3, $4)",
          ["xt." + sourceModel, 'XM.SalesOrderWorkflow', NEW.obj_uuid, NEW.cohead_saletype_id]);
      }

      if (TG_TABLE_NAME === 'prj') {
        sourceModel = plv8.execute(sourceModSql, ['PRJ'])[0].srctblname;

        if (!sourceModel) {
          plv8.elog(WARNING, "Missing sourceModel and/or parentId needed to generate workflow!");
        }
        plv8.execute("SELECT xt.workflow_inheritsource($1, $2, $3, $4)",
          ["xt." + sourceModel, 'XM.ProjectWorkflow', NEW.obj_uuid, NEW.prj_prjtype_id]);
      }

      if (TG_TABLE_NAME === 'poheadext') {
        sourceModel = plv8.execute(sourceModSql, ['PO'])[0].srctblname;
        parentIdSql = "select poheadext_potype_id as parent_id, pohead.obj_uuid as pohead_uuid " +
          "from xt.poheadext join pohead on poheadext_id = pohead_id where poheadext_id = $1";
        parent = plv8.execute(parentIdSql, [NEW.poheadext_id])[0];

        if (!sourceModel || !parent) {
          plv8.elog(WARNING, "Missing sourceModel and/or parentId needed to generate workflow!");
        }
        plv8.execute("SELECT xt.workflow_inheritsource($1, $2, $3, $4)",
          ["xt." + sourceModel, 'XM.PurchaseOrderWorkflow', parent.pohead_uuid, parent.parent_id]);
      }

      if (TG_TABLE_NAME === 'tohead') {
        sourceModel = plv8.execute(sourceModSql, ['TO'])[0].srctblname;
        parentIdSql = "select warehous_sitetype_id as parent_id from warehous where warehous_id = $1";
        parentId = plv8.execute(parentIdSql, [NEW.tohead_src_warehous_id])[0].parent_id;

        if (!sourceModel || !parentId) {
          plv8.elog(WARNING, "Missing sourceModel and/or parentId needed to generate workflow!");
        }
        plv8.execute("SELECT xt.workflow_inheritsource($1, $2, $3, $4);",
          ["xt." + sourceModel, 'XM.TransferOrderWorkflow', NEW.obj_uuid, parentId]);
      }

      if (TG_TABLE_NAME === 'wo') {
        sourceModel = plv8.execute(sourceModSql, ['WO'])[0].srctblname;
        parentIdSql = "select itemsite_plancode_id as parent_id from itemsite where itemsite_id = $1";
        parentId = plv8.execute(parentIdSql, [NEW.wo_itemsite_id])[0].parent_id;

        if (!sourceModel || !parentId) {
          plv8.elog(WARNING, "Missing sourceModel and/or parentId needed to generate workflow!");
        }
        plv8.execute("SELECT xt.workflow_inheritsource($1, $2, $3, $4);", ["xt." + sourceModel, 'XM.WorkOrderWorkflow', NEW.obj_uuid, parentId]);
      }

      return NEW;
    }
  }

}());

$$ language plv8;