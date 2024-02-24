create database	exercicios;

use exercicios;

create table VENDEDOR(
idvendedor tinyint not null primary key,
nomevendedor varchar(70) not null,
idade tinyint not null,
salario double(10,2) not null
);

create table CLIENTE(
idcliente tinyint not null primary key,
nomecliente varchar(70) not null,
cidade varchar(200) not null,
tipo varchar(30) not null
);

create table PEDIDO(
id_pedido tinyint not null primary key,
idvendedor tinyint not null,
idcliente tinyint not null,
quantidade_itens tinyint,
valor_total double(10,2) not null,
foreign key (idvendedor) references VENDEDOR(idvendedor),
foreign key (idcliente) references CLIENTE(idcliente)
);

INSERT INTO VENDEDOR (idvendedor, nomevendedor, idade, salario) VALUES
(1, 'João', 30, 2500.00),
(2, 'Miguelita', 28, 2700.00),
(3, 'Carlos Santos', 35, 3000.00),
(4, 'Ana Oliveira', 32, 2800.00),
(5, 'Pedro Costa', 29, 2600.00);

UPDATE VENDEDOR SET nomevendedor = "João" WHERE idvendedor = 1;
UPDATE VENDEDOR SET salario = "10000" WHERE idvendedor = 1;
UPDATE VENDEDOR SET salario = "20000" WHERE idvendedor = 2;
UPDATE VENDEDOR SET salario = "18000" WHERE idvendedor = 3;

INSERT INTO CLIENTE (idcliente, nomecliente, cidade, tipo) VALUES
(1, 'TechNova Solutions', 'São Paulo', 'Corporativo'),
(2, 'GreenGrove Enterprises', 'Rio de Janeiro', 'Industria'),
(3, 'Skyline Innovations', 'Belo Horizonte', 'Corporativo'),
(4, 'AlphaOmega Industries', 'Porto Alegre', 'Industria'),
(5, 'Summit Global Services', 'Salvador', 'Corporativo');

UPDATE CLIENTE SET TIPO = "Industria" WHERE idcliente = 3;
UPDATE CLIENTE SET TIPO = "Industria" WHERE idcliente = 1;

INSERT INTO PEDIDO VALUES
(1, 1, 1, 3, 500),
(2, 2, 2, 15, 750),
(3, 3, 3, 3, 1000),
(4, 4, 4, 12, 600),
(5, 5, 5, 8, 400);

SELECT nomevendedor FROM VENDEDOR;

SELECT VENDEDOR.idvendedor FROM PEDIDO INNER JOIN VENDEDOR on PEDIDO.idcliente = VENDEDOR.idvendedor;

SELECT VENDEDOR.nomevendedor FROM VENDEDOR JOIN PEDIDO ON VENDEDOR.idvendedor = PEDIDO.idvendedor JOIN CLIENTE ON PEDIDO.idcliente = CLIENTE.idcliente WHERE CLIENTE.tipo = "Indústria";

SELECT CLIENTE.tipo FROM CLIENTE JOIN PEDIDO ON CLIENTE.idcliente = PEDIDO.idcliente JOIN VENDEDOR ON PEDIDO.idvendedor = VENDEDOR.idvendedor WHERE VENDEDOR.nomevendedor = "João";

SELECT CLIENTE.nomecliente, CLIENTE.tipo FROM CLIENTE JOIN PEDIDO on CLIENTE.idcliente = PEDIDO.idcliente WHERE PEDIDO.valor_total > 550;

SELECT DISTINCT CLIENTE.idcliente, CLIENTE.tipo FROM CLIENTE JOIN PEDIDO ON CLIENTE.idcliente = PEDIDO.idcliente WHERE CAST(replace(PEDIDO.valor_total, 'reais', '')AS DECIMAL) > 5000;








