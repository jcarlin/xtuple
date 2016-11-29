drop function if exists xt.add_column(text, text, text, text, text);

create or replace function xt.add_column(table_name text, column_name text, type_name text, constraint_text text default null, schema_name text default 'xt', column_comment text default null) returns boolean volatile as $$
declare
  count integer;
  query text;
  constraint_null boolean;
  constraint_default text;
  column_null boolean := false;
  comment_query text;
  _current record;
begin

  select format_type(a.atttypid, a.atttypmod) as type, a.attnotnull as notnull, d.adsrc as defaultval into _current
  from pg_attribute a
  join pg_class c on a.attrelid=c.oid
  join pg_namespace n on c.relnamespace=n.oid
  left outer join pg_attrdef d on a.attrelid=d.adrelid and a.attnum=d.adnum
  where c.relname = table_name
  and n.nspname = schema_name
  and a.attname = column_name
  and a.attnum > 0;

  get diagnostics count = row_count;

  if (count > 0) then
    if(_current.type !~~* type_name and type_name !~* 'serial') then
--The operator !~~* when used with no special regular expression operators amounts to a straight case-insensitive comparison
      query = format('alter table %I.%I alter column %I set data type %s', schema_name, table_name, column_name, type_name);

      execute query;
    end if;

    query = format('select 1 from %I.%I where %I is null', schema_name, table_name, column_name);

    execute query;

    get diagnostics count = row_count;

    if(count > 0) then
      column_null = true;
    end if;

    if (coalesce(constraint_text, '') ~* 'not null') then
      constraint_null = true;
      constraint_default = trim(regexp_replace(coalesce(constraint_text, ''), 'not null', '', 'i'));
    else
      constraint_null = false;
      constraint_default = trim(regexp_replace(coalesce(constraint_text, ''), 'null', '', 'i'));
    end if;

--The above does not behave correctly in most cases wherein a constraint or the default value
--contains the text 'not null' or 'null' (e.g. constraint_text='default ''not null''')

    if (constraint_default ~* 'default') then
      if (constraint_default ~* 'check') then
        if(strpos(constraint_default, 'default') < strpos(constraint_default, 'check')) then
          constraint_default = trim((regexp_matches(constraint_default, '(default .*) check.*', 'i'))[1]::text);
        else
          constraint_default = trim((regexp_matches(constraint_default, 'check.*(default .*)', 'i'))[1]::text);
        end if;
      end if;

--The above only handles check constraints, and only if the default value does not contain
--the text 'check' and the check constraint does not contain the text 'default'.
--It does not handle unique constraints, primary keys (though these should never be used with a default),
--foreign key constraints, or exclude constraints correctly.
--Check constraints are also simply ignored on existing columns rather than added/updated idempotently

      constraint_default = trim(regexp_replace(constraint_default, 'default', '', 'i'));
      if(coalesce(_current.defaultval, '')!=constraint_default) then
        query = format('alter table %I.%I alter column %I set default %s', schema_name, table_name, column_name, constraint_default);

        execute query;

        if(_current.defaultval is null and constraint_null and column_null) then
          query = format('update %I.%I set %I=%s where %I is null', schema_name, table_name, column_name, constraint_default, column_name);

          execute query;
          column_null = false;
        end if;
      end if;
    else
      if (_current.defaultval is not null and _current.defaultval!=constraint_default and constraint_text !~* 'primary key') then
        query = format('alter table %I.%I alter column %I drop default', schema_name, table_name, column_name);

        execute query;
      end if;
    end if;

    if (constraint_null) then
      if(not _current.notnull and not column_null) then
        query = format('alter table %I.%I alter column %I set not null', schema_name, table_name, column_name);

        execute query;
      end if;
    else
      if (_current.notnull and type_name !~* 'serial' and constraint_text !~* 'primary key') then
        query = format('alter table %I.%I alter column %I drop not null', schema_name, table_name, column_name);

        execute query;
      end if;
    end if;
  else
    query = format('alter table %I.%I add column %I %s %s', schema_name, table_name, column_name, type_name, coalesce(constraint_text, ''));

    execute query;
  end if;

  if (column_comment is not null) then
    comment_query = format('comment on column %I.%I.%I is %s', schema_name, table_name, column_name, quote_literal(column_comment));
    execute comment_query;
  end if;

  return true;

end;
$$ language 'plpgsql';
