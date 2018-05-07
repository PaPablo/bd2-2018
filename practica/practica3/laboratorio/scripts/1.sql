/*
nombre del aeropuerto, 
ubicación (ciudad, provincia, pais), 
medidas de la pista 
(longitud, ancho, tipo de compuesto) y
una coleccion de las aerolineas que trabajan en el mismo.
 */

-- PUNTO 1

-- tipo para ubicacion del aeropuerto
create type tubicacionAeorpuerto as (
    ciudad varchar(50),
    provincia varchar(50),
    pais varchar(50)
);

-- tipo para medidas de pista
create type tmedidasPista as (
    longitud float,
    ancho float,
    tipo_compuesto varchar(50)
);

-- tipo para aeropuerto
create type taeropuerto as (
    nombre varchar(90),
    ubicacion tubicacionAeorpuerto,
    medidas tmedidasPista,
    aerolineas oid[]
);
-- Aerolineas
create type taerolinea as (
	nombre varchar(100)
);

-- tabla correspondiente
create table aerolinea of taerolinea with oids;

-- insercion de aerolineas
insert into aerolinea values ('Aerolineas Argentinas');
insert into aerolinea values ('Lan');
insert into aerolinea values ('Turkish Airlines');

-- function para conseguir una aerolinea por su nombre
create or replace function get_aerolinea(varchar) returns integer as
$$
begin
	return (select oid from aerolinea where nombre ilike '%' || $1 || '%' limit 1);
end;
$$ language plpgsql;

-- PUNTO 2

-- function para chequear que cada aerolinea insertada sea correcta
create or replace function check_aerolineas(aerolineas oid[]) returns boolean as 
$$
declare
	aerolineas_tbl record;
	o oid;
	valido boolean;
begin
	valido = true;
	foreach o in array aerolineas loop
		valido = valido and (o in (select oid from aerolinea));
	end loop;
	return valido;
end;
$$ language plpgsql;

-- unico aeropuerto (criterio nombre case unsensitive distintos)
create or replace function aeropuerto_unico(varchar) returns boolean as
$$
begin
	return (select $1 not in (select nombre from aeropuerto));
end
$$ language plpgsql;

-- tabla de aeropuertos 

create table aeropuerto of taeropuerto (
	primary key(oid),
	constraint aeropuerto_nombre_check check(aeropuerto_unico(nombre)),
	constraint aerolineas_check check(check_aerolineas(aerolineas))
) with oids;

-- function para insertar un aeropuerto

create or replace function insertar_aeropuerto(
	nombre varchar(90),
	ubicacion tubicacionAeorpuerto,
	medidas tmedidaspista,
	aero_nombres varchar[]
) returns integer as
$$
declare
	aero_oids oid[];
	I integer;
	aeropuerto_creado integer = 0;
begin
	for I in 1..array_length(aero_nombres,1) loop
		aero_oids[I] := get_aerolinea(aero_nombres[I]);
		raise notice '%', aero_oids[I];
	end loop;
	
	insert into aeropuerto values (
		nombre,
		ubicacion,
		medidas,
		aero_oids
	) returning oid into aeropuerto_creado;
	
	return aeropuerto_creado;
end;
$$ language plpgsql;

select insertar_aeropuerto(
	'Aeroparque',
	('CABA','Buenos Aires','Argentina'),
	(90,120,'Concreto'),
	array['lan','aerolineas argentinas','turkish']
);

-- Insercion de un aeropuerto
insert into aeropuerto values(
	'Aeroparque',
	('CABA','Buenos Aires','Argentina'),
	(90,120,'Concreto'),
	'{"16604","16621"}'
);

-- function para insertar aeropuerto que devuelve su oid
create or replace function insertar_aerolinea(varchar(100)) returns integer as
$$
declare
	oid_aerolinea integer = 0;
begin
	insert into aerolinea values($1) returning oid into oid_aerolinea;
	return oid_aerolinea;
end;
$$ language plpgsql;
