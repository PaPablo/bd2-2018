create domain "horasVuelo" as integer
    default 0
    constraint "horasVueloPositivas"
    check (value between 0 and 100000);

alter table avion
    alter column "horasVuelo"
        type "horasVuelo";

alter table "piloto"
    alter column "horasVuelo"
        type "horasVuelo";
