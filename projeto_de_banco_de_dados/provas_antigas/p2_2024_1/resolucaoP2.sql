set DateStyle = 'SQL, DMY'; --changing runtime configurations

create table Produto (
	codigoProduto integer not null primary key,
	nomeProduto varchar(30) not null, 
	custoUnitario real not null,
	categoria varchar(20) not null, 
	dataValidade date not null
);

create table Receita (
	codigoReceita integer not null primary key,
	nomeReceita varchar(30) not null, 
	custoTotal real null --o cadastro do custo total não é obrigatório
);

create table Ingrediente (
	codigoReceita integer not null,
	codigoProduto integer not null,
	quantidade integer not null,
	primary key(codigoReceita, codigoProduto),
	foreign key(codigoReceita) references Receita(codigoReceita),
	foreign key(codigoProduto) references Produto(codigoProduto)
);

insert into Produto values (1, 'Fermento', 7.5, 'Embalados', '06/05/2030');
insert into Receita values (1, 'Bolo', 65.50);
insert into Ingrediente values (1,1,3);

alter table Receita alter column custoTotal drop not null;
insert into Receita values(2, 'Bolo de Fubá', null);
select custoTotal from Receita where custoTotal is not null;

--Deleta todos os dados das tabelas
delete from Ingrediente;
delete from Produto;
delete from Receita;

--Produto cartesiano entre as três tabelas
select * from Ingrediente,Produto,Receita;

--------------------------------------------------------------------------------------------

--Entrada de dados aleatórios para a tabela Produto
insert into Produto values (2, 'Farinha de Trigo', 5.50, 'Embalados', '15/12/2026');
insert into Produto values (3, 'Leite Integral', 4.80, 'Laticínios', '25/08/2026');
insert into Produto values (4, 'Ovos (Dúzia)', 9.00, 'Frescos', '30/06/2026');
insert into Produto values (5, 'Açúcar Refinado', 4.20, 'Embalados', '01/01/2028');
insert into Produto values (6, 'Chocolate em Pó', 14.50, 'Embalados', '15/05/2027');
insert into Produto values (7, 'Manteiga', 18.00, 'Laticínios', '20/10/2026');
insert into Produto values (8, 'Cenoura', 3.50, 'Hortifruti', '05/07/2026');
insert into Produto values (9, 'Óleo de Soja', 6.20, 'Embalados', '11/11/2027');

--------------------------------------------------------------------------------------------

--Entrada de dados aleatórios para a tabela Receita
insert into Receita values (2, 'Bolo de Cenoura', NULL);
insert into Receita values (3, 'Brigadeiro', 25.00);
insert into Receita values (4, 'Pão Caseiro', 15.50);
insert into Receita values (5, 'Massa de Panqueca', 10.00);

--------------------------------------------------------------------------------------------

--Entrada de dados aleatórios para a tabela Ingrediente

-- Ingredientes do Bolo de Cenoura (Código 2)
insert into Ingrediente values (2, 8, 3);   -- Cenoura
insert into Ingrediente values (2, 9, 150); -- Óleo
insert into Ingrediente values (2, 4, 4);   -- Ovos
insert into Ingrediente values (2, 2, 300); -- Farinha
insert into Ingrediente values (2, 5, 200); -- Açúcar

-- Ingredientes do Brigadeiro (Código 3)
insert into Ingrediente values (3, 3, 395); -- Leite
insert into Ingrediente values (3, 6, 50);  -- Chocolate em pó
insert into Ingrediente values (3, 7, 20);  -- Manteiga

--------------------------------------------------------------------------------------------

--Liste o código e o nome dos produtos que são ingredientes de receitas (usando operador de junção)
select p.codigoProduto,nomeProduto from Produto as p join Ingrediente as i on p.codigoProduto = i.codigoProduto;

--Apresente os produtos (por seus nomes) que façam parte da receita 'Brigadeiro' (usando operador de produto cartesiano e não o de junção)
select nomeProduto from Produto,Ingrediente,Receita where Produto.codigoProduto = Ingrediente.codigoProduto and Ingrediente.codigoReceita = Receita.codigoReceita and nomeReceita = 'Brigadeiro';

--Produza uma lista dos produtos da categoria 'Laticínios', mostrando o seu código, nome e o custo_aumentado (custo_unitario * 1.1). Apresente a saida em ordem decrescente de custo_aumentado.
select codigoProduto,nomeProduto, (custoUnitario*1.1) as custoAumentado from Produto where categoria = 'Laticínios' order by custoAumentado desc;

-- Apresente todas as receitas (por seus nomes) que façam uso dos produtos 'Leite Integral' e 'Manteiga' na mesma receita.
select receita_1.nomeReceita from
(select r.codigoReceita,nomeReceita from Produto as p, Ingrediente as i, Receita as r where p.codigoProduto = i.codigoProduto and i.codigoReceita = r.codigoReceita and nomeProduto = 'Leite Integral') as receita_1
,(select r.codigoReceita,nomeReceita from Produto as p, Ingrediente as i, Receita as r where p.codigoProduto = i.codigoProduto and i.codigoReceita = r.codigoReceita and nomeProduto = 'Manteiga') as receita_2 where receita_1.codigoReceita = receita_2.codigoReceita;

--Apresente todas as receitas (por seus nomes) que façam uso de qualquer açúcar (não utilizar da categoria e sim do nome do produto em si)
select nomeReceita from Produto,Ingrediente,Receita where Produto.codigoProduto = Ingrediente.codigoProduto and Ingrediente.codigoReceita = Receita.codigoReceita and (nomeProduto like 'Açúcar%');

--Mostre qual é o produto mais caro (e qual é esse custo)
select nomeProduto,custoUnitario from Produto where custoUnitario = (select max(custoUnitario) from Produto);

--Apresente quantos produtos aparecem na receita 'Brigadeiro'
select count(*) as numIngredientesBrigadeiro from Ingrediente,Receita where Ingrediente.codigoReceita = Receita.codigoReceita and nomeReceita = 'Brigadeiro';

--Apresente o código e o nome dos produtos que não aparecem em nenhuma receita
select Produto.codigoProduto,nomeProduto from Produto,Ingrediente where Produto.codigoProduto not in (select codigoProduto from Ingrediente);

--Atualize o custo_unitário dos produtos das categorias 'Embalados' e 'Hortifruti' em 10%
update Produto set custoUnitario = custoUnitario * 1.1 where categoria = 'Embalados' or categoria = 'Hortifruti';
select nomeProduto,custoUnitario from Produto where categoria = 'Embalados' or categoria = 'Hortifruti';
