/* eleicoes_presidencias_logico: */

CREATE TABLE eleitor (
    id INTEGER PRIMARY KEY,
    id_persona INTEGER,
    local_votacao VARCHAR,
    zona_votacao VARCHAR
);

CREATE TABLE candidato (
    id INTEGER PRIMARY KEY UNIQUE,
    no_votacao VARCHAR,
    id_partido INTEGER,
    id_persona INTEGER
);

CREATE TABLE partido (
    id INTEGER PRIMARY KEY UNIQUE,
    nome VARCHAR,
    sigla VARCHAR,
    legenda VARCHAR,
    descricao VARCHAR
);

CREATE TABLE voto (
    id INTEGER PRIMARY KEY UNIQUE,
    id_eleitor INTEGER,
    id_candidator INTEGER
);

CREATE TABLE persona (
    id INTEGER PRIMARY KEY,
    cpf VARCHAR,
    nome VARCHAR,
    sobrenome VARCHAR,
    sexo VARCHAR,
    endereco INTEGER,
    UNIQUE (cpf, id)
);

CREATE TABLE coligacao_partido (
    id INTEGER PRIMARY KEY UNIQUE,
    id_partido INTEGER,
    id_coligacao INTEGER
);
 
ALTER TABLE eleitor ADD CONSTRAINT FK_eleitor_2
    FOREIGN KEY (id_persona)
    REFERENCES persona (id);
 
ALTER TABLE candidato ADD CONSTRAINT FK_candidato_2
    FOREIGN KEY (id_partido)
    REFERENCES partido (id)
    ON DELETE RESTRICT;
 
ALTER TABLE candidato ADD CONSTRAINT FK_candidato_3
    FOREIGN KEY (id_persona, fk_persona_id_endereco_residencial???)
    REFERENCES persona (id, ???)
    ON DELETE CASCADE;
 
ALTER TABLE voto ADD CONSTRAINT FK_voto_2
    FOREIGN KEY (id_eleitor, fk_eleitor_id_local???, fk_eleitor_id_persona???)
    REFERENCES eleitor (id, ???, ???)
    ON DELETE CASCADE;
 
ALTER TABLE voto ADD CONSTRAINT FK_voto_3
    FOREIGN KEY (id_candidator, fk_candidato_id_persona???)
    REFERENCES candidato (id, ???)
    ON DELETE CASCADE;
 
ALTER TABLE coligacao_partido ADD CONSTRAINT FK_coligacao_partido_1
    FOREIGN KEY (id_partido)
    REFERENCES partido (id)
    ON DELETE RESTRICT;