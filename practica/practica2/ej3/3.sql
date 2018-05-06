-- Las restricciones de integridad referencial implican exactamente a dos 
-- relaciones. Considérese una base de datos que incluye las relaciones 
-- siguientes:
-- trabajador-fijo (nombre, despacho, teléfono, sueldo)
-- trabajador-tiempo-parcial (nombre, sueldo-por-hora)
-- dirección (nombre, calle, ciudad)
-- Supóngase que se desea exigir que cada nombre que aparece en dirección 
-- aparezca en trabajador-fijo o en trabajador-tiempo-parcial, 
-- pero no necesariamente en ambos.
-- a. Propóngase una sintaxis para expresar esta restricción.
-- b. Discútanse las acciones que debe realizar el sistema para aplicar una 
-- restricción de este tipo.


create table trabajadorFijo (
    nombre char(100),
    despacho char(100),
    telefono char(100),
    sueldo real
    constraint pk_trabajador_fijo primary key ("nombre")
);

create table traajadorTiempoParcial (
    nombre char(100),
    "sueldoPorHora" real.
    constraint pk_trabajador_tiempo_parcial primary key ("nombre")
);

create table direccion (
    nombre char(100),
    calle char(100),
    ciudad char(50)
    constraint primary key ("nombre"),
    constraint chk_nombre check(no_en_ambos())
);

create or replace function no_en_ambos (varchar) 
returns bool
as
$$
    returns
$$ language plpgsql;
