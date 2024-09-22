-- Criar a tabela de usuários, que inclui fonoaudiólogos e desenvolvedores
CREATE TABLE fonoaudiologos
(
    id           SERIAL PRIMARY KEY,
    nome         VARCHAR(100) NOT NULL,
    email        VARCHAR(100) NOT NULL UNIQUE,
    senha        VARCHAR(100) NOT NULL,
    data_criacao TIMESTAMP DEFAULT current_timestamp
);

-- Criar a tabela de crianças
CREATE TABLE criancas
(
    id                  SERIAL PRIMARY KEY,
    nome                VARCHAR(100) NOT NULL,
    data_nascimento     DATE         NOT NULL,
    responsavel_nome    VARCHAR(100) NOT NULL,
    responsavel_contato VARCHAR(100) NOT NULL,
    id_fonoaudiologo_responsavel INT NOT NULL REFERENCES fonoaudiologos (id),
    data_criacao        TIMESTAMP DEFAULT current_timestamp
);

-- Criar a tabela de avaliações
CREATE TABLE avaliacoes
(
    id               SERIAL PRIMARY KEY,
    crianca_id       INT  NOT NULL REFERENCES criancas (id),
    fonoaudiologo_id INT  NOT NULL REFERENCES fonoaudiologos (id),
    data_avaliacao   DATE NOT NULL,
    descricao        TEXT NOT NULL,
    resultado        TEXT NOT NULL,
    data_criacao     TIMESTAMP DEFAULT current_timestamp
);

-- Criar a tabela de intervenções
CREATE TABLE intervencoes
(
    id                 SERIAL PRIMARY KEY,
    crianca_id         INT  NOT NULL REFERENCES criancas (id),
    fonoaudiologo_id   INT  NOT NULL REFERENCES fonoaudiologos (id),
    data_intervencao   DATE NOT NULL,
    descricao          TEXT NOT NULL,
    resultados_obtidos TEXT NOT NULL,
    data_criacao       TIMESTAMP DEFAULT current_timestamp
);
