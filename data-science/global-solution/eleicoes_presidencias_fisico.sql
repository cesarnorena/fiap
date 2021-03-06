SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS eleitor;
DROP TABLE IF EXISTS candidato;
DROP TABLE IF EXISTS partido;
DROP TABLE IF EXISTS voto;
DROP TABLE IF EXISTS pessoa;
DROP TABLE IF EXISTS coligacao_partido;
DROP TABLE IF EXISTS coligacao;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE eleitor
(
    id            INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_pessoa     INTEGER,
    local_votacao TINYTEXT,
    zona_votacao  INT,
    cidade        TINYTEXT,
    estado        VARCHAR(2)
);

CREATE TABLE candidato
(
    id         INTEGER PRIMARY KEY AUTO_INCREMENT,
    no_votacao VARCHAR(4),
    id_partido INTEGER,
    id_pessoa  INTEGER
);

CREATE TABLE partido
(
    id        INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome      TINYTEXT,
    sigla     TINYTEXT,
    legenda   INT,
    descricao TEXT
);

CREATE TABLE voto
(
    id           INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_eleitor   INTEGER,
    id_candidato INTEGER
);

CREATE TABLE pessoa
(
    id        INTEGER PRIMARY KEY AUTO_INCREMENT AUTO_INCREMENT,
    cpf       VARCHAR(11),
    nome      TINYTEXT,
    sobrenome TINYTEXT,
    sexo      ENUM ('masculino', 'femenino', 'outro'),
    endereco  TEXT
);

CREATE TABLE coligacao_partido
(
    id           INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_partido   INTEGER,
    id_coligacao INTEGER
);

CREATE TABLE coligacao
(
    id   INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome TINYTEXT
);

ALTER TABLE eleitor
    ADD CONSTRAINT FK_eleitor_2
        FOREIGN KEY (id_pessoa)
            REFERENCES pessoa (id);

ALTER TABLE candidato
    ADD CONSTRAINT FK_candidato_2
        FOREIGN KEY (id_partido)
            REFERENCES partido (id)
            ON DELETE RESTRICT;

ALTER TABLE candidato
    ADD CONSTRAINT FK_candidato_3
        FOREIGN KEY (id_pessoa)
            REFERENCES pessoa (id)
            ON DELETE CASCADE;

ALTER TABLE voto
    ADD CONSTRAINT FK_voto_2
        FOREIGN KEY (id_eleitor)
            REFERENCES eleitor (id)
            ON DELETE CASCADE;

ALTER TABLE voto
    ADD CONSTRAINT FK_voto_3
        FOREIGN KEY (id_candidato)
            REFERENCES candidato (id)
            ON DELETE CASCADE;

ALTER TABLE coligacao_partido
    ADD CONSTRAINT FK_coligacao_partido_1
        FOREIGN KEY (id_partido)
            REFERENCES partido (id)
            ON DELETE RESTRICT;

ALTER TABLE coligacao_partido
    ADD CONSTRAINT FK_coligacao_partido_4
        FOREIGN KEY (id_coligacao)
            REFERENCES partido (id);

SHOW TABLES;

INSERT INTO pessoa (cpf, nome, sobrenome, sexo, endereco)
VALUES ('12345678903', 'Pedro', 'Silva', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678902', 'Maria', 'Silva', 'femenino', 'Rua dos Pinheiros, 181'),
       ('12345678901', 'Jo??o', 'Silva', 'masculino', 'Rua da Paz, 123'),
       ('12345678904', 'Ana', 'Silva', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678905', 'Jo??o', 'Souza', 'masculino', 'Rua da Paz, 123'),
       ('12345678906', 'Maria', 'Souza', 'outro', 'Rua dos Pinheiros, 181'),
       ('12345678907', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678908', 'Ana', 'Souza', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678909', 'Jo??o', 'Silva', 'masculino', 'Avenida Rebou??as, 1002'),
       ('12345678910', 'Carolina', 'Silva', 'femenino', 'Rua da Paz, 123'),
       ('12345678911', 'Pedro', 'Silva', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678912', 'Ana', 'Silva', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678913', 'Jo??o', 'Souza', 'outro', 'Faria Lima, 343'),
       ('12345678914', 'Maria', 'Souza', 'femenino', 'Rua dos Pinheiros, 181'),
       ('12345678915', 'Felipe', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678916', 'Ana', 'Souza', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678917', 'Jo??o', 'Silva', 'masculino', 'Avenida Rebou??as, 1002'),
       ('12345678918', 'Maria', 'Silva', 'femenino', 'Rua da Paz, 123'),
       ('12345678919', 'Pedro', 'Silva', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678920', 'Ana', 'Silva', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678921', 'Jo??o', 'Souza', 'masculino', 'Rua da Paz, 123'),
       ('12345678922', 'Maria', 'Souza', 'femenino', 'Rua dos Pinheiros, 181'),
       ('12345678923', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678924', 'Ana', 'Souza', 'outro', 'Avenida Paulista, 1239'),
       ('12345678925', 'Jo??o', 'Silva', 'outro', 'Avenida Rebou??as, 302'),
       ('12345678926', 'Maria', 'Silva', 'femenino', 'Rua da Paz, 123'),
       ('12345678927', 'Pedro', 'Silva', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678928', 'Ana', 'Silva', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678929', 'Jo??o', 'Souza', 'masculino', 'Rua da Paz, 123'),
       ('12345678930', 'Maria', 'Souza', 'femenino', 'Rua dos Pinheiros, 181'),
       ('12345678931', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678932', 'Ana', 'Souza', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678933', 'Jo??o', 'Silva', 'masculino', 'Avenida Rebou??as, 1002'),
       ('12345678934', 'Carolina', 'Silva', 'femenino', 'Rua da Paz, 123'),
       ('12345678935', 'Pedro', 'Silva', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678936', 'Ana', 'Silva', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678937', 'Jo??o', 'Souza', 'masculino', 'Rua da Paz, 123'),
       ('12345678938', 'Maria', 'Souza', 'femenino', 'Rua dos Pinheiros, 181'),
       ('12345678939', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678940', 'Ana', 'Souza', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678941', 'Jo??o', 'Silva', 'masculino', 'Avenida Rebou??as, 1002'),
       ('12345678942', 'Maria', 'Silva', 'femenino', 'Rua da Paz, 123'),
       ('12345678943', 'Pedro', 'Silva', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678944', 'Ana', 'Silva', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678945', 'Jo??o', 'Souza', 'masculino', 'Rua da Paz, 123'),
       ('12345678946', 'Maria', 'Souza', 'femenino', 'Rua dos Pinheiros, 181'),
       ('12345678947', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678948', 'Ana', 'Souza', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678949', 'Jo??o', 'Silva', 'masculino', 'Avenida Rebou??as, 1002'),
       ('12345678950', 'Carolina', 'Silva', 'femenino', 'Rua da Paz, 123'),
       ('12345678951', 'Pedro', 'Silva', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678952', 'Ana', 'Silva', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678953', 'Jo??o', 'Souza', 'masculino', 'Rua da Paz, 123'),
       ('12345678954', 'Maria', 'Souza', 'femenino', 'Rua dos Pinheiros, 181'),
       ('12345678955', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678956', 'Ana', 'Souza', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678957', 'Jo??o', 'Silva', 'masculino', 'Avenida Rebou??as, 1002'),
       ('12345678958', 'Maria', 'Silva', 'femenino', 'Rua da Paz, 123'),
       ('12345678959', 'Pedro', 'Silva', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678960', 'Ana', 'Silva', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678961', 'Jo??o', 'Souza', 'masculino', 'Rua da Paz, 123'),
       ('12345678962', 'Maria', 'Souza', 'femenino', 'Rua dos Pinheiros, 181'),
       ('12345678963', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678964', 'Ana', 'Souza', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678965', 'Jo??o', 'Silva', 'masculino', 'Avenida Rebou??as, 1002'),
       ('12345678966', 'Carolina', 'Silva', 'femenino', 'Rua da Paz, 123'),
       ('12345678967', 'Pedro', 'Silva', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678968', 'Ana', 'Silva', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678969', 'Jo??o', 'Souza', 'masculino', 'Rua da Paz, 123'),
       ('12345678970', 'Maria', 'Souza', 'femenino', 'Rua dos Pinheiros, 181'),
       ('12345678971', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678972', 'Ana', 'Souza', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678973', 'Jo??o', 'Silva', 'masculino', 'Avenida Rebou??as, 1002'),
       ('12345678974', 'Carolina', 'Silva', 'femenino', 'Rua da Paz, 123'),
       ('12345678975', 'Pedro', 'Silva', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678976', 'Ana', 'Silva', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678977', 'Jo??o', 'Souza', 'masculino', 'Rua da Paz, 123'),
       ('12345678978', 'Maria', 'Souza', 'femenino', 'Rua dos Pinheiros, 181'),
       ('12345678979', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678980', 'Ana', 'Souza', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678981', 'Jo??o', 'Silva', 'masculino', 'Avenida Rebou??as, 1002'),
       ('12345678982', 'Carolina', 'Silva', 'femenino', 'Rua da Paz, 123'),
       ('12345678983', 'Pedro', 'Silva', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678984', 'Ana', 'Silva', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678985', 'Jo??o', 'Souza', 'masculino', 'Rua da Paz, 123'),
       ('12345678986', 'Maria', 'Souza', 'femenino', 'Rua dos Pinheiros, 181'),
       ('12345678987', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678988', 'Ana', 'Souza', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678989', 'Jo??o', 'Silva', 'masculino', 'Avenida Rebou??as, 1002'),
       ('12345678990', 'Carolina', 'Silva', 'femenino', 'Rua da Paz, 123'),
       ('12345678991', 'Pedro', 'Silva', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678992', 'Ana', 'Silva', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678993', 'Jo??o', 'Souza', 'masculino', 'Rua da Paz, 123'),
       ('12345678994', 'Maria', 'Souza', 'femenino', 'Rua dos Pinheiros, 181'),
       ('12345678995', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678996', 'Ana', 'Souza', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678997', 'Jo??o', 'Silva', 'masculino', 'Avenida Rebou??as, 1002'),
       ('12345678998', 'Carolina', 'Silva', 'femenino', 'Rua da Paz, 123'),
       ('12345678999', 'Pedro', 'Silva', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678990', 'Ana', 'Silva', 'femenino', 'Avenida Paulista, 1239');

SELECT COUNT(id) as pessoa_count
FROM pessoa;

INSERT INTO partido (nome, sigla, legenda, descricao)
VALUES ('Partido da Cidadania', 'PC', 12, 'Partido da Cidadania'),
       ('Movimento Democr??tico Brasileiro', 'DMB', 15, 'Movimento Democr??tico Brasileiro'),
       ('Partido do Movimento Socialista', 'PMDB', 25, 'Partido do Movimento Socialista'),
       ('Partido da Social Democracia Brasileira', 'SDB', 35, 'Partido da Social Democracia Brasileira'),
       ('Partido da Solidariedade', 'PSD', 45, 'Partido da Solidariedade'),
       ('Partido Comunista do Brasil', 'PCB', 55, 'Partido Comunista do Brasil'),
       ('Partido da Ordem Socialista', 'PSOL', 65, 'Partido da Ordem Socialista'),
       ('Partido da Rede Social Democrata', 'PRD', 75, 'Partido da Rede Social Democrata'),
       ('Partido da Rep??blica Democr??tica', 'PRB', 85, 'Partido da Rep??blica Democr??tica'),
       ('Partido da Mobiliza????o Trabalhista Brasileira', 'PMB', 95, 'Partido da Mobiliza????o Trabalhista Brasileira'),
       ('Partido da Proposta', 'PP', 105, 'Partido da Proposta'),
       ('Partido Democr??tico Brasileiro', 'PT', 115, 'Partido Democr??tico Brasileiro'),
       ('Partido Socialista Brasileiro', 'PSB', 125, 'Partido Socialista Brasileiro'),
       ('Partido Verde', 'PV', 135, 'Partido Verde'),
       ('Partido da Terra', 'PTC', 145, 'Partido da Terra'),
       ('Partido da Cultura', 'PCdoB', 155, 'Partido da Cultura'),
       ('Partido da Mulher', 'PMDB', 165, 'Partido da Mulher'),
       ('Partido da Justi??a', 'PJ', 175, 'Partido da Justi??a'),
       ('Partido da Fam??lia', 'PFL', 185, 'Partido da Fam??lia'),
       ('Partido da Cidadania', 'PC', 195, 'Partido da Cidadania'),
       ('Partido da Justi??a e A????o Social', 'PJAS', 205, 'Partido da Justi??a e A????o Social'),
       ('Partido da Liberdade', 'PLB', 215, 'Partido da Liberdade'),
       ('Partido da Ordem', 'POD', 225, 'Partido da Ordem'),
       ('Partido Popular', 'PP', 235, 'Partido Popular'),
       ('Partido Progressista', 'PPS', 245, 'Partido Progressista');

SELECT count(id) AS partido_count
FROM partido;

INSERT INTO candidato (no_votacao, id_partido, id_pessoa)
VALUES ('1234', 1, 1),
       ('1235', 1, 2),
       ('1236', 2, 3),
       ('1237', 2, 4),
       ('1238', 2, 5),
       ('1239', 3, 6),
       ('1240', 3, 7),
       ('1241', 3, 8),
       ('1242', 3, 9),
       ('1243', 4, 10),
       ('1244', 4, 11),
       ('1245', 4, 12),
       ('1246', 5, 13),
       ('1247', 5, 14),
       ('1248', 5, 15),
       ('1249', 6, 16),
       ('1250', 6, 17),
       ('1251', 6, 18),
       ('1252', 7, 19),
       ('1253', 7, 20),
       ('1254', 7, 21),
       ('1255', 8, 22),
       ('1256', 8, 23),
       ('1257', 8, 24),
       ('1258', 9, 25),
       ('1259', 9, 26),
       ('1260', 9, 27),
       ('1261', 10, 28),
       ('1262', 10, 29),
       ('1263', 10, 30);

SELECT count(id) AS candidato_count
FROM candidato;

INSERT INTO eleitor (id_pessoa, local_votacao, zona_votacao, cidade, estado)
VALUES (13, 'Rua da Paz, 125', 4, 'Sao Paulo', 'SP'),
       (14, 'Rua da Paz, 126', 5, 'Rio de Janeiro', 'RJ'),
       (15, 'Rua da Paz, 127', 6, 'Rio de Janeiro', 'RJ'),
       (16, 'Rua da Paz, 128', 7, 'Salvador', 'BA'),
       (17, 'Rua da Paz, 129', 8, 'Fortaleza', 'CE'),
       (18, 'Rua da Paz, 130', 9, 'Manaus', 'AM'),
       (19, 'Rua da Paz, 131', 10, 'Curitiba', 'PR'),
       (20, 'Rua da Paz, 132', 11, 'Recife', 'PE'),
       (21, 'Rua da Paz, 133', 12, 'Porto Alegre', 'RS'),
       (22, 'Rua da Paz, 134', 13, 'Belo Horizonte', 'MG'),
       (23, 'Rua da Paz, 135', 14, 'Sao Paulo', 'SP'),
       (24, 'Rua da Paz, 136', 15, 'Rio de Janeiro', 'RJ'),
       (25, 'Rua da Paz, 137', 16, 'Belo Horizonte', 'MG'),
       (26, 'Rua da Paz, 138', 17, 'Salvador', 'BA'),
       (27, 'Rua da Paz, 139', 18, 'Fortaleza', 'CE'),
       (28, 'Rua da Paz, 140', 19, 'Manaus', 'AM'),
       (29, 'Rua da Paz, 141', 20, 'Curitiba', 'PR'),
       (30, 'Rua da Paz, 142', 21, 'Recife', 'PE'),
       (31, 'Rua da Paz, 143', 22, 'Porto Alegre', 'RS'),
       (32, 'Rua da Paz, 144', 23, 'Belo Horizonte', 'MG'),
       (33, 'Rua da Paz, 145', 24, 'Sao Paulo', 'SP'),
       (34, 'Rua da Paz, 146', 25, 'Rio de Janeiro', 'RJ'),
       (35, 'Rua da Paz, 147', 26, 'Belo Horizonte', 'MG'),
       (36, 'Rua da Paz, 148', 27, 'Salvador', 'BA'),
       (37, 'Rua da Paz, 149', 28, 'Fortaleza', 'CE'),
       (38, 'Rua da Paz, 150', 29, 'Manaus', 'AM'),
       (39, 'Rua da Paz, 151', 30, 'Curitiba', 'PR'),
       (40, 'Rua da Paz, 152', 31, 'Recife', 'PE'),
       (41, 'Rua da Paz, 153', 32, 'Porto Alegre', 'RS'),
       (42, 'Rua da Paz, 154', 33, 'Belo Horizonte', 'MG'),
       (43, 'Rua da Paz, 155', 34, 'Sao Paulo', 'SP'),
       (44, 'Rua da Paz, 156', 35, 'Rio de Janeiro', 'RJ'),
       (45, 'Rua da Paz, 157', 36, 'Belo Horizonte', 'MG'),
       (46, 'Rua da Paz, 158', 37, 'Salvador', 'BA'),
       (47, 'Rua da Paz, 159', 38, 'Fortaleza', 'CE'),
       (48, 'Rua da Paz, 160', 39, 'Manaus', 'AM'),
       (49, 'Rua da Paz, 161', 40, 'Curitiba', 'PR'),
       (50, 'Rua da Paz, 162', 41, 'Recife', 'PE'),
       (51, 'Rua da Paz, 163', 42, 'Porto Alegre', 'RS'),
       (52, 'Rua da Paz, 164', 43, 'Belo Horizonte', 'MG'),
       (53, 'Rua da Paz, 165', 44, 'Sao Paulo', 'SP'),
       (54, 'Rua da Paz, 166', 45, 'Rio de Janeiro', 'RJ'),
       (55, 'Rua da Paz, 167', 46, 'Belo Horizonte', 'MG'),
       (56, 'Rua da Paz, 168', 47, 'Salvador', 'BA'),
       (57, 'Rua da Paz, 169', 48, 'Fortaleza', 'CE'),
       (58, 'Rua da Paz, 170', 49, 'Manaus', 'AM'),
       (59, 'Rua da Paz, 171', 50, 'Curitiba', 'PR'),
       (60, 'Rua da Paz, 172', 51, 'Recife', 'PE'),
       (61, 'Rua da Paz, 173', 52, 'Porto Alegre', 'RS'),
       (62, 'Rua da Paz, 174', 53, 'Belo Horizonte', 'MG'),
       (63, 'Rua da Paz, 175', 54, 'Sao Paulo', 'SP'),
       (64, 'Rua da Paz, 176', 55, 'Rio de Janeiro', 'RJ'),
       (65, 'Rua da Paz, 177', 56, 'Belo Horizonte', 'MG'),
       (66, 'Rua da Paz, 178', 57, 'Salvador', 'BA'),
       (67, 'Rua da Paz, 179', 58, 'Fortaleza', 'CE'),
       (68, 'Rua da Paz, 180', 59, 'Manaus', 'AM'),
       (69, 'Rua da Paz, 181', 60, 'Curitiba', 'PR'),
       (70, 'Rua da Paz, 182', 61, 'Recife', 'PE'),
       (71, 'Rua da Paz, 183', 62, 'Porto Alegre', 'RS'),
       (72, 'Rua da Paz, 184', 63, 'Belo Horizonte', 'MG');

SELECT count(id) AS eleitor_count
FROM eleitor;

INSERT INTO coligacao (nome)
VALUES ('Coliga????o 1'),
       ('Coliga????o 2'),
       ('Coliga????o 3'),
       ('Coliga????o 4'),
       ('Coliga????o 5'),
       ('Coliga????o 6'),
       ('Coliga????o 7'),
       ('Coliga????o 8'),
       ('Coliga????o 9');

SELECT COUNT(id) AS coligacao_count
FROM coligacao;

INSERT INTO coligacao_partido (id_coligacao, id_partido)
VALUES (1, 1),
       (2, 2),
       (2, 3),
       (3, 4),
       (3, 5),
       (3, 6),
       (4, 7),
       (4, 8),
       (4, 9),
       (4, 10),
       (5, 11),
       (5, 12),
       (5, 13),
       (5, 14),
       (5, 15),
       (6, 16),
       (6, 17),
       (6, 18),
       (6, 19),
       (6, 20),
       (6, 21),
       (7, 22),
       (7, 23),
       (7, 24),
       (7, 25);

SELECT COUNT(DISTINCT id_coligacao) numero_coligacoes
FROM coligacao_partido;

INSERT INTO voto (id_candidato, id_eleitor)
VALUES (1, 1),
       (2, 2),
       (2, 3),
       (3, 4),
       (3, 5),
       (3, 6),
       (4, 7),
       (4, 8),
       (4, 9),
       (4, 10),
       (5, 11),
       (5, 12),
       (5, 13),
       (5, 14),
       (5, 15),
       (6, 16),
       (6, 17),
       (6, 18),
       (6, 19),
       (6, 20),
       (6, 21),
       (7, 22),
       (7, 23),
       (7, 24),
       (7, 25),
       (8, 26),
       (8, 27),
       (8, 28),
       (8, 29),
       (8, 30),
       (9, 31),
       (9, 32),
       (9, 33),
       (9, 34),
       (9, 35),
       (9, 36),
       (9, 37),
       (9, 38),
       (9, 39),
       (9, 40),
       (9, 41),
       (9, 42),
       (9, 43),
       (9, 44),
       (9, 45),
       (9, 46),
       (9, 47),
       (9, 48),
       (9, 49),
       (9, 50),
       (9, 51),
       (9, 52),
       (9, 53),
       (9, 54),
       (9, 55),
       (9, 56),
       (9, 57),
       (9, 58),
       (9, 59),
       (9, 60);

SELECT b.id_partido as id_partido_na_coligacao
FROM (SELECT id_coligacao FROM coligacao_partido WHERE id_partido = 1) AS a
         JOIN coligacao_partido b ON a.id_coligacao = b.id_coligacao;

SELECT id_coligacao, GROUP_CONCAT(id_partido) AS id_partidos, GROUP_CONCAT(partido.sigla) AS sigla_partidos
FROM coligacao_partido
      p   INNER JOIN partido ON coligacao_partido.id_partido = partido.id
GROUP BY id_coligacao;

SELECT id_partido, GROUP_CONCAT(id) AS id_candidatos
FROM candidato
GROUP BY id_partido;

SELECT partido.sigla        AS sigla_partido,
       partido.legenda      AS legenda_partido,
       pessoa.nome          AS nome_candidato,
       pessoa.sobrenome     AS sobrenome_candidato,
       candidato.no_votacao AS numero_votacao_candidato
FROM partido
         INNER JOIN candidato ON candidato.id_partido = partido.id
         INNER JOIN pessoa ON pessoa.id = candidato.id_pessoa;

SELECT CONCAT(pessoa.nome, ' ', pessoa.sobrenome) AS candidato, SUM(voto.id_candidato) AS votos
FROM voto
         INNER JOIN candidato ON voto.id_candidato = candidato.id
         INNER JOIN pessoa ON candidato.id_pessoa = pessoa.id
GROUP BY id_candidato
ORDER BY votos DESC;

SELECT partido.sigla as sigla, COUNT(voto.id) AS votos, eleitor.cidade
FROM voto
         INNER JOIN eleitor ON voto.id_eleitor = eleitor.id
         INNER JOIN candidato ON voto.id_candidato = candidato.id
         INNER JOIN partido ON candidato.id_partido = partido.id
GROUP BY sigla, eleitor.cidade
ORDER BY sigla, votos DESC;
