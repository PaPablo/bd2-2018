/*
nombre del aeropuerto, 
ubicación (ciudad, provincia, pais), 
medidas de la pista 
(longitud, ancho, tipo de compuesto) y
una coleccion de las aerolineas que trabajan en el mismo.
 */
create type ubicacionAeorpuerto as (
    ciudad varchar(50),
    provincia varchar(50),
    pais varchar(50)
);

create type medidasPista as (
    longitud float,
    ancho float,
    tipo_compuesto varchar(50)
);

create type Aeropuerto as (
    nombre varchar(90),
    ubicacion ubicacionAeorpuerto,
    medidas medidasPista,
    aerolineas varchar[]
);

