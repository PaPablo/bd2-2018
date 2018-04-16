explain (verbose true, analyze true, buffers true, timing true, costs true) select
tav."nroAvion",
tav."dniTrabajador",
tav."fechaInicioReparacion",
tav."fechaFinReparacion",
falla."descripcion"
from 
"trabajadorReparacion" tav
join 
avion on avion."nroAvion"=tav."nroAvion"
join
"modeloAvion" ma on avion."tipoModelo" = ma."tipoModelo"
join
falla on falla."tipoFalla" = tav."tipoFallaReparada"
where
ma.capacidad = 1388;
