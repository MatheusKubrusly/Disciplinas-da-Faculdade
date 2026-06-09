set DateStyle = 'SQL, DMY';

---------------------------

--neste exemplo de inserção abaixo, eu consigo variar a ordem de entrada dos dados, não sendo preciso seguir a ordem de criação dos respectivos atributos
insert into itemconsumo (iditem, nomeitem, precounit, categoria, descricao) values (8,'suco de maracujá',6.99,'bebida','copo 400ml');

--neste exemplo de inserção abaixo, eu preciso pré-conhecer a ordem de criação dos atributos
insert into itemconsumo values (2,'cerveja',14.90,'bebida','long neck');
insert into itemconsumo values (15, 'cerveja', 8.50,'bebida','latinha pequena');

-- se eu tentar inserir os itens fora de ordem, terei um erro durante a inserção!
--insert into itemconsumo values (3,14.90,'cerveja','bebida','long neck');

--estas duas inserções abaixo possuem o mesmo efeito, posto que o último atributo permite a atribuição de um valor nulo
--insert into itemconsumo values (5,'água',5.00, 'bebida', null);
insert into itemconsumo values (5,'água',5.00, 'bebida');

--é possível adicionar mais de uma tupla de uma vez só dentro da tabela
insert into itemconsumo values (10,'coca-cola',7.50,'bebida','refrigerante'),(11,'tapioca',25.50,'comida','comida típica do nordeste');

--exibe a tabela itemconsumo com todas as suas respectivas tuplas 
select * from itemconsumo;


insert into cliente values (11,'Pedro'), (12,'Tony'), (13,'Manuela'), (14, 'Ana');
select * from cliente;
delete from cliente where nomecliente = '';

--se tentarmos adicionar um telefone com mais de 11 caracteres, teremos um erro!
insert into telcliente values (11, '21973519481'), (12, '21996497813');

--como não temos nenhum cliente com o respectivo id = 33, teremos um problema de referenciamento, pois este id é uma chave estrangeira que faz referência a cliente(id)
--insert into telcliente values (33, '21984577382');

insert into mesa values (100), (101), (102), (103), (104), (105);
select * from mesa;

insert into pedido values(40, '03/02/2026', 'fechado', null, 11, 101), (50, '26/02/2026', 'cancelado', 'comida fria', 13, 100), (54, '26/02/2026','fechado', null, 14, 100), (60, '15/03/2026', 'fechado', null, 13, 105), (65,'20/04/2026', 'cancelado', 'atraso no pedido', 12, 103), (99,'09/06/2026','aberto',null,13,102);
select * from pedido;

--este comando abaixo irá excluir todas as tuplas existentes na tabela "pedido"
--delete from pedido

--aumentando o preço da água após já ter criado a sua tupla dentro da tabela
update itemconsumo set precounit = 6.50 where nomeitem = 'água';
select * from itemconsumo where nomeitem = 'água';

--atualizar os preços dos itens em 20%
update itemconsumo set precounit=precounit*1.2;
select * from itemconsumo;

update itemconsumo set precounit=(precounit + 2) where nomeitem = 'tapioca' or nomeitem = 'cerveja';

--listando os itens e seus preços
select nomeitem, precounit from itemconsumo;

--listar os itens e preços das comidas
select nomeitem,precounit from itemconsumo where categoria = 'comida';

--listar as bebidas que custem mais de 10 reais
select nomeitem from itemconsumo where categoria = 'bebida' and precounit > 8.5;

--listar os itens do restaurante 
select distinct nomeitem from itemconsumo;
--perceba que apenas uma das cervejas existentes será exibida!

--neste caso, estas duas colunas das tuplas com nomeitem='cerveja' serão comparadas
select distinct nomeitem,categoria from itemconsumo;

--neste caso, as duas cervejas serão exibidas, pois suas descrições são diferentes!!
select distinct nomeitem, descricao from itemconsumo;

