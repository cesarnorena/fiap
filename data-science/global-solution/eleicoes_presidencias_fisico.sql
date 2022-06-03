/* eleicoes_presidencias_logico: */

CREATE TABLE eleitor
(
    id         INTEGER PRIMARY KEY UNIQUE,
    id_local   INTEGER NOT NULL,
    id_persona INTEGER NOT NULL
);

CREATE TABLE candidato
(
    id         INTEGER PRIMARY KEY UNIQUE,
    no_votacao VARCHAR,
    id_partido INTEGER NOT NULL,
    id_persona INTEGER NOT NULL
);

CREATE TABLE partido
(
    id        INTEGER PRIMARY KEY UNIQUE,
    nome      VARCHAR,
    sigla     VARCHAR,
    legenda   VARCHAR,
    descricao VARCHAR
);

CREATE TABLE voto
(
    id           INTEGER PRIMARY KEY UNIQUE,
    id_eleitor   INTEGER NOT NULL,
    id_candidato INTEGER NOT NULL
);

CREATE TABLE coligaco
(
    id INTEGER PRIMARY KEY UNIQUE
);

CREATE TABLE local_votacao
(
    id          INTEGER PRIMARY KEY UNIQUE,
    id_zona     INTEGER NOT NULL,
    id_endereco INTEGER NOT NULL
);

CREATE TABLE endereco
(
    id       INTEGER PRIMARY KEY UNIQUE,
    estado   VARCHAR(2),
    cidade   VARCHAR,
    endereco VARCHAR
);

CREATE TABLE zona
(
    id INTEGER PRIMARY KEY UNIQUE
);

CREATE TABLE persona
(
    id                      INTEGER PRIMARY KEY UNIQUE,
    cpf                     VARCHAR UNIQUE,
    nome                    VARCHAR,
    sobrenome               VARCHAR,
    sexo                    VARCHAR,
    id_endereco_residencial INTEGER NOT NULL,
);

CREATE TABLE coligacao_partido
(
    id           INTEGER PRIMARY KEY UNIQUE,
    id_partido   INTEGER NOT NULL,
    id_coligacao INTEGER NOT NULL
);

ALTER TABLE eleitor
    ADD CONSTRAINT fk_eleitor_local
        FOREIGN KEY (id_local)
            REFERENCES local_votacao (id)
            ON DELETE RESTRICT;

ALTER TABLE eleitor
    ADD CONSTRAINT fk_eleitor_person
        FOREIGN KEY (id_persona)
            REFERENCES persona (id)
            ON DELETE CASCADE;

ALTER TABLE candidato
    ADD CONSTRAINT fk_candidato_partido
        FOREIGN KEY (id_partido)
            REFERENCES partido (id)
            ON DELETE RESTRICT;

ALTER TABLE candidato
    ADD CONSTRAINT fk_candidato_persona
        FOREIGN KEY (id_persona)
            REFERENCES persona (id)
            ON DELETE CASCADE;

ALTER TABLE voto
    ADD CONSTRAINT fk_voto_eleitor
        FOREIGN KEY (id_eleitor)
            REFERENCES eleitor (id)
            ON DELETE CASCADE;

ALTER TABLE voto
    ADD CONSTRAINT fk_voto_candidato
        FOREIGN KEY (id_candidato)
            REFERENCES candidato (id)
            ON DELETE CASCADE;

ALTER TABLE local_votacao
    ADD CONSTRAINT fk_local_votacao_zona
        FOREIGN KEY (id_zona)
            REFERENCES zona (id)
            ON DELETE RESTRICT;

ALTER TABLE local_votacao
    ADD CONSTRAINT fk_local_votacao_endereco
        FOREIGN KEY (id_endereco)
            REFERENCES endereco (id)
            ON DELETE CASCADE;

ALTER TABLE persona
    ADD CONSTRAINT fk_persona_endereco_residencial
        FOREIGN KEY (id_endereco_residencial)
            REFERENCES endereco (id)
            ON DELETE CASCADE;

ALTER TABLE coligacao_partido
    ADD CONSTRAINT fk_coligacao_partido_partido
        FOREIGN KEY (id_partido)
            REFERENCES partido (id)
            ON DELETE RESTRICT;

ALTER TABLE coligacao_partido
    ADD CONSTRAINT fk_coligacao_partido_coligacao
        FOREIGN KEY (id_coligacao)
            REFERENCES coligaco (id);
