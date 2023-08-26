use esercizio_d5;

select studente.matricola, studente.nome, max(voto), min(voto), avg(voto)
from esame
inner join studente on studente.matricola = esame.matricola_studente
group by studente.matricola, studente.nome;

select studente.matricola, studente.nome, max(voto) as voto_max, min(voto), avg(voto)
from esame
join studente on studente.matricola = esame.matricola_studente
group by studente.matricola, studente.nome, esame.voto
having avg(voto) > 25 and count(distinct (data1)) >= 10
order by voto_max asc;

