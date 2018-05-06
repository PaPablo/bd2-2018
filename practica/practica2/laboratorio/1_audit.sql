-- cjto de tablas del esquema public en la base actual
select 'in' in (select 
table_name 
from 
information_schema.tables tbls 
where 
tbls.table_catalog=(select current_database()) 
and 
tbls.table_schema='public');

-- usuario actual
select current_user;

create or replace function tabla_valida(tabla varchar) returns boolean as
$$
begin
	return (select tabla in (select 
		table_name 
		from 
		information_schema.tables tbls 
		where 
		tbls.table_catalog=(select current_database()) 
		and 
		tbls.table_schema='public'));
end
$$ language plpgsql;

create or replace function operacion_valida(varchar) returns boolean as 
$$
begin
	return (select lower($1) in ('update','insert','delete','update'));
end
$$ language plpgsql;
select operacion_valida('UPDATE');

-- drop si existe
drop table if exists audit;
-- creacion tabla audit
create table audit (
	tabla varchar(20) not null constraint nombre_valido_check check(tabla_valida(tabla)),
	tipo_operacion varchar(20) not null constraint operacion_valida_check check(operacion_valida(tipo_operacion)),
	usuario varchar(30) not null,
	fecha_hora timestamp with time zone default current_timestamp	
);
insert into audit values('avion', 'DF','pablo')
select * from audit;
