-- Criando Bando de Dados

CREATE DATABASE fatec_vendas;


-- Cria um domínio para não ficar repetindo
CREATE DOMAIN nome_padrao VARCHAR(100) NOT NULL;

-- Cria as tabelas
CREATE TABLE sexo (
	codsexo SERIAL PRIMARY KEY,
	nomesexo VARCHAR(9) NOT NULL
);

CREATE TABLE numero (
	codnumero SERIAL PRIMARY KEY,
	valornumero VARCHAR(30) NOT NULL
);

CREATE TABLE rua (
	codrua SERIAL PRIMARY KEY,
	nomerua VARCHAR(100) NOT NULL
);

CREATE TABLE bairro (
	codbairro SERIAL PRIMARY KEY,
	nomebairro VARCHAR(30) NOT NULL
);

CREATE TABLE cep (
	codcep SERIAL PRIMARY KEY,
	numerocep CHAR(9) NOT NULL
);

CREATE TABLE uf (
	coduf SERIAL PRIMARY KEY,
	nomeuf VARCHAR(100) NOT NULL,
	sigla CHAR(2) NOT NULL
);

CREATE TABLE cidade (
	codcidade SERIAL PRIMARY KEY,
	nomecidade VARCHAR(30) NOT NULL,
	coduf INT NOT NULL,
	CONSTRAINT coduf_fk
		FOREIGN KEY (coduf)
		REFERENCES uf(coduf)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE cidadeuf (
	codcidade INT,
	coduf INT,
	CONSTRAINT codcidade_fk
		FOREIGN KEY (codcidade)
		REFERENCES cidade(codcidade)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT coduf_fk
		FOREIGN KEY (coduf)
		REFERENCES uf(coduf)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY(codcidade, coduf)
);

CREATE TABLE endereco (
    codender SERIAL PRIMARY KEY,
    codnumero INT,
    CONSTRAINT codnumero_fk
        FOREIGN KEY (codnumero)
        REFERENCES numero(codnumero)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    codrua INT,
    CONSTRAINT codruafk
        FOREIGN KEY (codrua)
        REFERENCES rua(codrua)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    codbairro INT,
    CONSTRAINT codbairro_fk -- Corrigido: 'cobairro' -> 'codbairro'
        FOREIGN KEY (codbairro)
        REFERENCES bairro(codbairro)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    codcep INT,
    CONSTRAINT codcep_fk
        FOREIGN KEY (codcep)
        REFERENCES cep(codcep)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    codcidade INT,
    CONSTRAINT codcidade_fk
        FOREIGN KEY (codcidade)
        REFERENCES cidade(codcidade)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE marca (
	codmarca SERIAL PRIMARY KEY,
	nomemarca nome_padrao
);

CREATE TABLE tipoproduto (
	codtipoproduto SERIAL PRIMARY KEY,
	nometipoproduto nome_padrao
);

CREATE TABLE produto (
	codproduto SERIAL PRIMARY KEY,
	nomeproduto nome_padrao,
	codmarca INT,
	CONSTRAINT codmarca_fk
		FOREIGN KEY (codmarca)
		REFERENCES marca(codmarca)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	codtipoproduto INT,
	CONSTRAINT codtipoproduto_fk
		FOREIGN KEY (codtipoproduto)
		REFERENCES tipoproduto(codtipoproduto)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE cliente (
	codcliente SERIAL PRIMARY KEY,
	nomecliente nome_padrao,
	cpf VARCHAR(20) NOT NULL UNIQUE,
	datanasc DATE NOT NULL,
	codsexo INT,
	CONSTRAINT codsexo_fk
		FOREIGN KEY (codsexo)
		REFERENCES sexo(codsexo)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	codender INT,
	CONSTRAINT codender_fk
		FOREIGN KEY (codender)
		REFERENCES endereco(codender)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE venda (
	codvenda SERIAL PRIMARY KEY,
	datavenda TIMESTAMP NOT NULL,
	codcliente INT,
	CONSTRAINT codcliente_fk
		FOREIGN KEY (codcliente)
		REFERENCES cliente(codcliente)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE venda_produto (
	codvenda INT,
	codproduto INT,
	quantv INT NOT NULL,
	valorv DECIMAL(10,2) NOT NULL,
	CONSTRAINT codvenda_fk
		FOREIGN KEY (codvenda)
		REFERENCES venda(codvenda)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT codproduto_fk
		FOREIGN KEY (codproduto)
		REFERENCES produto(codproduto)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY (codvenda,codproduto)
);

CREATE TABLE fornecedor (
	codfornecedor SERIAL PRIMARY KEY,
	nomefornecedor nome_padrao,
	cnpj CHAR(14) NOT NULL,
	codender INT,
	CONSTRAINT codender_fk
		FOREIGN KEY (codender)
		REFERENCES endereco(codender)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE telefone (
	codtel SERIAL PRIMARY KEY,
	numerotel VARCHAR(30) NOT NULL
);

CREATE TABLE cliente_telefone (
	codcliente INT,
	codtel INT,
	CONSTRAINT codcliente_fk
		FOREIGN KEY (codcliente)
		REFERENCES cliente(codcliente)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT codtel_fk
		FOREIGN KEY (codtel)
		REFERENCES telefone(codtel)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY (codcliente,codtel)
);

CREATE TABLE fornecedor_telefone (
	codfornecedor INT,
	codtel INT,
	CONSTRAINT codfornecedor_fk
		FOREIGN KEY (codfornecedor)
		REFERENCES fornecedor(codfornecedor)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT codtel_fk
		FOREIGN KEY (codtel)
		REFERENCES telefone(codtel)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY (codfornecedor,codtel)
);

CREATE TABLE compra (
	codcompra SERIAL PRIMARY KEY,
	datacompra TIMESTAMP NOT NULL,
	codfornecedor INT,
	CONSTRAINT codfornecedor_fk
		FOREIGN KEY (codfornecedor)
		REFERENCES fornecedor(codfornecedor)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE compra_produto (
	codcompra INT,
	codproduto INT,
	valorc DECIMAL(10,2) NOT NULL,
	quantc INT NOT NULL,
	CONSTRAINT codcompra_fk
		FOREIGN KEY (codcompra)
		REFERENCES compra(codcompra)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT codproduto_fk
		FOREIGN KEY (codproduto)
		REFERENCES produto(codproduto)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY (codcompra,codproduto)
);

CREATE TABLE situacao (
	codsituacao SERIAL PRIMARY KEY,
	nomesituacao nome_padrao
);

CREATE TABLE parcelas (
	codparcela SERIAL PRIMARY KEY,
	valorp DECIMAL(10,2) NOT NULL,
	quantp INT NOT NULL,
	datavencimento DATE NOT NULL,
	codsituacao INT,
	CONSTRAINT codsituacao_fk
		FOREIGN KEY (codsituacao)
		REFERENCES situacao(codsituacao)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	codvenda INT,
	CONSTRAINT codvenda_fk
		FOREIGN KEY (codvenda)
		REFERENCES venda(codvenda)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);