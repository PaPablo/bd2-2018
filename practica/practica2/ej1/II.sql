create table jefe (
    dni integer not null,
    constraint "pkJefe" primary key ("dni"),
    constraint "fjTabajado" foreign key ("dni") 
        references "trabajador" on delete cascade on update cascade
);
