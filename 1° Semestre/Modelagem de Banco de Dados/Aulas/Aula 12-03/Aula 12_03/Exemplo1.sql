/* Lógico_1: */

CREATE TABLE Telefone (
    codpaisfk integer,
    fk_NumeroTel_codnumero serial,
    fk_DDD_codDDD serial,
    fk_Operadora_codop integer
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
    codop integer PRIMARY KEY,
    nomeop varchar(100)
);

CREATE TABLE pais (
    codpais serial PRIMARY KEY,
    pais varchar(100)
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