use esercizio_d5;
  
  create table studenti (
	matricola_1 varchar (100) ,
    nome_studente varchar (100),
    anno_laurea year ,
    titolo_studio varchar (100),
    voto_laurea int,
   primary key (matricola_1)
 );
    
CREATE INDEX idx_matricola_s ON studenti (matricola_1);
    
create table dipartimento (
	codice_dipartimento int,
    nome_dipart varchar (100),
    settore_scientiifco varchar (100),
    num_docenti int,
    primary key (codice_dipartimento)
 );
 
 CREATE INDEX idx_codice_dipart ON dipartimento (codice_dipartimento);
    
create table concorsomaster (
    codice_master varchar (100),
    codice_dipart1 int,
    matricola_docente int,
    data_pub date,
    data_ex date,
    posti_available int,
    primary key (codice_master),
    constraint fk_codice_dipart1_m foreign key (codice_dipart1) references dipartimento (codice_dipartimento)
    on update cascade on delete no action
		);
        
create index idx_codice_m on concorsomaster (codice_master);

create table partecipantimaster (
	codice_dipart2 int,
    codice_master1 varchar (100),
    matricola_studente varchar (100),
    voto int,
    data_send_domanda date,
    primary key (codice_master1,matricola_studente),
    constraint fk_codice_dipart2_p foreign key (codice_dipart2) references dipartimento (codice_dipartimento)
    on update cascade on delete no action,
    constraint fk_codice_master1_p foreign key (codice_master1) references concorsomaster (codice_master)
    on update cascade on delete no action,
    constraint fk_matricola_studente_p foreign key (matricola_studente) references studenti (matricola_1)
    on update cascade on delete no action
    );

select studenti.matricola_1, nome_studente, dipartimento.settore_scientiifco
from dipartimento
inner join partecipantimaster on dipartimento.codice_dipartimento = partecipantimaster.codice_dipart2
inner join  studenti on studenti.matricola_1 = partecipantimaster.matricola_studente
group by studenti.matricola_1, studenti.nome_studente, partecipantimaster.codice_master1
having partecipantimaster.codice_master1 > 3 
order by studenti.nome_studente;

select dipartimento.nome_dipart, dipartimento.settore_scientiifco, count(concorsomaster.codice_master)
from dipartimento
inner join concorsomaster on dipartimento.codice_dipartimento = concorsomaster.codice_dipart1
where dipartimento.codice_dipartimento not in (select concorsomaster.codice_dipart1
												from concorsomaster
                                                where concorsomaster.posti_available <= 7)
group by dipartimento.nome_dipart, dipartimento.settore_scientiifco
order by dipartimento.nome_dipart, dipartimento.settore_scientiifco;

select studenti.matricola_1, studenti.nome_studente
from studenti
inner join partecipantimaster on studenti.matricola_1 = partecipantimaster.matricola_studente
inner join concorsomaster on partecipantimaster.codice_master1 = concorsomaster.codice_master
inner join concorsomaster as c2 on concorsomaster.data_pub = c2.data_pub
inner join partecipantimaster as ps on partecipantimaster.codice_dipart2 = ps.codice_dipart2
where studenti.voto_laurea > 100
and concorsomaster.data_pub = c2.data_pub
and partecipantimaster.codice_dipart2 <> ps.codice_dipart2
group by studenti.matricola_1, studenti.nome_studente
having count(distinct (partecipantimaster.data_send_domanda)) >= 2;

