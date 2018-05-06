create or replace function audit_insert_avion() returns trigger
as
$$
begin
	
    insert into audit values('avion','insert', current_user);
	return new;
end
$$ language plpgsql;

drop trigger insercion_avion on avion;
create  trigger insercion_avion after 
    insert on avion
    execute procedure audit_insert_avion();

create or replace function audit_delete_avion() returns trigger
as
$$
begin
	
    insert into audit values('avion','delete', current_user);
	return new;
end
$$ language plpgsql;

drop trigger if exists eliminacion_avion on avion;
create  trigger eliminacion_avion after 
    delete on avion
    execute procedure audit_delete_avion();