create table cliente (
idcliente integer not null ,
nomecliente varchar(30) not null,
primary key(idcliente)
);

create table itemconsumo (
iditem integer not null,
nomeitem varchar(30) not null,
precounit real not null,
categoria char(6) not null, --apenas utilizaremos das categorias "comida" e "bebida", ambos com 6 caracteres
descricao varchar(140) null,
primary key(iditem)
);

create table mesa (
idmesa integer not null primary key
);

create table telcliente (
idcliente integer not null,
telefone char(11) not null,
primary key(idcliente, telefone),
foreign key(idcliente) references cliente(idcliente)
);

create table pedido(
idpedido integer not null primary key,
dtpedido date not null,
situacao varchar(15) not null, 
motivocancel varchar(150) null,
idcliente integer not null,
idmesa integer not null,
foreign key(idcliente) references cliente(idcliente),
foreign key(idmesa) references mesa(idmesa) --uma chave estrangeira só existe se o atributo referenciado for uma chave primária!
);

create table nota (
numeronota integer not null primary key, 
datapagamento date not null,
idpedido integer not null,
foreign key(idpedido) references pedido(idpedido)
);

create table itempedido (
idpedido integer not null,
iditem integer not null,
quantidade real not null,
primary key(idpedido, iditem),
foreign key(idpedido) references pedido(idpedido),
foreign key(iditem) references itemconsumo(iditem)
)

alter table itempedido rename quantidade to qtd;

-----------------------------------------------------

insert into cliente (idcliente, nomecliente) values (01, 'matheus')
insert into cliente (idcliente, nomecliente) values (02, 'renan')
insert into cliente (idcliente, nomecliente) values (03, '')
insert into telcliente(idcliente, telefone) values (01, 21973518481)

select * from cliente --comando de consulta
select * from telcliente

