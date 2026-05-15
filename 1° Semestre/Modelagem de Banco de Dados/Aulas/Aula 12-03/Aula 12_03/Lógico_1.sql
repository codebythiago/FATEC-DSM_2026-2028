/* Lógico_1: */

CREATE TABLE Telefone (
    fk_pais_pais_PK serial,
    fk_NumeroTel_codnumero serial,
    fk_DDD_codDDD serial,
    fk_Operadora_codop serial
);

CREATE TABLE NumeroTel (
    codnumero serial PRIMARY KEY,
    valornumero varchar(10)
);

CREATE TABLE DDD (
    codDDD serial PRIMARY KEY,
    valorDDD char(4)
);

CREATE TABLE Operadora (
    codop serial PRIMARY KEY,
    nomeop varchar(100)
);

CREATE TABLE Aluno (
    Ra serial PRIMARY KEY,
    Nome varchar(100),
    datanasc date,
    fk_Sexo_codsexo serial,
    fk_Instrutor_codinst serial
);

CREATE TABLE Sexo (
    codsexo serial PRIMARY KEY,
    nomesexo varchar(9)
);

CREATE TABLE Instrutor (
    nome varchar(100),
    codinst serial PRIMARY KEY,
    salario double
);

CREATE TABLE Formacao (
    codformacao serial PRIMARY KEY,
    nomeformacao varchar(80)
);

CREATE TABLE Endereco (
    fk_Rua_codrua serial,
    fk_Cidade_codcidade serial,
    fk_Bairro_codbairro serial,
    fk_Cep_codcep serial,
    fk_Uf_coduf serial
);

CREATE TABLE Rua (
    codrua serial PRIMARY KEY,
    nomerua varchar(100)
);

CREATE TABLE Cidade (
    codcidade serial PRIMARY KEY,
    nomecidade varchar(100)
);

CREATE TABLE Bairro (
    codbairro serial PRIMARY KEY,
    nomebairro varchar(50)
);

CREATE TABLE Cep (
    codcep serial PRIMARY KEY,
    numerocep char(9)
);

CREATE TABLE Uf (
    coduf serial PRIMARY KEY,
    nomeuf varchar(50),
    sigla cgar(2()
);

CREATE TABLE pais (
    pais_PK serial NOT NULL PRIMARY KEY,
    pais varchar(100)
);

CREATE TABLE AlunoTelefone (
    fk_Aluno_Ra serial
);

CREATE TABLE InstrutorFormacao (
    fk_Instrutor_codinst serial,
    fk_Formacao_codformacao serial
);
 
ALTER TABLE Telefone ADD CONSTRAINT FK_Telefone_1
    FOREIGN KEY (fk_pais_pais_PK)
    REFERENCES pais (pais_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Telefone ADD CONSTRAINT FK_Telefone_2
    FOREIGN KEY (fk_NumeroTel_codnumero)
    REFERENCES NumeroTel (codnumero)
    ON DELETE SET NULL;
 
ALTER TABLE Telefone ADD CONSTRAINT FK_Telefone_3
    FOREIGN KEY (fk_DDD_codDDD)
    REFERENCES DDD (codDDD)
    ON DELETE SET NULL;
 
ALTER TABLE Telefone ADD CONSTRAINT FK_Telefone_4
    FOREIGN KEY (fk_Operadora_codop)
    REFERENCES Operadora (codop)
    ON DELETE CASCADE;
 
ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_2
    FOREIGN KEY (fk_Sexo_codsexo)
    REFERENCES Sexo (codsexo)
    ON DELETE CASCADE;
 
ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_3
    FOREIGN KEY (fk_Instrutor_codinst)
    REFERENCES Instrutor (codinst)
    ON DELETE CASCADE;
 
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_1
    FOREIGN KEY (fk_Rua_codrua)
    REFERENCES Rua (codrua)
    ON DELETE CASCADE;
 
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_2
    FOREIGN KEY (fk_Cidade_codcidade)
    REFERENCES Cidade (codcidade)
    ON DELETE CASCADE;
 
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_3
    FOREIGN KEY (fk_Bairro_codbairro)
    REFERENCES Bairro (codbairro)
    ON DELETE CASCADE;
 
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_4
    FOREIGN KEY (fk_Cep_codcep)
    REFERENCES Cep (codcep)
    ON DELETE CASCADE;
 
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_5
    FOREIGN KEY (fk_Uf_coduf)
    REFERENCES Uf (coduf)
    ON DELETE CASCADE;
 
ALTER TABLE AlunoTelefone ADD CONSTRAINT FK_AlunoTelefone_1
    FOREIGN KEY (fk_Aluno_Ra)
    REFERENCES Aluno (Ra)
    ON DELETE SET NULL;
 
ALTER TABLE InstrutorFormacao ADD CONSTRAINT FK_InstrutorFormacao_1
    FOREIGN KEY (fk_Instrutor_codinst)
    REFERENCES Instrutor (codinst)
    ON DELETE SET NULL;
 
ALTER TABLE InstrutorFormacao ADD CONSTRAINT FK_InstrutorFormacao_2
    FOREIGN KEY (fk_Formacao_codformacao)
    REFERENCES Formacao (codformacao)
    ON DELETE SET NULL;