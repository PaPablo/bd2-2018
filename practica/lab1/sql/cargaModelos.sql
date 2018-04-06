insert into 
"modeloAvion"
select
-- los offset detallados son para no generar colisiones con los registros 
-- preexistentes en la base
15+row_number() over (order by model) as "modeloAvion" ,
model,
60+row_number() over(order by model) as "capacidad"
from "descripcionModeloAviones"
