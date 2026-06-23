create table pessoa (
id_pessoa integer not null primary key,
nome varchar(50) not null,
data_nascimento date not null, 
genero char(1) null
);

create table artista (
id_artista integer not null primary key,
tipo_de_arte varchar(30) not null,
foreign key(id_artista) references pessoa(id_pessoa)
);

create table organizador (
id_organizador integer not null primary key,
cargo varchar(25) not null,
experiencia varchar(120) null,
foreign key(id_organizador) references pessoa(id_pessoa)
);

create table bloco_de_rua (
id_bloco integer not null primary key,
nome varchar(50) not null,
estilo_musical varchar(80) null,
data_bloco date not null,
hora char(5) not null,
trajeto varchar(50) not null, 
id_organizador integer not null, --obrigatoriamente terei que ter um organizador cadastrado para que eu possa vir a cadastrar um bloco_de_rua
foreign key(id_organizador) references organizador(id_organizador)
);

create table participante_bloco (
id_bloco integer not null,
id_pessoa integer not null,
primary key(id_bloco,id_pessoa),
foreign key(id_bloco) references bloco_de_rua(id_bloco),
foreign key(id_pessoa) references pessoa(id_pessoa)
);

--caso tenhamos alguma tabela que utilize de uma outra dentro de sua chave estrangeira, precisamos declarar as tabelas que irão ser utilizadas antes!
create table desfile (
id_desfile integer not null primary key,
data_desfile date not null,
--podemos preencher o local e o publico_estimado após já termos criado a tabela desfile
local_desfile varchar(80) null, 
publico_estimado integer null
);

create table escola_de_samba (
id_escola integer not null primary key,
nome varchar(50) not null,
enredo varchar(50) not null,
cores varchar(50) not null, --talvez fosse melhor fragmentar este atributo em uma relação, simulando o que aconteceria quando temos atributos multivalorados
nota_no_desfile real null, --a escola de samba poderá ser criada antes da existência de algum desfile prévio
id_desfile integer null, --a escola de samba poderá ser criada antes da existência de algum desfile prévio
foreign key(id_desfile) references desfile(id_desfile)
);

create table escola_artista (
id_escola integer not null,
id_artista integer not null,
primary key(id_escola,id_artista),
foreign key(id_escola) references escola_de_samba(id_escola),
foreign key(id_artista) references artista(id_artista)
);

alter table bloco_de_rua alter hora type char(8);
alter table bloco_de_rua alter trajeto drop not null;
-------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------

-- 1. Inserindo na tabela base: pessoa
insert into pessoa (id_pessoa, nome, data_nascimento, genero) values
(1, 'Milton Cunha', '1962-03-19', 'M'),
(2, 'Zeca Pagodinho', '1959-02-04', 'M'),
(3, 'Ivete Sangalo', '1972-05-27', 'F'),
(4, 'Anitta', '1993-03-30', 'F'),
(5, 'João do Pandeiro', '1980-10-15', 'M');

-- 2. Inserindo nas especializações de pessoa: organizador e artista
insert into organizador (id_organizador, cargo, experiencia) values
(1, 'Diretor Geral', null),
(3, 'Produtora Executiva', null);

insert into artista (id_artista, tipo_de_arte) values
(2, 'músico'),
(3, 'músico'),
(4, 'músico'),
(5, 'passista');

-- 3. Inserindo blocos de rua (dependentes de organizador)
insert into bloco_de_rua (id_bloco, nome, estilo_musical, data_bloco, hora, trajeto, id_organizador) values
(101, 'Bloco do Milton', 'Samba', '2025-02-28', '14:00:00', 'Ipanema-Centro', 1),
(102, 'Vou passar', 'Marchinha', '2025-02-05', '09:00:00', null, 3),
(103, 'Bloco de Domingo', 'Axé', '2025-03-02', '16:00:00', 'Copacabana-Flamengo', 1),
(104, 'Folia no Recreio', 'Samba', '2025-03-05', '18:00:00', 'Recreio-Barra', 3);

-- 4. Inserindo participantes dos blocos
insert into participante_bloco (id_bloco, id_pessoa) values
(101, 2),
(101, 4),
(102, 5),
(103, 2); --uma mesma pessoa pode participar de blocos diferentes!

-- 5. Inserindo desfiles (tabela independente)
insert into desfile (id_desfile, data_desfile, local_desfile, publico_estimado) values
(201, '2025-03-01', 'Marquês de Sapucaí', 70000),
(202, '2025-03-02', 'Marquês de Sapucaí', 75000);

-- 6. Inserindo escolas de samba (dependentes de desfile)
insert into escola_de_samba (id_escola, nome, enredo, cores, nota_no_desfile, id_desfile) values
(301, 'Mangueira', 'As Máscaras da Vida', 'Verde e Rosa', 9.9, 201),
(302, 'Portela', 'O Mar azul', 'Azul e Branco', 10.0, 201),
(303, 'Salgueiro', 'Fogo e Paixão', 'Vermelho e Branco', 10.0, 202),
(304, 'Mocidade', 'Tempo de Máscaras Antigas', 'Verde e Branco', 9.8, 202);

-- 7. Inserindo relação entre escolas e artistas
insert into escola_artista (id_escola, id_artista) values
(301, 2),
(302, 3),
(303, 4),
(304, 5);

-------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------

--liste todos os artistas (por meio de seus nomes) cujo tipo de arte seja 'músico' (sem operador de junção)
select nome from pessoa as p, artista as a where p.id_pessoa = a.id_artista and tipo_de_arte = 'músico';

--liste todos os estilos musicais do bloco organizado pelo Milton Cunha (utilizando operador de junção)
select estilo_musical 
from ((pessoa join organizador on pessoa.id_pessoa = organizador.id_organizador) join bloco_de_rua on bloco_de_rua.id_organizador = organizador.id_organizador)
where pessoa.nome = 'Milton Cunha';
--quando utilizamos da cláusula "join" de forma aninhada, devemos utilizar da cláusula "on" para todos os que estiverem aninhados

--Qual a quantidade de blocos por estilo musical?
select estilo_musical,count(*) from bloco_de_rua group by estilo_musical;

--Qual é a escola de samba com a maior nota?
select nome from escola_de_samba where nota_no_desfile = (select max(nota_no_desfile) from escola_de_samba);

--Quais as escolas de samba que irão desfilar no dia 01/03/2025?
select nome from escola_de_samba,desfile where escola_de_samba.id_desfile = desfile.id_desfile and data_desfile = '2025-03-01';

--Liste todos os blocos e escolas de samba que irão desfilar no dia 02/03/2025 (iremos considerar ambos os atributos referentes ao nome da escola de samba e ao nome do bloco pertencentes ao mesmo domínio)
(select nome from bloco_de_rua where data_bloco = '2025-03-02') union (select nome from escola_de_samba,desfile where escola_de_samba.id_desfile = desfile.id_desfile and data_desfile = '2025-03-02')

--Encontre as escolas de samba (por meio de seus nomes) que possuem alguma ocorrência sobre 'Máscaras' nos seus enredos
select nome from escola_de_samba where enredo like '%Máscaras%';

--Liste os blocos (código,nome) que não estão com o trajeto definido
select id_bloco,nome from bloco_de_rua where trajeto is null;


--Encontre os pares de blocos que possuem o mesmo estilo musical
--...
--Esta resposta abaixo me retorna o que eu quero, porém, talvez ela não funcione em um caso real onde teremos dados diversos dentro das tabelas.
--Estes blocos retornados abaixos representam os blocos que possuem o mesmo estilo musical que um outro bloco também existente.
select nome,estilo_musical from bloco_de_rua where estilo_musical in
(select estilo_musical from (select estilo_musical, count(*) as qtd_blocos_estilo from bloco_de_rua group by estilo_musical) where qtd_blocos_estilo > 1)
--A alternativa que funcionaria para todos os tipos de cenários seria:
--Ao invés de utilizarmos de '<>' na hora de avaliar os id's, nós vemos se ele se o id do segundo bloco avaliado é maior do que o do primeiro, evitando que combinemos pares de forma intercalada (Ex.: 'Bloco 1 e Bloco 2' e 'Bloco 2 e Bloco 1' dentro da mesma tabela)
select (b1.nome || ' e ' || b2.nome) as pares_blocos, b1.estilo_musical from bloco_de_rua b1 join bloco_de_rua b2 on b1.estilo_musical = b2.estilo_musical and b1.id_bloco < b2.id_bloco;


--Informe o público estimado para as escolas de samba que irão se apresentar no dia 01/03/2025
select nome as desfile_escola, publico_estimado from escola_de_samba,desfile where escola_de_samba.id_desfile = desfile.id_desfilE and data_desfile = '2025-03-01';

--atualizando a data do bloco "Vou passar"
update bloco_de_rua set data_bloco = '2025-02-10';

--testando a cláusula "distinct"
insert into pessoa (id_pessoa,nome,data_nascimento,genero) values  (10, 'Milton Cunha', '1962-03-19', 'M');
select nome,data_nascimento from pessoa; --aqui eu tenho a exibição de dois 'Milton Cunha', mesmo que a combinação das colunas exibidas seja a mesma
select distinct nome,data_nascimento from pessoa; --aqui eu tenho a exibição de apenas um 'Milton Cunha', pois ele bloqueia a combinação de colunas com os mesmos valores por estarmos usando de "distinct"
