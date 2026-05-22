-- Nome do Banco de Dados
CREATE DATABASE exemplo_21_05;

-- Domínio para VARCHAR(80) NOT NULL
CREATE DOMAIN nome_padrao VARCHAR(80) NOT NULL;

-- SEXO = {@CODSEXO, NOMESEXO}
CREATE TABLE sexo (
  codsexo SERIAL PRIMARY KEY,
  nomesexo VARCHAR(9) NOT NULL UNIQUE
);

INSERT INTO sexo(nomesexo)
VALUES ('MASCULINO'), ('FEMININO');

-- SELECT -- PROJEÇÃO DA ÁLGEBRA RELACIONAL
-- FROM   -- RELAÇÃO
-- WHERE  -- SELEÇÃO DA ÁLGEBRA RELACIONAL

SELECT codsexo, nomesexo FROM SEXO;

-- UF = {@CODUF, NOMEUF, SIGLA}
CREATE TABLE UF (
  coduf SERIAL PRIMARY KEY,
  nomeuf nome_padrao UNIQUE,
  sigla CHAR(2) NOT NULL UNIQUE
);

INSERT INTO UF(nomeuf, sigla) VALUES ('SÃO PAULO', 'SP');
INSERT INTO UF(nomeuf, sigla) VALUES('MINAS GERAIS', 'MG');
INSERT INTO UF(nomeuf, sigla) VALUES('MATO GROSSO DO SUL', 'MS');

SELECT * FROM UF;
SELECT coduf, nomeuf, sigla FROM UF;
SELECT coduf, nomeuf FROM UF;
SELECT sigla, nomeuf FROM UF;

SELECT * -- CAMPOS DA PROJEÇÃO DA ÁLGEBRA RELACIONAL
FROM UF -- RELAÇÃO
WHERE coduf > 1; -- SELEÇÃO DA ÁLGEBRA RELACIONAL

-- CIDADE = {@CODCIDADE, NOMECIDADE}
CREATE TABLE cidade (
  codcidade SERIAL PRIMARY KEY,
  nomecidade nome_padrao
);

INSERT INTO cidade(nomecidade) VALUES('PEREIRA BARRETO'), ('ILHA SOLTEIRA'), ('ITAPURA'), ('SELVÍRIA');

-- CIDADEUF = {@(#CODCIDADE, #CODUF)}
CREATE TABLE cidadeuf (
  codcidade int,
  CONSTRAINT fk_cidadeuf_cidade
  	FOREIGN KEY (codcidade)
	REFERENCES cidade(codcidade)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
  coduf int,
  CONSTRAINT fk_cidadeuf_uf
  	FOREIGN KEY (coduf)
	REFERENCES UF(coduf)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

INSERT INTO cidadeuf(codcidade, coduf) VALUES (1, 1);
INSERT INTO cidadeuf(codcidade, coduf) VALUES (2, 1);
INSERT INTO cidadeuf(codcidade, coduf) VALUES
(3, (SELECT CODUF FROM UF WHERE nomeuf = 'SÃO PAULO'));
INSERT INTO cidadeuf(codcidade, coduf) VALUES
((SELECT codcidade FROM cidade WHERE nomecidade = 'SELVÍRIA'), (SELECT CODUF FROM UF WHERE sigla = 'MS'));

-- PARA ADICIONAR UMA SUBQUERY(SUB-CONSULTA) NA INSERÇÃO, O SELECT DEVE OBRIGATORIAMENTE ESTAR ENTRE PARENTESES

SELECT c.codcidade, u.coduf, c.nomecidade, u.nomeuf
FROM cidadeuf cu, uf u, cidade c
WHERE cu.codcidade = c.codcidade AND cu.coduf = u.coduf;

-- CURSO = {@CODCURSO, NOMECURSO}
CREATE TABLE curso (
  codcurso SERIAL PRIMARY KEY,
  nomecurso nome_padrao
);

INSERT INTO curso(nomecurso) VALUES ('DESENVOLVIMENTO DE SOFTWARE MULTIPLATAFORMA');
INSERT INTO curso(nomecurso) VALUES ('ADMINISTRAÇÃO');
INSERT INTO curso(nomecurso) VALUES ('MATEMÁTICA');
INSERT INTO curso(nomecurso) VALUES ('ENGENHARIA CIVIL');

-- ALUNO = {@CODALUNO, NOMEALUNO, #CODSEXOFK, #CODCURSOFK, DATANASC}
CREATE TABLE aluno (
  codaluno SERIAL PRIMARY KEY,
  nomealuno nome_padrao,
  codsexo int,
  CONSTRAINT fk_aluno_sexo
  	FOREIGN KEY (codsexo)
	REFERENCES sexo(codsexo)
	ON DELETE RESTRICT
	ON UPDATE CASCADE,
  codcurso int,
  CONSTRAINT fk_aluno_curso
    FOREIGN KEY (codcurso)
	REFERENCES curso(codcurso)
	ON DELETE RESTRICT
	ON UPDATE CASCADE,
  datanasc DATE NOT NULL
);

ALTER TABLE aluno
ADD COLUMN codcidade int,
ADD CONSTRAINT fk_aluno_cidade
  FOREIGN KEY (codcidade)
  REFERENCES cidade(codcidade)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

INSERT INTO aluno (nomealuno, codsexo, codcurso, datanasc)
VALUES ('MARCOS ANTONIO', 1, 1, '1979-02-01');
INSERT INTO aluno (nomealuno, codsexo, codcurso, datanasc)
VALUES ('DOMENICO', 1, 1, '1979-02-01');

UPDATE aluno
SET codcidade = 2
WHERE codaluno = 1;
UPDATE aluno
SET codcidade = 2
WHERE codaluno = 2;

SELECT a.codaluno, a.nomealuno, c.nomecurso, s.nomesexo, a.datanasc, ci.nomecidade
FROM aluno a, curso c, sexo s, cidade ci
WHERE a.codcurso = c.codcurso AND a.codsexo = s.codsexo AND a.codcidade = ci.codcidade;