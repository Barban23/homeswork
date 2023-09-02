create database esercizio_lezione_d7;

use esercizio_lezione_d7;

create table dipendente (
	id int auto_increment not null,
    nome varchar (100),
    cognome varchar (100),
    email varchar (100) unique,
    numerotelefono int unique,
    data_assunzione date,
    id_lavoro varchar (100),
    salario decimal (10,2),
    id_manager varchar (100),
    id_dipartimento int,
   primary key (id,id_manager)
 );
 
 create index idx_id_manager on dipendente (id_manager);
 
 create table dipartimento (
 id_dipartimento int auto_increment,
 nome_dip varchar (100),
 id_manager varchar (100),
 id_location varchar (100),
 primary key (id_dipartimento,id_manager),
 constraint fk_id_manager foreign key (id_manager) references dipendente (id_manager)
 on update cascade on delete no action
 );
 
 create index idx_id_dipart on dipartimento (id_dipartimento);
 
ALTER TABLE dipendente
ADD CONSTRAINT fk_id_dipart
FOREIGN KEY (id_dipartimento)
REFERENCES dipartimento (id_dipartimento)
on update cascade on delete no action;

alter table dipendente
modify numerotelefono varchar (255) unique;

insert into dipendente (nome,cognome,email,numerotelefono,data_assunzione,id_lavoro,salario,id_manager)
values ('stefania','iadeluca','stefaniaiadeluca@local.it',3459874569,'2019-05-23','ar698',35000.00,'ck123'),
		('melani','serra','melaniaserra@local.it',3459889569,'2021-08-07','ar697',30000.00,'cg123'),
        ('emanuele','notaro','emanuelenotaro@local.it',3459879109,'2023-06-05','ar696',21000.00,'lo123'),
        ('ginevra','cestra','ginevracestra@local.it',3459874874,'2018-07-21','ar695',50000.00,'ck00'),
        ('davide','deias','davidedeias@local.it',3459985569,'2017-05-05','ar694',40000.00,'cg563'),
        ('claudia','parisi','claudiaparisi@local.it',3489874569,'2015-12-01','ar693',58000.00,'lm896'),
        ('luca','chicone','lucachicone@local.it',3359887569,'2019-05-27','ar692',31000.00,'lo163');
        
alter table dipartimento
auto_increment = 1000;
        
insert into dipartimento (nome_dip, id_manager, id_location)
	values ('amministrazione','ck123','xb7c6'),
			('economato','cg123','xb8l4'),
            ('ricerca','lo163','ty7c6'),
            ('sviluppo','lo123','xb7c6'),
            ('progettazione','cg563','ty7d5');
            
UPDATE dipendente
SET id_dipartimento = 1004
WHERE id=5;

insert into dipartimento (id_dipartimento,nome_dip, id_manager, id_location)
	values (1000,'amministrazione','ck00', 'xb7c6'),
			(1004,'progettazione','lm896','ty7d5');
            
update dipendente
set data_assunzione = '2019-06-27'
where id=7;

SELECT distinct dipendente.nome, dipendente.cognome, dipartimento.nome_dip,DATE_FORMAT(dipendente.data_assunzione, '%M %d %Y') AS data_formattata
from dipendente
inner join dipartimento on dipartimento.id_dipartimento=dipendente.id_dipartimento
where dipartimento.nome_dip='amministrazione';

select dipendente.nome, dipendente.cognome
from dipendente
where month (dipendente.data_assunzione) = 6;

select year(dipendente.data_assunzione)
from dipendente
group by year(dipendente.data_assunzione)
having count(dipendente.id) > 10;

select distinct concat(dipendente.nome,' ',dipendente.cognome), dipendente.salario, dipartimento.nome_dip
from dipendente
inner join dipartimento on dipartimento.id_manager=dipendente.id_manager
where datediff(now(),dipendente.data_assunzione)>1825;