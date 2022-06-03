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
    local_votacao TEXT,
    zona_votacao  TEXT
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
       ('12345678901', 'João', 'Silva', 'masculino', 'Rua da Paz, 123'),
       ('12345678904', 'Ana', 'Silva', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678905', 'João', 'Souza', 'masculino', 'Rua da Paz, 123'),
       ('12345678906', 'Maria', 'Souza', 'femenino', 'Rua dos Pinheiros, 181'),
       ('12345678907', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678908', 'Ana', 'Souza', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678909', 'João', 'Silva', 'masculino', 'Avenida Rebouças, 1002'),
       ('12345678910', 'Carolina', 'Silva', 'femenino', 'Rua da Paz, 123'),
       ('12345678911', 'Pedro', 'Silva', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678912', 'Ana', 'Silva', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678913', 'João', 'Souza', 'masculino', 'Rua da Paz, 123'),
       ('12345678914', 'Maria', 'Souza', 'femenino', 'Rua dos Pinheiros, 181'),
       ('12345678915', 'Felipe', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678916', 'Ana', 'Souza', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678917', 'João', 'Silva', 'masculino', 'Avenida Rebouças, 1002'),
       ('12345678918', 'Maria', 'Silva', 'femenino', 'Rua da Paz, 123'),
       ('12345678919', 'Pedro', 'Silva', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678920', 'Ana', 'Silva', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678921', 'João', 'Souza', 'masculino', 'Rua da Paz, 123'),
       ('12345678922', 'Maria', 'Souza', 'femenino', 'Rua dos Pinheiros, 181'),
       ('12345678923', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678924', 'Ana', 'Souza', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678925', 'João', 'Silva', 'outro', 'Avenida Rebouças, 302'),
       ('12345678926', 'Maria', 'Silva', 'femenino', 'Rua da Paz, 123'),
       ('12345678927', 'Pedro', 'Silva', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678928', 'Ana', 'Silva', 'femenino', 'Avenida Paulista, 1239'),
       ('12345678929', 'João', 'Souza', 'masculino', 'Rua da Paz, 123'),
       ('12345678930', 'Maria', 'Souza', 'femenino', 'Rua dos Pinheiros, 181'),
       ('12345678931', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678932', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678933', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678934', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678935', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678936', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678937', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678938', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678939', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678940', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678941', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678942', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678943', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678944', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678945', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678946', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678947', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678948', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678949', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678950', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678936', 'Pedro', 'Souza', 'masculino', 'Rua Caio Prado, 12'),
       ('12345678234', 'Carlos', 'Do Carmo', 'outro', 'Avenida Brasil, 4523'),
       ('12345678235', 'Carlos', 'Do Carmo', 'outro', 'Avenida Brasil, 4523'),
       ('12345678236', 'Carlos', 'Do Carmo', 'outro', 'Avenida Brasil, 4523'),
       ('12345678237', 'Carlos', 'Do Carmo', 'outro', 'Avenida Brasil, 4523'),
       ('12345678238', 'Carlos', 'Do Carmo', 'outro', 'Avenida Brasil, 4523'),
       ('12345678239', 'Carlos', 'Do Carmo', 'outro', 'Avenida Brasil, 4523'),
       ('12345678240', 'Carlos', 'Do Carmo', 'outro', 'Avenida Brasil, 4523'),
       ('12345678241', 'Carlos', 'Do Carmo', 'outro', 'Avenida Brasil, 4523'),
       ('12345678242', 'Carlos', 'Do Carmo', 'outro', 'Avenida Brasil, 4523'),
       ('12345678243', 'Carlos', 'Do Carmo', 'outro', 'Avenida Brasil, 4523'),
       ('12345678244', 'Carlos', 'Do Carmo', 'outro', 'Avenida Brasil, 4523'),
       ('12345678245', 'Carlos', 'Do Carmo', 'outro', 'Avenida Brasil, 4523'),
       ('12345678246', 'Carlos', 'Do Carmo', 'outro', 'Avenida Brasil, 4523'),
       ('12345678247', 'Carlos', 'Do Carmo', 'outro', 'Avenida Brasil, 4523'),
       ('12345678248', 'Carlos', 'Do Carmo', 'outro', 'Avenida Brasil, 4523'),
       ('12345678249', 'Carlos', 'Do Carmo', 'outro', 'Avenida Brasil, 4523'),
       ('12345678250', 'Carlos', 'Do Carmo', 'outro', 'Avenida Brasil, 4523');


SELECT COUNT(id) as pessoa_count
FROM pessoa;

INSERT INTO partido (nome, sigla, legenda, descricao)
VALUES ('Partido da Cidadania', 'PC', 12, 'Partido da Cidadania'),
       ('Movimento Democrático Brasileiro', 'DMB', 15, 'Movimento Democrático Brasileiro'),
       ('Partido do Movimento Socialista', 'PMDB', 25, 'Partido do Movimento Socialista'),
       ('Partido da Social Democracia Brasileira', 'SDB', 35, 'Partido da Social Democracia Brasileira'),
       ('Partido da Solidariedade', 'PSD', 45, 'Partido da Solidariedade'),
       ('Partido Comunista do Brasil', 'PCB', 55, 'Partido Comunista do Brasil'),
       ('Partido da Ordem Socialista', 'PSOL', 65, 'Partido da Ordem Socialista'),
       ('Partido da Rede Social Democrata', 'PRD', 75, 'Partido da Rede Social Democrata'),
       ('Partido da República Democrática', 'PRB', 85, 'Partido da República Democrática'),
       ('Partido da Mobilização Trabalhista Brasileira', 'PMB', 95, 'Partido da Mobilização Trabalhista Brasileira'),
       ('Partido da Proposta', 'PP', 105, 'Partido da Proposta'),
       ('Partido Democrático Brasileiro', 'PT', 115, 'Partido Democrático Brasileiro'),
       ('Partido Socialista Brasileiro', 'PSB', 125, 'Partido Socialista Brasileiro'),
       ('Partido Verde', 'PV', 135, 'Partido Verde'),
       ('Partido da Terra', 'PTC', 145, 'Partido da Terra'),
       ('Partido da Cultura', 'PCdoB', 155, 'Partido da Cultura'),
       ('Partido da Mulher', 'PMDB', 165, 'Partido da Mulher'),
       ('Partido da Justiça', 'PJ', 175, 'Partido da Justiça'),
       ('Partido da Família', 'PFL', 185, 'Partido da Família'),
       ('Partido da Cidadania', 'PC', 195, 'Partido da Cidadania'),
       ('Partido da Justiça e Ação Social', 'PJAS', 205, 'Partido da Justiça e Ação Social'),
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

INSERT INTO eleitor (id_pessoa, local_votacao, zona_votacao)
VALUES (13, 'Rua da Paz, 125', 4),
       (14, 'Rua da Paz, 126', 5),
       (15, 'Rua da Paz, 127', 6),
       (16, 'Rua da Paz, 128', 7),
       (17, 'Rua da Paz, 123', 8),
       (18, 'Rua da Paz, 124', 9),
       (19, 'Rua da Paz, 129', 10),
       (20, 'Rua da Paz, 130', 11),
       (21, 'Rua da Paz, 131', 12),
       (22, 'Rua da Paz, 132', 13),
       (23, 'Rua da Paz, 133', 14),
       (24, 'Rua da Paz, 134', 15),
       (25, 'Rua da Paz, 135', 16),
       (26, 'Rua da Paz, 136', 17),
       (27, 'Rua da Paz, 137', 18),
       (28, 'Rua da Paz, 138', 19),
       (29, 'Rua da Paz, 139', 20),
       (30, 'Rua da Paz, 140', 21),
       (31, 'Rua da Paz, 141', 22),
       (32, 'Rua da Paz, 142', 23),
       (33, 'Rua da Paz, 143', 24),
       (34, 'Rua da Paz, 144', 25),
       (35, 'Rua da Paz, 145', 26),
       (36, 'Rua da Paz, 146', 27),
       (37, 'Rua da Paz, 147', 28),
       (38, 'Rua da Paz, 148', 29),
       (39, 'Rua da Paz, 149', 30),
       (40, 'Rua da Paz, 150', 31),
       (41, 'Rua da Paz, 151', 32),
       (42, 'Rua da Paz, 152', 33),
       (43, 'Rua da Paz, 153', 34),
       (44, 'Rua da Paz, 154', 35),
       (45, 'Rua da Paz, 155', 36),
       (46, 'Rua da Paz, 156', 37),
       (47, 'Rua da Paz, 157', 38),
       (48, 'Rua da Paz, 158', 39),
       (49, 'Rua da Paz, 159', 40),
       (50, 'Rua da Paz, 160', 41),
       (51, 'Rua da Paz, 161', 42),
       (52, 'Rua da Paz, 162', 43);

SELECT count(id) AS eleitor_count
FROM eleitor;

INSERT INTO coligacao (nome)
VALUES ('Coligação 1'),
       ('Coligação 2'),
       ('Coligação 3'),
       ('Coligação 4'),
       ('Coligação 5'),
       ('Coligação 6'),
       ('Coligação 7'),
       ('Coligação 8'),
       ('Coligação 9');

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
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 9),
       (10, 10),
       (11, 11),
       (12, 12),
       (13, 13),
       (14, 14),
       (15, 15),
       (16, 16),
       (17, 17),
       (18, 18),
       (19, 19),
       (20, 20),
       (21, 21),
       (22, 22),
       (23, 23),
       (24, 24),
       (25, 25),
       (26, 26),
       (27, 27),
       (28, 28),
       (29, 29),
       (30, 30);

SELECT b.id_partido as id_partido_na_coligacao
FROM (SELECT id_coligacao FROM coligacao_partido WHERE id_partido = 1) AS a
         JOIN coligacao_partido b ON a.id_coligacao = b.id_coligacao;

SELECT id_coligacao, GROUP_CONCAT(id_partido) AS id_partidos, GROUP_CONCAT(partido.sigla) AS sigla_partidos
FROM coligacao_partido
         INNER JOIN partido ON coligacao_partido.id_partido = partido.id
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

