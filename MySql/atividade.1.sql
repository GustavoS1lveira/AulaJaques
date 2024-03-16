CREATE DATABASE Exercicio_1;

use Exercicio_1;

CREATE TABLE Vendedor (
    idvendedor int NOT NULL,
    nomevendedor varchar(255) NOT NULL,
    idade int NOT NULL,
    salario int,
    PRIMARY KEY (idvendedor)
);

CREATE TABLE Cliente (
    idcliente int NOT NULL,
    nomecliente varchar(200) NOT NULL,
    cidade varchar(255) NOT NULL,
    tipo varchar(100),
    PRIMARY KEY (idcliente)
);

CREATE TABLE Pedido (
    id_pedido int NOT NULL,
    idvendedor int NOT NULL,
    idcliente int NOT NULL,
    quantidade_itens int NOT NULL,
    valor_total int NOT NULL,
    FOREIGN KEY (idvendedor) REFERENCES Vendedor (idvendedor),
    FOREIGN KEY (idcliente) REFERENCES Cliente (idcliente),
    PRIMARY KEY (id_pedido)
);

INSERT INTO Vendedor (idvendedor, nomevendedor, idade, salario) VALUES
(1, 'João', 30, 3000),
(2, 'Cleide', 35, 3500),
(3, 'Bataiolli', 28, 2800),
(4, 'Dembele', 40, 4000),
(5, 'Vitor', 50, 4100);

INSERT INTO Cliente (idcliente, nomecliente, cidade, tipo) VALUES
(1, 'Cliente Forte', 'São Paulo', 'Varejo'),
(2, 'Cliente Fraco', 'Rio de Janeiro', 'Atacado'),
(3, 'Cliente Medio', 'Belo Horizonte', 'Varejo'),
(4, 'Cliente Feliz', 'Porto Alegre', 'Atacado'),
(5, 'Cliente Jaques', 'São Leopoldo', 'INDUSTRIA');

INSERT INTO Pedido (id_pedido, idvendedor, idcliente, quantidade_itens, valor_total) VALUES
(1, 1, 1, 10, 500),
(2, 2, 2, 20, 1000),
(3, 3, 3, 15, 750),
(4, 4, 4, 25, 1250),
(5, 5, 5, 35, 1470);

SELECT nomevendedor FROM VENDEDOR;

SELECT DISTINCT idvendedor FROM PEDIDO;

SELECT idvendedor FROM VENDEDOR WHERE idvendedor NOT IN (SELECT DISTINCT idvendedor FROM PEDIDO);

SELECT DISTINCT V.nomevendedor 
FROM VENDEDOR V 
JOIN PEDIDO P ON V.idvendedor = P.idvendedor 
JOIN CLIENTE C ON P.idcliente = C.idcliente 
WHERE C.tipo = 'INDUSTRIA';

SELECT DISTINCT C.tipo 
FROM VENDEDOR V 
JOIN PEDIDO P ON V.idvendedor = P.idvendedor 
JOIN CLIENTE C ON P.idcliente = C.idcliente 
WHERE V.nomevendedor = 'JOÃO';


SELECT DISTINCT C.nomecliente, C.tipo 
FROM CLIENTE C 
JOIN PEDIDO P ON C.idcliente = P.idcliente 
WHERE P.valor_total > 5000;