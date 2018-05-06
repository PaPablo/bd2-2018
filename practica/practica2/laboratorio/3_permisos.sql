create user user_a;
create user user_b;

grant all privileges 
on table 
avion, 
falla, 
jefe, 
localidad,
"modeloAvion",
piloto,
"pilotoAvion",
trabajador,
"trabajadorReparacion"
to user_a with grant option;

grant insert on table audit to user_a with grant option;

grant select, insert, update on table avion, piloto,"pilotoAvion" to user_b with grant option;

/*
-- Inserción sobre avion utilizando user_b
tp1-aviones=> insert into avion values (1015,10,1980,120)
tp1-aviones-> ;
ERROR:  permiso denegado a la relación audit
CONTEXTO:  sentencia SQL: «insert into audit values('avion','insert', current_user)»
función PL/pgSQL audit_insert_avion() en la línea 4 en sentencia SQL
*/

/*
-- Conectado con user_a
tp1-aviones=> grant insert on table audit to user_b;
GRANT
*/

/*
--Otra vez conectado con user_b
tp1-aviones=> insert into avion values (1015,10,1980,120);
INSERT 0 1
tp1-aviones=> select * from avion where "nroAvion"=1015;
 nroAvion | tipoModelo | año  | horasVuelo 
----------+------------+------+------------
     1015 |         10 | 1980 |        120
(1 fila)
*/