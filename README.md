### Descrição Documental do Banco de Dados

#### Introdução

Este documento descreve a estrutura e o propósito do banco de dados desenvolvido para auxiliar no acompanhamento do desenvolvimento linguístico de crianças. O banco de dados foi modelado para armazenar informações sobre os usuários do sistema (fonoaudiólogos e desenvolvedores), as crianças acompanhadas, bem como os detalhes das avaliações e intervenções realizadas.

#### Estrutura do Banco de Dados

O banco de dados é composto por quatro principais tabelas: `usuarios`, `criancas`, `avaliacoes` e `intervencoes`. A seguir, detalhamos a estrutura de cada uma dessas tabelas.

### Tabelas

#### Tabela `usuarios`

Esta tabela armazena informações sobre os usuários do sistema, que podem ser fonoaudiólogos ou desenvolvedores. A estrutura é definida como segue:

- **id**: Identificador único do usuário (chave primária).
- **nome**: Nome completo do usuário.
- **email**: Endereço de e-mail do usuário (único).
- **senha**: Senha do usuário para acesso ao sistema.
- **tipo_usuario**: Tipo de usuário, podendo ser 'Fonoaudiólogo' ou 'Desenvolvedor'.
- **data_criacao**: Data e hora de criação do registro.

```sql
CREATE TABLE usuarios
(
    id           SERIAL PRIMARY KEY,
    nome         VARCHAR(100) NOT NULL,
    email        VARCHAR(100) NOT NULL UNIQUE,
    senha        VARCHAR(100) NOT NULL,
    tipo_usuario VARCHAR(50) CHECK (tipo_usuario IN ('Fonoaudiólogo', 'Desenvolvedor')),
    data_criacao TIMESTAMP DEFAULT current_timestamp
);
```

#### Tabela `criancas`

Esta tabela armazena informações sobre as crianças acompanhadas pelos fonoaudiólogos. A estrutura é definida como segue:

- **id**: Identificador único da criança (chave primária).
- **nome**: Nome completo da criança.
- **data_nascimento**: Data de nascimento da criança.
- **responsavel_nome**: Nome do responsável pela criança.
- **responsavel_contato**: Informação de contato do responsável.
- **data_criacao**: Data e hora de criação do registro.

```sql
CREATE TABLE criancas
(
    id                  SERIAL PRIMARY KEY,
    nome                VARCHAR(100) NOT NULL,
    data_nascimento     DATE         NOT NULL,
    responsavel_nome    VARCHAR(100) NOT NULL,
    responsavel_contato VARCHAR(100) NOT NULL,
    data_criacao        TIMESTAMP DEFAULT current_timestamp
);
```

#### Tabela `avaliacoes`

Esta tabela armazena informações sobre as avaliações periódicas realizadas pelos fonoaudiólogos nas crianças. A estrutura é definida como segue:

- **id**: Identificador único da avaliação (chave primária).
- **crianca_id**: Identificador da criança avaliada (chave estrangeira referenciando `criancas`).
- **fonoaudiologo_id**: Identificador do fonoaudiólogo que realizou a avaliação (chave estrangeira referenciando `usuarios`).
- **data_avaliacao**: Data em que a avaliação foi realizada.
- **descricao**: Descrição detalhada da avaliação.
- **resultado**: Resultados da avaliação.
- **data_criacao**: Data e hora de criação do registro.

```sql
CREATE TABLE avaliacoes
(
    id               SERIAL PRIMARY KEY,
    crianca_id       INT  NOT NULL REFERENCES criancas (id),
    fonoaudiologo_id INT  NOT NULL REFERENCES usuarios (id),
    data_avaliacao   DATE NOT NULL,
    descricao        TEXT NOT NULL,
    resultado        TEXT NOT NULL,
    data_criacao     TIMESTAMP DEFAULT current_timestamp
);
```

#### Tabela `intervencoes`

Esta tabela armazena informações sobre as intervenções realizadas pelos fonoaudiólogos nas crianças. A estrutura é definida como segue:

- **id**: Identificador único da intervenção (chave primária).
- **crianca_id**: Identificador da criança que recebeu a intervenção (chave estrangeira referenciando `criancas`).
- **fonoaudiologo_id**: Identificador do fonoaudiólogo que realizou a intervenção (chave estrangeira referenciando `usuarios`).
- **data_intervencao**: Data em que a intervenção foi realizada.
- **descricao**: Descrição detalhada da intervenção.
- **resultados_obtidos**: Resultados obtidos com a intervenção.
- **data_criacao**: Data e hora de criação do registro.

```sql
CREATE TABLE intervencoes
(
    id                 SERIAL PRIMARY KEY,
    crianca_id         INT  NOT NULL REFERENCES criancas (id),
    fonoaudiologo_id   INT  NOT NULL REFERENCES usuarios (id),
    data_intervencao   DATE NOT NULL,
    descricao          TEXT NOT NULL,
    resultados_obtidos TEXT NOT NULL,
    data_criacao       TIMESTAMP DEFAULT current_timestamp
);
```

### Conclusão

O banco de dados foi cuidadosamente estruturado para garantir que todas as informações relevantes sejam armazenadas de maneira eficiente e organizada. Com as tabelas de `usuarios`, `criancas`, `avaliacoes` e `intervencoes`, o sistema está preparado para suportar o acompanhamento detalhado do desenvolvimento linguístico das crianças, facilitando a intervenção precoce e promovendo uma melhor comunicação entre fonoaudiólogos, desenvolvedores e famílias.

Essa documentação serve como um guia para entender a lógica por trás do design do banco de dados e pode ser usada como referência para futuras manutenções e expansões do sistema.