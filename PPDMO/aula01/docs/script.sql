    DROP DATABASE IF EXISTS restaurante;
    CREATE DATABASE restaurante;
    USE restaurante;

    CREATE TABLE cardapio(
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        item VARCHAR(50) NOT NULL,
        preco DECIMAL(5,2) NOT NULL,
        descricao VARCHAR(255) NOT NULL
    );
    CREATE TABLE motoboy(
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        nome varchar(50) NOT NULL,
        moto varchar(50) NOT NULL
    );

    CREATE TABLE cliente(
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(60) NOT NULL,
        telefone VARCHAR(15) ,
        endereco VARCHAR(100) 
    );

    CREATE TABLE pedido(
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        id_cliente INT NOT NULL,
        id_motoboy INT,
        hora_pedido TIME NOT NULL,
        hora_fim TIME,
        data DATE not null,
        status VARCHAR(10) NOT NULL,
        obs VARCHAR(255),
        FOREIGN KEY(id_cliente) REFERENCES cliente(id),
        FOREIGN KEY(id_motoboy) REFERENCES motoboy(id),
        total DECIMAL(6,2) NULL,
        entrega BOOLEAN
    );

    CREATE TABLE itens
    (
        id_pedido INT NOT NULL,
        id_cardapio INT NOT NULL,
        preco DECIMAL(6,2) NOT NULL,
        descricao TEXT NOT NULL,
        FOREIGN KEY (id_pedido) REFERENCES pedido(id),
        FOREIGN KEY (id_cardapio) REFERENCES cardapio(id)
    );

INSERT INTO motoboy VALUES
(DEFAULT, "Marquinho Ruindade Pura", "Meiota"),
(DEFAULT, "Clebinho Humildade Pura", "Ninja");

INSERT INTO cardapio VALUES
(DEFAULT,"Picanha ao alho", 18.00, "Arroz, Feijao, Picanha, Fritas e Repolho"),
(DEFAULT,"Feijoada", 15.00, "Arroz, Feijao preto, Fritas, Farofa e Couve"),
(DEFAULT,"Frango á Milanesa", 15.00, "Arroz, Frango Empanado, Fritas  e Couve"),
(DEFAULT,"Suco de maracujá", 5.00, "Delicioso suco de maracujá"),
(DEFAULT,"Suco de uva", 5.00, "Delicioso suco de uva"),
(DEFAULT,"Suco de limão", 5.00, "Deliciosa limonada");

INSERT INTO cliente VALUES
(DEFAULT, "Jair Messias", "1928259123", "Planalto, 22"),
(DEFAULT, "Luis Inacio", "1912351251", "Triplex, 13"),
(DEFAULT, "Jacinto Dores", NULL, NULL),
(DEFAULT, "Aquino Dente", NULL, NULL);


INSERT INTO pedido VALUES
(DEFAULT, 1, 1, "9:00", NULL,CURDATE(),"Em preparo", "Sem picles", "", 1),
(DEFAULT, 3, NULL, "10:00","11:00",CURDATE(),"Pronto", NULL, "", 0),
(DEFAULT, 4, NULL, "11:00", NULL,CURDATE(),"Em preparo", "Sem picles", "", 0),
(DEFAULT, 2, 1, "12:00","12:15",CURDATE(),"Pronto", NULL, "", 1);

INSERT INTO itens VALUES
(1, 1, 10, ""),
(2, 2, 10, ""),
(2, 3, 10, ""),
(3, 3, 10, ""),
(4, 4, 10, "");