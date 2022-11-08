-- criação do banco de dados para o cenário de E-commerce
create database if not exists oficina_os;
use oficina_os;

-- drop database oficina_os;

-- cria tabela pessoa_física

create table pessoa_física(
		idPessoa int auto_increment primary key,
        Fname varchar(20) not null,
        Minit char(3),
        Lname varchar(20) not null,
        CPF char(11) not null,
        endereço varchar(255) not null,
        contato char(11) not null,
        constraint unique_cpf_pessoa unique(CPF)
);

alter table pessoa_física auto_increment=1;

-- cria tabela clientes

create table clientes(
		idCliente int auto_increment primary key,
        idCPessoa int,
        constraint fk_pessoa_cliente foreign key(idCPessoa) references pessoa_física(idPessoa)
);

-- cria tabela mecânicos
create table mecanicos(
        idMecanico int auto_increment primary key,
        idMPessoa int,
        especialidade varchar(25) not null,
        códigoId char(12) not null,
        constraint fk_pessoa_mecanico foreign key(idMPessoa) references pessoa_física(idPessoa)
);

-- cria tabela da equipe responsável 

create table equipeOS(
		idEquipe int auto_increment primary key,
        códEquipe char(3) not null
);

-- cria tabela veículo
create table veiculo(
		idVeiculo int auto_increment primary key,
        idVCliente int,
        placa char(7) not null,
        modelo varchar(15),
        fabricante varchar(20),
        ano year,
        idEquipeV int,
        constraint fk_cliente_veiculo foreign key(idVCliente) references clientes(idCliente),
        constraint fk_equipe_veiculo foreign key(idEquipeV) references equipeOS(idEquipe)
);

-- cria tabela relacionamento mecânico e equipe

create table mecanicoEquipe(
		idME_Mecanico int,
        idME_Equipe int,
        primary key (idME_Mecanico, idME_Equipe),
        constraint fk_mec_equipe_mecanico foreign key(idME_Mecanico) references mecanicos(idMecanico),
        constraint fk_mec_equipe_equipe foreign key(idME_Equipe) references equipeOS(idEquipe)
);

-- cria tabela pedido
create table ordemServiço(
		idOS int auto_increment primary key,
        idEquipeResp int,
        numOS char(12),
        statusOS enum('Cancelado','Confirmado','Em processamento','Atrasada') default 'Em processamento',
        dataEmissao date,
        previsaoConclusao date,
        constraint fk_equipe_os foreign key (idEquipeResp) references clientes(idCliente),
        constraint unique_numOS unique(numOS)
);

-- cria tabela peças

create table peças(
		idPeças int auto_increment primary key,
        nomeP varchar(30) not null,
        fabricante varchar(20) not null,
        precoUnit float not null  
);

-- cria tabela custo serviço

create table custoServiço(
		idCustoServ int auto_increment primary key,
        descrServ varchar(30) not null,
        valorServ float not null
);

-- cria tabela de relacionamento OS e peças
create table peçasOS(
		idPOS_Peça int,
        idPOS_OS int,
        quantidade int default 1,
        primary key (idPOS_Peça, idPOS_OS),
        constraint fk_peças_os_peças foreign key(idPOS_Peça) references peças(idPeças),
        constraint fk_peças_os_os foreign key(idPOS_OS) references ordemServiço(idOS)
);

-- cria tabela de relacionamento OS e custo de serviço

create table custoServOS(
		idCSOS_Custo int,
        idCSOS_OS int,
        primary key (idCSOS_Custo, idCSOS_OS),
        constraint fk_csos_custo foreign key(idCSOS_Custo) references custoServiço(idCustoServ),
        constraint fk_csos_ordem foreign key(idCSOS_OS) references ordemServiço(idOS)
);


desc custoServOS;

show tables;

show databases;
use information_schema;
show tables;
desc table_constraints;

select * from referential_constraints 
	where constraint_schema = 'oficina_os';

use oficina_os;
desc peçasOS;
desc equipeOS;