
create schema practica_Enric authorization psdpcsgi;


-- Tabla de Colores
create table practica_Enric.color(
	idColor varchar(10)  not null, --PK
	orden integer not null,
	nombre varchar(50) null
);
--PK
alter table practica_Enric.color
add constraint  idColor_PK primary key (idColor);


-- Tabla de Seguros
create table practica_Enric.seguro(
	idSeguro varchar(10)  not null, --PK
	orden integer not null,
	nombre varchar(50) null
);
--PK
alter table practica_Enric.seguro
add constraint  idSeguro_PK primary key (idSeguro);


-- Tabla Veiculos
create table practica_Enric.veiculo(
	idVeiculo varchar(10) not null,  --PK
	idModelo varchar(10)  not null, --FK	
	matricula varchar(20) not null,
	idColor varchar(10)  not null, --FK
	km integer not null default 0,
	dt_compra date not null,
	dt_alta date not null,
	dt_baja date not null default '4000-01-01',
	idSeguro varchar(10)  not null, --FK
	poliza varchar(50) not null
	
);

--PK
alter table practica_Enric.veiculo
add constraint idVeiculo_PK primary key (idVeiculo);

--FK
alter table practica_Enric.veiculo
add constraint veiculo_idColor_FK foreign key (idColor)
references practica_Enric.color(idColor);

alter table practica_Enric.veiculo
add constraint veiculo_idSeguro_FK foreign key (idSeguro)
references practica_Enric.seguro(idSeguro);


-- Tabla de Grupo de Empresa
create table practica_Enric.grupoEmpresa(
	idGrupoEmp varchar(10)  not null, --PK 
	nombre varchar(50) null
);
--PK
alter table practica_Enric.grupoEmpresa
add constraint  idGrupoEmp_PK primary key (idGrupoEmp);


-- Tabla de Marcas
create table practica_Enric.marca(
	idMarca varchar(10)  not null, --PK
	idGrupoEmp varchar(10)  not null, --FK
	nombre varchar(50) null
);
--PK
alter table practica_Enric.marca
add constraint  idMarca_PK primary key (idMarca);

--FK
alter table practica_Enric.marca
add constraint veiculo_idGrupoEmp_FK foreign key (idGrupoEmp)
references practica_Enric.grupoEmpresa(idGrupoEmp);


-- Tabla de Modelo
create table practica_Enric.modelo(
	idModelo varchar(10)  not null, --PK 
	idMarca varchar(10)  not null, --PK  FK
	nombre varchar(50) null
);

--PK
alter table practica_Enric.modelo
add constraint  idModelo_PK primary key (idModelo);

--FK
alter table practica_Enric.modelo
add constraint modelo_idMarca_FK foreign key (idMarca)
references practica_Enric.marca(idMarca);

alter table practica_Enric.veiculo
add constraint veiculo_idModelo_FK foreign key (idModelo)
references practica_Enric.modelo(idModelo);

-- Tabla Revisiones
create table practica_Enric.revision(
	idVeiculo varchar(10) not null,  --PK
	dt_revision date not null,	 --PK
	km integer not null,	
	idMoneda varchar(10)  not null  default 'EUR', --FK
	importe  numeric(12,5) null default 0	
	
);

--PK
alter table practica_Enric.revision
add constraint  revision_PK primary key (idVeiculo,dt_revision);

--FK
alter table practica_Enric.revision
add constraint revision_idVeiculo_FK foreign key (idVeiculo)
references practica_Enric.veiculo(idVeiculo);

-- Tabla de Monedas
create table practica_Enric.moneda(
	idMoneda varchar(10)  not null, --PK
	orden integer not null,
	nombre varchar(50) null
);
--PK
alter table practica_Enric.moneda
add constraint  idMoneda_PK primary key (idMoneda);

alter table practica_Enric.revision
add constraint revision_idMoneda_FK foreign key (idMoneda)
references practica_Enric.moneda(idMoneda);



------INSERT DATOS--------

--Tabala color
insert into practica_Enric.color 
(idColor ,orden, nombre)
values ('001',1,'Azul');

insert into practica_Enric.color 
(idColor ,orden, nombre)
values ('002',2,'Verde');

insert into practica_Enric.color 
(idColor ,orden, nombre)
values ('003',3,'Rojo');

insert into practica_Enric.color 
(idColor ,orden, nombre)
values ('004',4,'Negro');


-- Tabla de Seguros
insert into practica_Enric.seguro 
(idseguro ,orden, nombre)
values ('001',1,'Mafre');

insert into practica_Enric.seguro 
(idseguro ,orden, nombre)
values ('002',2,'AXA');

insert into practica_Enric.seguro 
(idseguro ,orden, nombre)
values ('003',3,'Génesis');

insert into practica_Enric.seguro 
(idseguro ,orden, nombre)
values ('004',4,'RACC');


-- Tabla de Grupo Empresa
insert into practica_Enric.grupoEmpresa 
(idGrupoEmp , nombre)
values ('001','Van');

insert into practica_Enric.grupoEmpresa 
(idGrupoEmp , nombre)
values ('002','Renault');

insert into practica_Enric.grupoEmpresa 
(idGrupoEmp , nombre)
values ('003','Toyota');

insert into practica_Enric.grupoEmpresa 
(idGrupoEmp , nombre)
values ('004','Honda');


-- Tabla Marcas
insert into practica_Enric.marca 
(idMarca,idGrupoEmp,nombre)
values ('001','001','Volkswagen');

insert into practica_Enric.marca 
(idMarca,idGrupoEmp,nombre)
values ('002','001','Seat');

insert into practica_Enric.marca 
(idMarca,idGrupoEmp,nombre)
values ('003','002','Renault');

insert into practica_Enric.marca 
(idMarca,idGrupoEmp,nombre)
values ('004','002','Dacia');

insert into practica_Enric.marca 
(idMarca,idGrupoEmp,nombre)
values ('005','003','Toyota');

insert into practica_Enric.marca 
(idMarca,idGrupoEmp,nombre)
values ('006','003','Lexus');

insert into practica_Enric.marca 
(idMarca,idGrupoEmp,nombre)
values ('007','004','Honda');

insert into practica_Enric.marca 
(idMarca,idGrupoEmp,nombre)
values ('008','004','Hyundai');


--Tabla modelo
insert into practica_Enric.modelo 
(idModelo,idMarca,nombre)
values ('001','001','Golf');

insert into practica_Enric.modelo 
(idModelo,idMarca,nombre)
values ('002','001','California');

insert into practica_Enric.modelo 
(idModelo,idMarca,nombre)
values ('003','001','Tiguan');

insert into practica_Enric.modelo 
(idModelo,idMarca,nombre)
values ('004','002','Ibiza');

insert into practica_Enric.modelo 
(idModelo,idMarca,nombre)
values ('005','002','Leon');

insert into practica_Enric.modelo 
(idModelo,idMarca,nombre)
values ('006','005','Yaris');

insert into practica_Enric.modelo 
(idModelo,idMarca,nombre)
values ('007','005','Rav4');

insert into practica_Enric.modelo 
(idModelo,idMarca,nombre)
values ('008','005','Rav4');

insert into practica_Enric.modelo 
(idModelo,idMarca,nombre)
values ('009','007','Civic');

insert into practica_Enric.modelo 
(idModelo,idMarca,nombre)
values ('010','008','I30');


--Tabla Moneda
insert into practica_Enric.moneda 
(idMoneda,orden,nombre)
values ('001',1,'EUR');

insert into practica_Enric.moneda 
(idMoneda,orden,nombre)
values ('002',2,'Dolar');

insert into practica_Enric.moneda 
(idMoneda,orden,nombre)
values ('003',3,'Yen');


--Tabala veiculo
insert into practica_Enric.veiculo 
(idVeiculo ,idModelo, matricula, idColor,km,dt_compra,dt_alta,dt_baja,idSeguro,poliza)
values ('001','001','59668XSQ','003',35000,'2023-01-01','2023-01-01','2027-01-01','003','FF457899685GJ');

insert into practica_Enric.veiculo 
(idVeiculo ,idModelo, matricula, idColor,km,dt_compra,dt_alta,dt_baja,idSeguro,poliza)
values ('002','002','12345FRG','001',305000,'2018-02-05','2018-06-07','2025-01-01','001','123456789');

insert into practica_Enric.veiculo 
(idVeiculo ,idModelo, matricula, idColor,km,dt_compra,dt_alta,dt_baja,idSeguro,poliza)
values ('003','003','99999ILG','002',22000,'2022-09-10','2022-09-10','2027-01-01','002','999856789');

insert into practica_Enric.veiculo 
(idVeiculo ,idModelo, matricula, idColor,km,dt_compra,dt_alta,dt_baja,idSeguro,poliza)
values ('004','005','777899ILG','004',133000,'2020-08-10','2020-09-04','2026-01-01','003','125878789KL');

insert into practica_Enric.veiculo 
(idVeiculo ,idModelo, matricula, idColor,km,dt_compra,dt_alta,dt_baja,idSeguro,poliza)
values ('005','006','123578RRG','001',136050,'2021-09-02','2021-10-11','2026-01-01','001','128889888L');

insert into practica_Enric.veiculo 
(idVeiculo ,idModelo, matricula, idColor,km,dt_compra,dt_alta,dt_baja,idSeguro,poliza)
values ('006','008','48485869TTY','003',223660,'2020-02-02','2020-02-02','2025-01-01','002','9888541KK');

insert into practica_Enric.veiculo 
(idVeiculo ,idModelo, matricula, idColor,km,dt_compra,dt_alta,dt_baja,idSeguro,poliza)
values ('007','009','1212154RRE','001',450660,'2018-06-09','2018-06-09','2021-01-01','002','95586692');


-- Tabla revisión
insert into practica_Enric.revision 
(idVeiculo ,dt_revision, km, idMoneda,importe)
values ('001','2023-01-01',200,'001',50.60);

insert into practica_Enric.revision 
(idVeiculo ,dt_revision, km, idMoneda,importe)
values ('002','2020-01-01',78000,'001',51.20);

insert into practica_Enric.revision 
(idVeiculo ,dt_revision, km, idMoneda,importe)
values ('002','2021-01-01',90087,'001',53.30);

insert into practica_Enric.revision 
(idVeiculo ,dt_revision, km, idMoneda,importe)
values ('002','2022-01-01',13000,'001',53.30);

insert into practica_Enric.revision 
(idVeiculo ,dt_revision, km, idMoneda,importe)
values ('002','2023-01-01',180560,'001',53.30);

insert into practica_Enric.revision 
(idVeiculo ,dt_revision, km, idMoneda,importe)
values ('003','2023-01-01',22352,'001',50.60);



insert into practica_Enric.revision 
(idVeiculo ,dt_revision, km, idMoneda,importe)
values ('004','2021-01-01',243321,'001',53.30);

insert into practica_Enric.revision 
(idVeiculo ,dt_revision, km, idMoneda,importe)
values ('004','2022-01-01',263860,'001',53.30);

insert into practica_Enric.revision 
(idVeiculo ,dt_revision, km, idMoneda,importe)
values ('004','2023-01-01',293240,'001',53.30);


insert into practica_Enric.revision 
(idVeiculo ,dt_revision, km, idMoneda,importe)
values ('005','2022-01-01',146060,'001',53.30);

insert into practica_Enric.revision 
(idVeiculo ,dt_revision, km, idMoneda,importe)
values ('005','2023-01-01',16850,'001',53.30);


insert into practica_Enric.revision 
(idVeiculo ,dt_revision, km, idMoneda,importe)
values ('006','2021-01-01',90087,'001',53.30);

insert into practica_Enric.revision 
(idVeiculo ,dt_revision, km, idMoneda,importe)
values ('006','2022-01-01',13000,'001',53.30);

insert into practica_Enric.revision 
(idVeiculo ,dt_revision, km, idMoneda,importe)
values ('006','2023-01-01',180560,'001',53.30);


insert into practica_Enric.revision 
(idVeiculo ,dt_revision, km, idMoneda,importe)
values ('007','2019-01-01',472584,'001',51.20);

insert into practica_Enric.revision 
(idVeiculo ,dt_revision, km, idMoneda,importe)
values ('007','2020-01-01',490786,'001',51.20);

insert into practica_Enric.revision 
(idVeiculo ,dt_revision, km, idMoneda,importe)
values ('007','2021-01-01',514573,'001',53.30);






