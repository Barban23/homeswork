create database esercizio_d5;

 use esercizio_d5;
 
 create table disco (
	num_serie int ,
    titolo_album varchar (100),
    anno year ,
    prezzo dec (4,2),
   primary key (num_serie)
 );
    
CREATE INDEX idx_annox ON disco (anno);
    
create table autore (
	nome varchar (100),
    titolo_canzone varchar (100),
    primary key (nome,titolo_canzone)
 );
    
CREATE INDEX idx_titolo_canzonex ON autore (titolo_canzone);
    
create table esecuzione (
    codice_reg2 varchar (255),
    titolo_canzone1 varchar (255),
    anno1 year,
    primary key (codice_reg2,titolo_canzone1),
     CONSTRAINT fk_titolo_canzonex1 foreign key (titolo_canzone1) references autore (titolo_canzone)
    on update cascade on delete no action,
 		CONSTRAINT fk_annox1 foreign key (anno1) references disco (anno)
    on update cascade on delete no action
);

CREATE INDEX idx_codice_regx ON esecuzione (codice_reg2);
    
create table cantante (
	nome_cantante varchar (100),
    codice_reg varchar (255),
    primary key (nome_cantante,codice_reg),
    constraint fk_codice_regx2 foreign key (codice_reg) references esecuzione (codice_reg2)
    on update cascade on delete no action
    );
    
create table contiene (
	num_serie_disco int,
    codice_reg1 varchar (255),
    num_prog int,
    primary key (num_serie_disco,codice_reg1),
    constraint fk_codice_regx1 foreign key (codice_reg1) references esecuzione (codice_reg2)
    on update cascade on delete no action
    );
    
select cantante.nome_cantante,autore.titolo_canzone
from cantante
inner join esecuzione on cantante.codice_reg=esecuzione.codice_reg2
inner join autore on esecuzione.titolo_canzone1=autore.titolo_canzone
where autore.nome=cantante.nome_cantante and autore.nome like "d%";
    
select disco.titolo_album
from disco
inner join contiene on contiene.num_serie_disco=disco.num_serie
inner join esecuzione on esecuzione.codice_reg2=contiene.codice_reg1
where anno is null;

select cantante.nome_cantante
from cantante
where nome_cantante not in (
select c1.nome_cantante
from cantante as c1
inner join cantante as c2 on c1.codice_reg = c2.codice_reg
where c1.nome_cantante > c2.nome_cantante);
