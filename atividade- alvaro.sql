
-- QUESTÃO 1 E 2

create database sistema_bancario;

use sistema_bancario;

create table banco(
codigo varchar(50) not null,
nome varchar(50) not null,
primary key (codigo)
);

create table agencia(
cod_banco varchar(50) not null,
numero_agencia varchar(50) not null,
endereco char(50) not null,
primary key(numero_agencia),
foreign key(cod_banco) references banco(codigo)
);
create table cliente(
cpf varchar(50) not null,
nome varchar(50) not null,
sexo char(1) not null,
endereco char(50) not null,
primary key(cpf),
check (sexo in ('m', 'f'))
);
create table conta(
numero_conta varchar(50) not null,
saldo float not null,
tipo_conta varchar(50) not null,
num_agencia varchar(50) not null,
primary key(numero_conta),
foreign key(num_agencia) references agencia(numero_agencia)  
);
create table historico(
cpf_cliente varchar(50) not null,
num_conta varchar(50) not null,
data_inicio date,
primary key(data_inicio),
foreign key(cpf_cliente) references cliente(cpf),
foreign key(num_conta) references conta(numero_conta)
);
create table telefone_cliente(
cpf_cli varchar(50) not null,
telefone char(11),
primary key(telefone),
foreign key(cpf_cli) references cliente(cpf)
); 

/* 
		QUESTÃO 3
        
insert into banco(codigo, nome)
values(1, 'Banco do Brasil');

insert into banco(codigo, nome)
values(4, 'CEF')
*/
 
/*
insert into agencia(numero_agencia, endereco, cod_banco)
values(322,'Av.Walfredo Macedo Brandao,1139', 4)

insert into agencia(numero_agencia, endereco, cod_banco)
values(1253,'R.Bancário Sérgio Guerra,17', 1)
*/

/*
insert into cliente(cpf,nome,sexo,endereco)
values('111.222.333-44','Bruna Andrade','f','Rua José Firmino Ferreira,1050')

insert into cliente(cpf,nome,sexo,endereco)
values('666.777.888-99','Radegondes Silva','m','Av. Epitácio Pessoa,1008')

insert into cliente(cpf,nome,sexo,endereco)
values('555.444.777-33','Miguel Xavier','m','Rua Bancário Sérgio Guerra,640')
*/

/*
insert into conta(numero_conta,saldo,tipo_conta,num_agencia)
values('11765-2', 22745.05,'2','322')

insert into conta(numero_conta,saldo,tipo_conta,num_agencia)
values('21010-7',3100.96,'1','1253')
*/

/*
insert into historico(cpf_cliente,num_conta,data_inicio)
values('111.222.333-44','11765-2', '2015-12-22')

insert into historico(cpf_cliente,num_conta,data_inicio)
values('666.777.888-99','11765-2','2016-10-05')

insert into historico(cpf_cliente,num_conta,data_inicio)
values('555.444.777-33','21010-7', '2012-08-29')
*/

/*
insert into telefone_cliente(cpf_cli,telefone)
values('111.222.333-44','8332221234')

insert into telefone_cliente(cpf_cli,telefone)
values('666.777.888-99','83994439999')

insert into telefone_cliente(cpf_cli,telefone)
values('666.777.888-99','833233-2267')
*/

/* 		QUESTÃO 4
alter table cliente add column pais char(3) default 'bra';
		
        QUESTÃO 5
alter table cliente add column email char(20);
		
        QUESTÃO 6
SET foreign_key_checks = 0; 
delete from conta where numero_conta = '11765-2';
SET foreign_key_checks = 1;

		QUESTÃO 7
Set sql_safe_updates = 0;
SET foreign_key_checks = 0; 
update agencia
set numero_agencia =  6342
WHERE numero_agencia = '322';

SET foreign_key_checks = 1;

	   QUESTÃO 8
SET foreign_key_checks = 0; 
alter table conta modify numero_conta char(7);
SET foreign_key_checks = 1;

	   QUESTÃO 9
Set sql_safe_updates = 0;
update cliente
set nome = 'radegondes.silva@gmail.com'
WHERE nome = 'Radegondes Silva';

	   QUESTÃO 10
Set sql_safe_updates = 0;
update conta
set saldo = saldo*1.10
WHERE saldo = '3100.96'; 

		QUESTÃO 11
Set sql_safe_updates = 0;
update cliente
set nome =  'Bruna Fernandes'
WHERE nome =  'Bruna Andrade';

		QUESTÃO 12
Set sql_safe_updates = 0;
update conta
set tipo_conta = 3
WHERE (saldo > 2000) 
*/


