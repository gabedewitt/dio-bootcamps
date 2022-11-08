-- criação do banco de dados para o cenário de E-commerce
create database if not exists ecommerce_refinado;
use ecommerce_refinado;

-- drop database ecommerce_refinado;

-- cria tabela cliente

create table clientes(
		idCliente int auto_increment primary key,
        Fname varchar(20) not null,
        Minit char(3),
        Lname varchar(20) not null,
        CPF_CNPJ varchar(14) not null,
        Address varchar(255),
        constraint unique_cpf_cnpj_cliente unique(CPF_CNPJ)
);

alter table clientes auto_increment=1;

-- cria tabela produto

-- size = dimensão do produto
create table produtos(
		idProduto int auto_increment primary key,
        Pname varchar(40) not null,
        produtoDescricao varchar(255),
        categoria ENUM('Eletrônicos', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis', 'Livros') default 'Eletrônicos' not null,
        avaliação float default 0,
        tamanho varchar(25) default null,
        preçoUnitário float not null
);

-- cria tabela pagamentos
create table pagamentos(
        idPagamento int auto_increment primary key,
        tipoPagamento enum('Boleto', 'Cartão', 'Dois cartões', 'PIX'),
        limiteDisponivel float,
        dataValidade date
);

-- cria relacionamento cliente e forma de pagamento 

create table pagamentoCliente(
		idPCliente int,
        idPPagamento int,
        primary key (idPCliente, idPPagamento),
        constraint fk_storage_location_product foreign key(idPCliente) references clientes(idCliente),
        constraint fk_storage_location_storage foreign key(idPPagamento) references pagamentos(idPagamento)
);

-- cria tabela pedido
create table pedidos(
		idPedido int auto_increment primary key,
        idPedidoCliente int,
        statusPedido enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
        descricaoPedido varchar(255),
        valorFrete float default 10,
        valorProdutos float not null,
        idPagamento int,
        constraint fk_pedidos_cliente foreign key (idPedidoCliente) references clientes(idCliente),
        constraint fk_pedidos_pagamento foreign key (idPagamento) references pagamentoCliente(idPPagamento)
);

-- cria tabela estoque

create table estoqueProduto(
		idEstoqueProduto int auto_increment primary key,
        localEstoque varchar(255), 
        quantidade int default 0   
);

-- cria tabela fonecedor

create table fornecedores(
		idFornecedor int auto_increment primary key,
        razaoSocial varchar(255) not null,
        CNPJ char(14) not null,
        contato char(11) not null,
        constraint unique_fornecedor unique(CNPJ)
);

-- cria tabela vendedor
create table vendedores(
		idVendedor int auto_increment primary key,
        razaoSocial varchar(255) not null,
        nomeFantasia varchar(255),
        CPF_CNPJ varchar(14) not null,
        localizacao varchar(255),
        contato char(11) not null, 
        constraint unique_cpf_cnpj_seller unique (CPF_CNPJ)
);

-- cria tabela entrega

create table entregas(
		idEntrega int auto_increment primary key,
        idPedido int,
        codRastreio varchar(25),
        statusEntrega ENUM('Saiu para entrega', 'Entregue', 'Em processamento') default 'Em processamento',
        constraint fk_entregas_pedido foreign key(idPedido) references pedidos(idPedido)
);

-- criando tabelas de relacionamento N para M
create table produtoVendedor(
		idPVendedor int,
        idPVproduto int,
        prodQuantity int default 1,
        primary key (idPVendedor, idPVproduto),
        constraint fk_produto_vendedor foreign key(idPVendedor) references vendedores(idVendedor),
        constraint fk_produto_produto foreign key(idPVproduto) references produtos(idProduto)
);

create table produtoPedido(
		idPOproduto int,
        idPOpedido int,
        poQuantidade int default 1,
        poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
        primary key (idPOproduto, idPOpedido),
        constraint fk_produtopedido_produto foreign key(idPOproduto) references produtos(idProduto),
        constraint fk_produtopedido_pedido foreign key(idPOpedido) references pedidos(idPedido)
);

create table produtoLocal(
		idLProduto int,
        idLEstoque int,
        localizacao varchar(255) not null,
        primary key (idLProduto, idLEstoque),
        constraint fk_local_estoque_produto foreign key(idLProduto) references produtos(idProduto),
        constraint fk_local_estoque_estoque foreign key(idLEstoque) references estoqueProduto(idEstoqueProduto)
);

create table produtoFornecedor(
		idPfFornecedor int,
        idPfProduto int,
        quantity int not null,
        primary key (idPfFornecedor, idPfProduto),
        constraint fk_produto_fornecedor_fornecedor foreign key(idPfFornecedor) references fornecedores(idFornecedor),
        constraint fk_produto_fornecedor_produto foreign key(idPfProduto) references produtos(idProduto)
);

desc produtoFornecedor;

show tables;

show databases;
use information_schema;
show tables;
desc table_constraints;

select * from referential_constraints 
	where constraint_schema = 'ecommerce_refinado';

