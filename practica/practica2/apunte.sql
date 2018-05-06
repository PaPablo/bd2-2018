-- cjto de tablas del esquema public en la base actual
select 
table_catalog, 
table_schema,
table_name 
from 
information_schema.tables 
where 
table_catalog=(select current_database()) 
and 
table_schema='public';


