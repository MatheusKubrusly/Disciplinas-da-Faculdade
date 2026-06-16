--Listar os clientes do restaurante 
select nomecliente from cliente;
select telefone from telcliente;

--Aqui estamos garantindo que a nova tabela gerada apenas irá exibir o produto cartesiano que corresponda ao par (nomecliente,telefone) que de fato se relacionam!
--Quando formos utilizar de variáveis de nomes iguais e que pertençam a tabelas diferentes, precisamos identificar a sua origem utilizando de um alias!
select nomecliente,telefone from cliente,telcliente where cliente.idcliente = telcliente.idcliente;

--Listar os clientes e seus telefones dando um apelido para as tabelas utilizadas (Obs.: teremos o mesmo resultado da linha de comando acima!)
select nomecliente,telefone from cliente as c,telcliente as t where c.idcliente = t.idcliente;

--Listar os clientes que tiveram pedidos cancelados e o motivo do cancelamento
select nomecliente, idpedido, situacao, motivocancel from cliente,pedido where cliente.idcliente = pedido.idcliente and situacao = 'cancelado';

--Listar o nome e o telefone dos clientes que tiveram pedidos fechados
select nomecliente,telefone,idpedido,situacao from cliente,telcliente,pedido where cliente.idcliente = telcliente.idcliente and cliente.idcliente = pedido.idcliente and situacao = 'fechado';

--Listar os clientes que fizeram pedidos e possuem nota fiscal...
select * from cliente;
select * from pedido;
insert into nota values (1,'06/06/2026',40),(2,'07/06/2026',50);
select * from nota;
select nomecliente from cliente,pedido,nota where cliente.idcliente = pedido.idcliente and nota.idpedido = pedido.idpedido;


--Listar os clientes e seus telefones utilizando a cláusula "join"
--select nomecliente,telefone from cliente c inner join telcliente t on c.idcliente = t.idcliente; (esta linha possui o mesmo resultado da linha abaixo)
select nomecliente,telefone from cliente c join telcliente t on c.idcliente = t.idcliente;

--Listar todos os clientes e seus telefones (e mesmo aqueles que não têm telefones)
select nomecliente,telefone from cliente c left join telcliente t on c.idcliente = t.idcliente;

--Apresente os itens do restaurante de modo ordenado
select nomeitem from itemconsumo order by nomeitem;

--Apresente os itens do restaurante do mais caro para o mais barato
select nomeitem,precounit from itemconsumo order by precounit desc;

--Apresente os itens do restaurante do mais barato para o mais caro
select nomeitem,precounit from itemconsumo order by precounit asc;

select nomeitem from itemconsumo where categoria = 'bebida'
union all
select nomeitem from itemconsumo where categoria = 'comida';



--Funções de agregação
--count(*) realiza a contagem do número de tuplas de uma determinada tabela
select count(*) from itemconsumo;

select count(*)
from cliente c left join telcliente t on c.idcliente = t.idcliente
join pedido p on c.idcliente = p.idcliente
where situacao = 'fechado';

--Podemos utilizar destas funções de agregação todas juntas dentro de uma única cláusula "select" ou podemos utilizá-los de forma separada
select min(precounit) from itemconsumo;
select max(precounit) from itemconsumo;
select sum(precounit) from itemconsumo;
select avg(precounit) as media from itemconsumo where categoria = 'bebida';

--Obter o preço máximo por categoria
select categoria,precounit from itemconsumo;
select categoria, max(precounit) from itemconsumo 
group by categoria; --este atributo utilizado como agrupamento é geralmente utilizado quando temos algum atributo que se repete ou que possui poucos valores possíveis

--Obter o preço máximo por categoria se ele for menor que 30
select categoria,max(precounit) from itemconsumo
group by categoria having max(precounit) < 30; --a cláusula "having" está atrelada a cláusula "group by"

--Ordem de sintaxe entre as cláusulas:
--select 
--from 
--where 
--group by 
--having 
--order by


--Apresente os itens que não tem descrição
select nomeitem from itemconsumo where descricao is null;

--Concatenação
select idpedido || ' ' || situacao as pedido from pedido;

--Apresente o preço atual de cada item e uma projeção do preço aumentado em 10%
select precounit as preco_atual, round(cast(precounit*1.1 as numeric),2) as projecao_preco from itemconsumo
--Ao invés de utilizarmos "update" e de fato alterarmos o preço de dentro da tabela, podemos obter uma projeção da modificação utilizando da cláusula "select"
--Ao utilizarmos do round(), precisamos primeiro converter o valor para numérico e depois escolhermos o número de casas que queremos representar


--Apresente qual é o produto que tem o valor máximo
--select nomeitem from itemconsumo order by precounit desc limit 1
--select nomeitem from itemconsumo where precounit in (select max(precounit) from itemconsumo); (possui o mesmo resultado da linha abaixo)
select nomeitem from itemconsumo where precounit = (select max(precounit) from itemconsumo);
