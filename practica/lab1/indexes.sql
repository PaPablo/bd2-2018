-- primera!
create unique index "avionesNroAvion" on avion("nroAvion");
create index "reparacionesAvion" on "trabajadorReparacion"("nroAvion")

-- segundita!
create index "avionesModelo" on avion("tipoModelo");
