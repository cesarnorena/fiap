CREATE TABLE vinho
(
    id            INT PRIMARY KEY UNIQUE,
    nome          VARCHAR  NOT NULL,
    ano_safra     DATETIME NOT NULL,
    classificacao VARCHAR  NOT NULL,
    tipo_uva      VARCHAR  NOT NULL,
    valor         INT      NOT NULL
);

CREATE TABLE cliente
(
    id        INT PRIMARY KEY UNIQUE,
    nome      VARCHAR NOT NULL,
    sobrenome VARCHAR NOT NULL,
    sexo      VARCHAR NOT NULL,
    cpf       VARCHAR NOT NULL UNIQUE,
    email     VARCHAR NOT NULL UNIQUE
);

CREATE TABLE item_venda
(
    id             INT PRIMARY KEY UNIQUE,
    quantidade     INT NOT NULL,
    id_nota_fiscal INT NOT NULL,
    id_vinho       INT NOT NULL,
    FOREIGN KEY (id_nota_fiscal) REFERENCES nota_fiscal (id),
    FOREIGN KEY (id_vinho) REFERENCES vinho (id)
);

CREATE TABLE nota_fiscal
(
    id         INT PRIMARY KEY UNIQUE,
    numero     VARCHAR  NOT NULL UNIQUE,
    data       DATETIME NOT NULL,
    id_cliente INT      NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente (id)
);
