select * from aluno;

select *
from aluno
limit 10;

select matricula
from aluno
order by matricula desc;

insert into aluno (nome, sobrenome, matricula, idade, sexo)
values ('Cesar', 'Norena', 131, 30, 'masculino');

select *
from aluno
where matricula = 131;

delete
from aluno
where matricula = 131;

select *
from aluno
order by matricula desc
limit 10;

select *
from aluno
where idade >= 30
  and sexo = 'masculino';

select avg(idade) as promedio_idade
from aluno;

select *, min(idade)
from aluno;

select * from aluno order by idade desc limit 1;

select sexo, count() as quantidade from aluno group by sexo;

select sexo, avg(idade) as idade_media from aluno group by sexo;
