use esercizio_d5;
  
  create table studente (
	matricola int ,
    nome varchar (100),
    città varchar (100) ,
   primary key (matricola)
 );
    
CREATE INDEX matricola_s ON studente (matricola);
    
create table docente (
	matricola1 int,
    nome varchar (100),
    primary key (matricola1)
 );
    
CREATE INDEX matricola1_d ON docente (matricola1);
    
create table corso (
    codice varchar (100),
    nome_c varchar (100),
    matricola_docente int,
    primary key (codice),
    constraint fk_matricola1_d foreign key (matricola_docente) references docente (matricola1)
    on update cascade on delete no action
		);

CREATE INDEX codice_d ON corso (codice);

create table esame (
	codice_e varchar (100),
    matricola_studente int,
    data1 date,
    voto int,
    settore_scientifico varchar (100),
    primary key (codice_e),
    constraint fk_matricola_s foreign key (matricola_studente) references studente (matricola)
    on update cascade on delete no action,
    constraint fk_codice_ec foreign key (codice_e) references corso (codice)
    on update cascade on delete no action
    );
    
    select studente.matricola,studente.città,docente.nome,corso.nome_c
from studente
join esame on esame.matricola_studente = studente.matricola
join corso on corso.codice = esame.codice_e
join docente on docente.matricola1 = corso.matricola_docente
where voto > 28;

select docente.nome, corso.nome_c, esame.settore_scientifico
from docente
join corso on docente.matricola1 = corso.matricola_docente
join esame on corso.codice = esame.codice_e;