DROP DATABASE IF EXISTS restaurante;
CREATE DATABASE restaurante;
USE restaurante;

CREATE TABLE cardapio(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    item VARCHAR
(20) NOT NULL,
    preco DECIMAL
(5,2) NOT NULL,
    descricao VARCHAR
(255) NOT NULL
);

CREATE TABLE cliente(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR
(60) NOT NULL,
    telefone VARCHAR
(15) NOT NULL,
    endereco VARCHAR
(100) NOT NULL
);

CREATE TABLE pedido(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    hora TIME NOT NULL,
    data DATE not null,
    status VARCHAR
(10) NOT NULL,
    obs VARCHAR
(255) NOT NULL,
    FOREIGN KEY
(id_cliente) REFERENCES cliente
(id) 
);

CREATE TABLE itens
(
    id_pedido INT NOT NULL,
    id_cardapio INT NOT NULL,
    total DECIMAL(6,2) NOT NULL,
    descricao TEXT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id)
    FOREIGN KEY
    (id_cardapio) REFERENCES cardapio
    (id)
);