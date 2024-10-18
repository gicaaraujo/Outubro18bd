CREATE database BancoDados_Empresa;
USE BancoDados_Empresa;

create table Depart(
id_depart bigint auto_increment primary key not null,
nome varchar (255) not null
);

create table Fun(
id_fun int auto_increment primary key not null,
nome varchar (100) not null,
salario decimal (10,2) not null,
id_depart bigint,
foreign key(id_depart) references Depart(id_depart)
);

create table dependente(
id_depen int auto_increment primary key not null,
nome varchar (100) not null,
id_fun int,
foreign key(id_fun) references Fun(id_fun)
);

INSERT INTO Depart(nome)
values  ("Recursos Humanos (RH)"),
("Financeiro"),
        ("Marketing"),
        ("Tecnologia da Informação (TI)"),
        ("Vendas");

INSERT INTO fun(nome,salario,id_depart)
values ("José","1200",1),
       ("João","2000",2),
       ("Maria","30000",4),
       ("Gustavo","25000",3),
       ("Giovanna","3000",5);
       
INSERT INTO dependente(nome,id_fun)
values ("Vinicius",1),
       ("Diogo",1),
       ("Lara",3),
       ("Theo",3),
       ("Bolt",4);

select * from fun;
select * from dependente;

select f.nome as funcionario, count(d.id_depen) AS quantidade_dependentes
from Fun f
join Dependente d on f.id_fun = d.id_fun
group by f.nome
having count(d.id_depen) > 1;

SELECT d.nome AS departamento, f.nome AS funcionario
FROM Depart d
LEFT JOIN Fun f ON d.id_depart = f.id_depart
ORDER BY d.nome ASC, f.nome ASC;

SELECT f.nome AS funcionario
FROM Fun f
LEFT JOIN Dependente d ON f.id_fun = d.id_fun
WHERE d.nome IS NULL;

SELECT d.nome AS departamento, AVG(f.salario) AS media_salarial
FROM Depart d
LEFT JOIN Fun f ON d.id_depart = f.id_depart
GROUP BY d.nome;

SELECT SUM(salario) AS total_salarios
FROM Fun;

SELECT d.nome AS departamento, SUM(f.salario) AS custo_setor
FROM Depart d
LEFT JOIN Fun f ON d.id_depart = f.id_depart
GROUP BY d.nome;