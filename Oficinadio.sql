create database oficina;
use oficina;

create table client(
		idClient int auto_increment primary key,
        Fname varchar(15) not null,
        Minit char(3),
        Lname varchar(20),
        CPF char(11) not null,
        Address varchar(30),
        constraint unique_cpf_client unique (CPF)
);

alter table client auto_increment=1;


create table mecanico(
		idMecanico int auto_increment primary key,
        Mname varchar(255) not null,
		especializacão varchar(15),
        CNPJ char(15),
        CPF char (9),
		Address varchar(30),
        contact char(11) not null,
        constraint unique_cnpj_seller unique (CNPJ),
        constraint unique_cpf_seller unique (CPF)
);

create table product(
		idProduct int auto_increment primary key,
        Pname varchar(15) not null,
        category enum('Eletrônica', 'Rodas', 'Motor', 'Vidros','Cadeiras', 'Volante') not null,
        evaluation float default 0,
        size varchar(10)
);

create table payments(
		idClient int,
        idPayment int,
        typePayment enum('Boleto','Cartão','Dois cartões'),
        limitAvailable float
);

create table service(
		idService int auto_increment primary key,
        idServiceClient int,
        serviceStatus enum('Cancelado','Confirmado','Em processamento') default 'Em Processamento',
        serviceDescription varchar(255),
        sendValue float default 10,
        paymentCash bool default false, 
        constraint fk_service_client foreign key (idServiceClient) references client(idClient) 
);

create table productStorage(
		idProdStorage int auto_increment primary key,
        storageLocation varchar(255),
        quantity int default 0
);

create table oficinaLocation(
		idLproduct int,
        idLstorage int,
        location varchar(255) not null,
        primary key (idLproduct, idLstorage),
		constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
        constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);
