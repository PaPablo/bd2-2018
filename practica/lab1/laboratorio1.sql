/* Función para poblar la Base */
create or replace function laboratorio1() returns void as
$$
declare
model record;
modelo record;
i integer;
capacidad integer;
tipoModelo integer;
nro_avion integer;
horas_vuelo integer;
anio integer;
fecha_inicio date;
fecha_fin date;
trabajador integer;
falla integer;
begin
    tipoModelo=20;
    capacidad = 100;
    -- creamos modelos de avion
    for model in (select * from "descripcionModeloAviones") loop
        -- Insertar modelo con la descripción que hay en otra tabla
        insert into "modeloAvion" values (tipoModelo, model.model, capacidad);
        tipoModelo = tipoModelo +1;
        capacidad = capacidad +1;
    end loop;

    fecha_inicio = current_date;
    fecha_fin = fecha_inicio + 20;
    nro_avion = 1050;
    for modelo in (select * from "modeloAvion") loop
        raise notice 'En el modelo %',modelo."tipoModelo";
        for i in 1..10000 loop

            -- Horas de vuelo
            horas_vuelo = floor(random()*(5000-300+1))+300;

            -- Año de fabricación del avión
            anio = floor(random()*(2010-1990+1))+1990;

            -- DNI del trabajador de la reparación
            trabajador = floor(random()*(15000999-15000001+1))+15000001;

            -- Código de la falla
            falla = floor(random()*(287-10+1))+10;

            -- Insertamos avión
            insert into avion values (nro_avion, modelo."tipoModelo",anio, horas_vuelo);

            -- Insertamos reparación
            insert into "trabajadorReparacion" values (trabajador, nro_avion, fecha_inicio, fecha_fin, falla);

            -- Incrementamos nro de avión
            nro_avion = nro_avion + 1;

        end loop;
    end loop;
end;
$$ language plpgsql;

select laboratorio1();
