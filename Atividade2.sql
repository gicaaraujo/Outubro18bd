create view VW_LISTA_FUNCIONARIOS as
select nome_fun, especialidade
from funcionario;

select *from VW_LISTA_FUNCIONARIOS;

create view VW_LISTA_DEPENDENTES AS
SELECT nome_depen
from dependentes;

select *from VW_LISTA_DEPENDENTES;

create view VW_FUNCIONARIO_COM_DEPENDENTE AS
select funcionario.nome_fun, dependentes.nome_depen
from funcionario
inner join dependentes
on funcionario.cod_fun = dependentes.cod_fun;

select *from VW_FUNCIONARIO_COM_DEPENDENTE;

create view vw_funcionario_e_dependente as
select funcionario.nome_fun, dependentes.nome_depen
from funcionario
left join dependentes
on funcionario.cod_fun = dependentes.cod_fun;

select * from vw_funcionario_e_dependente;

create view vw_dependente as
select funcionario.nome_fun, dependentes.nome_depen
from funcionario
right join dependentes
on funcionario.cod_fun = dependentes.cod_fun;

select * from vw_dependente;