-- empleado (nombre-empleado, calle, ciudad)
-- trabaja (nombre-empleado, nombre-empresa, sueldo)
-- empresa (nombre-empresa, ciudad)
-- jefe (nombre-empleado, nombre-jefe)
-- Dese una definición en el DDL de SQL de esta base de datos.
-- Identifíquense las restricciones de integridad referencial que deban 
-- cumplirse e inclúyanse en la definición del DDL.

create table empleado (
    "nombreEmpleado" varchar(100),
    calle varchar(100),
    ciudad varchar(100)
    constraint pk_empleado  primary key ("nombreEmpleado")
);

create table empresa (
    "nombreEmpresa" varchar(100),
    ciudad varchar(50),
    constraint pk_empresa foreign key ("nombreEmpresa")
);

create table trabaja (
    "nombreEmpleado" varchar(100),
    "nombreEmpresa" varchar(100),
    sueldo real,
    constraint pk_trabaja primary key ("nombreEmpleado", "nombreEmpresa"),
    constraint fk_trabaja_empleado foreign key ("nombreEmpleado")
        references "trabajador" on delete cascade on update cascade,
    constraint fk_trabaja_empresa foreign key ("nombreEmpresa")
        references "empresa" on delete cascade on update cascade
);

create table jefe(
    "nombreEmpleado" varchar(100),
    "nombreJefe" varchar(100),
    constraint pk_jefe primary key ("nombreJefe", "nombreEmpleado"),
    constraint fk_jefe_empleado foreign key ("nombreEmpleado")
        references "nombreJefe" on delete cascade on update cascade,
    constraint chk_no_es_el_mismo check ("nombreEmpleado" <> "nombreJefe")
);
