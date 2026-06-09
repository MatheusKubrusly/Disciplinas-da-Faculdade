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
