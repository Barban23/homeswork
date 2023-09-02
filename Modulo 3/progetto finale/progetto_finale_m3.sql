create database gestione_magazzino_visconti;

use gestione_magazzino_visconti;

create table fornitori (
	id int auto_increment primary key,
	nome varchar (255) unique,
	indirizzo varchar (255) unique,
	descrizione varchar (255),
	consegna varchar (255),
    rappresentante_zona varchar (255) unique
);

alter table fornitori
auto_increment =1;

insert into fornitori (nome,indirizzo,descrizione,consegna,rappresentante_zona)
	values ('doreca','via della magliana 152','fornitore bevande','lunedì,mercoledì,venerdì','candela'),
			('rocchi','via dei giustiniani 21','fornitore vini','martedì,giovedì','luchini'),
            ('pieragostini','piazza scanderberg 2','fornitore vini e distillati','lunedì,mercoledì,venerdì','a.cruciani'),
            ('faic','via nazionale 25','fornitore generale','tutti','romboni'),
            ('colapicchioni','via cesi 20','fornitore pane e panificati','tutti','l.colapicchioni'),
            ('mochi','via cesi 2','fornitore frutta e verdura','tutti','giovinazzo'),
            ('intros',' wilkman avenue 156c','fornitore hotellerie','giovedì','e.smith'),
            ('la bottega','via di rienzo 25','fornitore hotelleri','martedì','serpico'),
            ('nestlè','via XX settembre','fornitore preparati solubili','mercoledì','casagrande'),
            ('j.perrier','via imperiali 89','fornitore champagne','tutti','rossi'),
            ('freccianera','via ostiense 41','fornitore vino','lunedì e venerdì','moricone'),
            ('magris','via della magliana 1156','fornitore detersivi','tutti','m.cruciani')
;

update fornitori
set indirizzo = 'wilkman avenue 156c'
where id=7;

update fornitori
set consegna = 'lunedì,venerdì'
where id=11;

create index idx_id_forn on fornitori (id);

create table prodotti (
	id int auto_increment primary key,
    id_fornitore int,
    descrizione varchar (255),
    categoria varchar (255),
    formato varchar (255),
    prezzo decimal (10,2),
    constraint fk_id_f foreign key (id_fornitore) references fornitori (id)
    on update cascade on delete no action
);

create index idx_id_prod on prodotti (id);

alter table prodotti
auto_increment = 100;

insert into prodotti (id_fornitore,descrizione,categoria,formato,prezzo)
	values (1,'coca cola','bevande','33 cl',1.29),
			(1,'pepsi','bevande','33 cl',1.24),
            (10,'champagne brut joseph perrier','vino','75 cl',10.23),
            (11,'freccianera saten','vino','75 cl',7.29),
            (6,'pomodoro datterino','verdura','kg',2.45),
            (6,'fragole','frutta','kg',3.80),
            (12,'carta igienica fascette','detersivi','cf 24',0.90),
            (7,'shower gel','camere','75 ml',0.56),
            (5,'panini al latte','pane','kg',2.30),
            (3,'aperol','liquori','75 cl',7.26),
            (3,'vodka titos','distillati','75 cl',9.36),
            (7,'vanity kit','camere','cf 1000',0.23),
            (2,'rhum pampero','distillati','75 cl',7.36),
            (3,'campari','distillati','75 cl',8.24),
            (2,'quinti bellone','vini','75 cl',6.36),
            (3,'chianti peppoli','vini','75 cl',10.36),
            (6,'melone retato','frutta','kg',2.60),
            (6,'ananas','frutta','kg',5.80),
            (6,'carote','verdura','kg',1.80),
            (6,'zucchine','verdura','kg',2.35),
            (7,'phon','camere','1',12.69),
            (7,'shoe mitt','camere','cf 250',0.53),
            (8,'body lotion','camere','cf 300',0.63),
            (8,'tumbler aere','camere','cf 3',1.23)
;
    
create table magazzino_bev (
	id int auto_increment primary key,
    id_prodotti int,
    id_fornitori int,
    location varchar (255),
    quantità decimal (10,2),
    constraint fk_id_prodotti_b foreign key (id_prodotti) references prodotti (id)
    on update cascade on delete no action,
    constraint fk_id_fornitori_b foreign key (id_fornitori) references fornitori (id)
    on update cascade on delete no action
);

alter table magazzino_bev
auto_increment = 1000;

insert into magazzino_bev (id_prodotti,id_fornitori,location,quantità)
	values (100,1,'magazzino -1',144),
			(102,10,'magazzino -1',24),
            (109,2,'magazzino -1',18),
            (110,3,'magazzino -1',18),
            (113,3,'magazzino -1',12),
            (109,3,'magazzino -1',6),
            (109,2,'magazzino -1',6),
            (109,2,'magazzino -1',24),
            (101,1,'magazzino -1',72)
;

create table magazzino_food (
	id int auto_increment key,
    id_prodotti int,
    id_fornitori int,
    location varchar (255),
    quantità int,
    constraint fk_id_prodotti_f foreign key (id_prodotti) references prodotti (id)
    on update cascade on delete no action,
    constraint fk_id_fornitori_f foreign key (id_fornitori) references fornitori (id)
    on update cascade on delete no action
);

alter table magazzino_food
auto_increment = 1500;

insert into magazzino_food (id_prodotti,id_fornitori,location,quantità)
	values (119,6,'magazzino 0',2.20),
            (105,6,'magazzino 0',1.10),
            (104,6,'magazzino 0',1.10),
            (108,5,'magazzino 0',1.10),
            (118,6,'magazzino 0',1.10),
            (117,6,'magazzino 0',1.10),
            (116,6,'magazzino 0',1.10)

;

create table magazzino_camere (
	id int auto_increment primary key,
    id_prodotti int,
    id_fornitori int,
    location varchar (255),
    quantità int,
    constraint fk_id_prodotti_c foreign key (id_prodotti) references prodotti (id)
    on update cascade on delete no action,
    constraint fk_id_fornitori_c foreign key (id_fornitori) references fornitori (id)
    on update cascade on delete no action
);

alter table magazzino_camere
auto_increment=2000;

insert into magazzino_camere (id_prodotti,id_fornitori,location,quantità)
	values (107,7,'magazzino -3',4500),
			(111,8,'magazzino -3',3000),
            (120,8,'magazzino -3',20),
            (121,7,'magazzino -3',1600),
            (122,7,'magazzino -3',1440),
            (123,7,'magazzino -3',30)
;

create table prelievi (
	id int auto_increment primary key,
    data_prelievo date,
    id_prodotti int,
    nome_richiesta varchar (255),
    nome_prelievo varchar (255),
    quantità int,
    constraint fk_id_prodotti_p foreign key (id_prodotti) references prodotti (id)
    on update cascade on delete no action
);

alter table prelievi
auto_increment=0;

alter table prelievi
modify quantità decimal (10.2);

insert into prelievi (data_prelievo,id_prodotti,nome_richiesta,nome_prelievo,quantità)
	values ('2022-06-12',100,'stefano','emanuele',24),
			('2022-06-12',101,'sajib','emanuele',24),
            ('2022-04-13',105,'giuseppe','emanuele',0.5),
            ('2022-04-01',123,'antonio','emanuele',3),
            ('2022-01-12',107,'luca','emanuele',250),
            ('2022-06-12',109,'alessandro','emanuele',6),
            ('2022-02-20',110,'alessandro','emanuele',6),
            ('2022-07-01',122,'floriana','emanuele',750),
            ('2022-07-10',113,'stefano','emanuele',12),
            ('2022-07-15',114,'stefano','emanuele',6),
            ('2022-07-30',115,'stefano','emanuele',6)
;

-- qual'è il mese in cui sono stati fatti più prelievi? --

select monthname(data_prelievo) as mese,COUNT(*) as conteggio_prelievi
from prelievi
group by mese
order by conteggio_prelievi desc
limit 1;

-- qual'è il fornitore della coca cola? --

select fornitori.nome
from fornitori
inner join prodotti on fornitori.id=prodotti.id_fornitore
where prodotti.descrizione like 'coca%';

-- quante fragola abbiamo in magazzino? --
select distinct prodotti.descrizione, magazzino_food.quantità as giacenza,prelievi.quantità as prelievo, magazzino_food.quantità - prelievi.quantità as differenza
from prodotti
inner join prelievi on prodotti.id=prelievi.id_prodotti
inner join magazzino_food on prelievi.id_prodotti=magazzino_food.id_prodotti	
where prodotti.descrizione ='fragole';

-- qual'è il valore del'aperol in magazzino? --

select prodotti.descrizione,magazzino_bev.id_prodotti,sum(magazzino_bev.quantità) as somma_quantità,prodotti.prezzo,sum(magazzino_bev.quantità) * prodotti.prezzo as totale
from magazzino_bev
inner join prodotti on magazzino_bev.id_prodotti = prodotti.id
where magazzino_bev.id_prodotti in (select magazzino_bev.id_prodotti
		from magazzino_bev
        inner join prodotti on magazzino_bev.id_prodotti=prodotti.id
        where descrizione ='aperol')
group by magazzino_bev.id_prodotti, prodotti.prezzo;

-- in che date è stato prelevato l'aperol? --

select distinct prelievi.data_prelievo
from prelievi
inner join prodotti on prelievi.id_prodotti = prodotti.id
where prodotti.descrizione = 'aperol';

-- da quanto tempo non viene prelevato lo shower gel, e chi è stato l'ultimo ad averlo prelevato? --

select datediff(now(), ultima_data_prelievo) as giorni_passati,
    ultimo_prelievo.nome_prelievo as ultimo_prelievo_utente
from (
    select
        max(data_prelievo) AS ultima_data_prelievo,
        nome_prelievo
    from prelievi
    where id_prodotti = (select id from prodotti where descrizione = 'shower gel')
    group by nome_prelievo
) as ultimo_prelievo;

-- qual'è il valore di tutto il magazzino camere? --

select sum(magazzino_camere.quantità * prodotti.prezzo) as valore_magazzino
from magazzino_camere
inner join prodotti on magazzino_camere.id_prodotti = prodotti.id;

-- chi ha fatto più richieste di prelievi? e in che date? --

select nome_richiesta,count(nome_richiesta) as numero_di_prelievi, group_concat(distinct data_prelievo) as date_dei_prelievi
from prelievi
group by nome_richiesta
order by numero_di_prelievi desc
limit 1;			-- nota che con il COUNT mi restituisce 8, non riesco a capire come fare per far tornare 4 nonostante nelle date ci sono solo 4 valori --

-- quante volte sono stati fatti prelievi di prodotti dal magazzino beverage? --
select count(*) as numero_di_prelievi
from prelievi
where id_prodotti in (select distinct id_prodotti from magazzino_bev);

-- abbiamo prodotti non presenti nei magazzini? --

select p.descrizione as prodotto_non_presente
from prodotti p
left join magazzino_bev mb on p.id = mb.id_prodotti
left join magazzino_food mf on p.id = mf.id_prodotti
left join magazzino_camere mc on p.id = mc.id_prodotti
where mb.id is null and mf.id is null and mc.id is null;

