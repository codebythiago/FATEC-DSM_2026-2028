-- CREATE DATABASE fatec_ilha_thiago;

CREATE DOMAIN nome_padrao AS VARCHAR(100) NOT NULL;

-- 2) sexo = {codsexo, nomesexo}
CREATE TABLE sexo (
    codsexo SERIAL PRIMARY KEY,
    nomesexo nome_padrao
);

-- 3) rua = {codrua, nomerua}
CREATE TABLE rua (
    codrua SERIAL PRIMARY KEY,
    nomerua nome_padrao
);

-- 4) bairro = {codbairro, nomebairro}
CREATE TABLE bairro (
    codbairro SERIAL PRIMARY KEY,
    nomebairro nome_padrao
);

-- 5) cep = {codcep, numerocep}
CREATE TABLE cep (
    codcep SERIAL PRIMARY KEY,
    numerocep CHAR(9) NOT NULL
);

-- 7) uf = {coduf, nomeuf, sigla}
CREATE TABLE uf (
    coduf SERIAL PRIMARY KEY,
    nomeuf nome_padrao,
    sigla CHAR(2) NOT NULL
);

-- 6) cidade = {codcidade, nomecidade, coduf}
CREATE TABLE cidade (
    codcidade SERIAL PRIMARY KEY,
    nomecidade nome_padrao,
    coduf INT,
    CONSTRAINT fk_cidade_uf
        FOREIGN KEY (coduf)
        REFERENCES uf(coduf)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 8) trabalho = {codtrabalho, nometrabalho}
CREATE TABLE trabalho (
    codtrabalho SERIAL PRIMARY KEY,
    nometrabalho nome_padrao
);

-- 1) cliente = {codcliente, nomecliente, foto, datanasc, codsexo, codrua, codbairro, codcep, codcidade, salario, codtrabalho, numerocasa}
CREATE TABLE cliente (
    codcliente SERIAL PRIMARY KEY,
    nomecliente nome_padrao,
    foto BYTEA,
    datanasc DATE NOT NULL CHECK (datanasc <= CURRENT_DATE),
    
    codsexo INT,
    CONSTRAINT fk_cliente_sexo
        FOREIGN KEY (codsexo)
        REFERENCES sexo(codsexo)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    
    codrua INT,
    CONSTRAINT fk_cliente_rua
        FOREIGN KEY (codrua)
        REFERENCES rua(codrua)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    
    codbairro INT,
    CONSTRAINT fk_cliente_bairro
        FOREIGN KEY (codbairro)
        REFERENCES bairro(codbairro)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    
    codcep INT,
    CONSTRAINT fk_cliente_cep
        FOREIGN KEY (codcep)
        REFERENCES cep(codcep)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    
    codcidade INT,
    CONSTRAINT fk_cliente_cidade
        FOREIGN KEY (codcidade)
        REFERENCES cidade(codcidade)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    salario DECIMAL(10,2),

    codtrabalho INT,
    CONSTRAINT fk_cliente_trabalho
        FOREIGN KEY (codtrabalho)
        REFERENCES trabalho(codtrabalho)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    numerocasa VARCHAR(20)
);

-- 10) operadora = {codperadora, nomeoperadora}
CREATE TABLE operadora (
    codoperadora SERIAL PRIMARY KEY,
    nomeoperadora nome_padrao
);

-- 9) telefone = {codtelefone, numero, codoperadora}
CREATE TABLE telefone (
    codtelefone SERIAL PRIMARY KEY,
    numero VARCHAR(25) NOT NULL UNIQUE,
    codoperadora INT,
    CONSTRAINT fk_telefone_operadora
        FOREIGN KEY (codoperadora)
        REFERENCES operadora(codoperadora)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 11) itenstelefonecliente = {codtelefone, codcliente}
CREATE TABLE itenstelefonecliente (
    codtelefone INT,
    CONSTRAINT fk_itenstelefonecliente_telefone
        FOREIGN KEY (codtelefone)
        REFERENCES telefone(codtelefone)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codcliente INT,
    CONSTRAINT fk_itenstelefonecliente_cliente
        FOREIGN KEY (codcliente)
        REFERENCES cliente(codcliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    PRIMARY KEY (codtelefone, codcliente)
);

-- 12) itenstelefonetrabalho = {codtrabalho, codtelefone}
CREATE TABLE itenstelefonetrabalho (
    codtrabalho INT,
    CONSTRAINT fk_itenstelefonetrabalho_trabalho
        FOREIGN KEY (codtrabalho)
        REFERENCES trabalho(codtrabalho)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codtelefone INT,
    CONSTRAINT fk_itenstelefonetrabalho_telefone
        FOREIGN KEY (codtelefone)
        REFERENCES telefone(codtelefone)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    PRIMARY KEY (codtrabalho, codtelefone)
);

-- 20) loja = {codloja, nomeloja, cnpj, nomefantasia, razaosocial}
CREATE TABLE loja (
    codloja SERIAL PRIMARY KEY,
    nomeloja nome_padrao,
    cnpj CHAR(14) NOT NULL UNIQUE,
    nomefantasia nome_padrao,
    razaosocial nome_padrao UNIQUE
);

-- 14) funcao = {codfuncao, nomefuncao}
CREATE TABLE funcao (
    codfuncao SERIAL PRIMARY KEY,
    nomefuncao nome_padrao
);

-- 13) funcionarios = {codfuncionario, nomefuncionario, numerocasa, codrua, codbairro, codcep, codcidade, codfuncao, salario, codloja}
CREATE TABLE funcionario (
    codfuncionario SERIAL PRIMARY KEY,
    nomefuncionario nome_padrao,
    numerocasa VARCHAR(10),

    codrua INT,
    CONSTRAINT fk_funcionario_rua
        FOREIGN KEY (codrua)
        REFERENCES rua(codrua)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codbairro INT,
    CONSTRAINT fk_funcionario_bairro
        FOREIGN KEY (codbairro)
        REFERENCES bairro(codbairro)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codcep INT,
    CONSTRAINT fk_funcionario_cep
        FOREIGN KEY (codcep)
        REFERENCES cep(codcep)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codcidade INT,
    CONSTRAINT fk_funcionario_cidade
        FOREIGN KEY (codcidade)
        REFERENCES cidade(codcidade)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codfuncao INT,
    CONSTRAINT fk_funcionario_funcao
        FOREIGN KEY (codfuncao)
        REFERENCES funcao(codfuncao)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    salario DECIMAL(10,2) NOT NULL,
    
    codloja INT,
    CONSTRAINT fk_funcionario_loja
        FOREIGN KEY (codloja)
        REFERENCES loja(codloja)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- 15) itenstelefonefuncionario = {codfuncionario, codtelefone}
CREATE TABLE itenstelefonefuncionario (
    codfuncionario INT,
    CONSTRAINT fk_itenstelefonefuncionario_funcionario
        FOREIGN KEY (codfuncionario)
        REFERENCES funcionario(codfuncionario)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    
    codtelefone INT,
    CONSTRAINT fk_itenstelefonefuncionario_telefone
        FOREIGN KEY (codtelefone)
        REFERENCES telefone(codtelefone)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    PRIMARY KEY (codfuncionario, codtelefone)
);

-- 16) login = {codlogin, usuario, senha, codfuncionario}
CREATE TABLE login (
    codlogin SERIAL PRIMARY KEY,
    usuario nome_padrao UNIQUE,
    senha VARCHAR(255) NOT NULL,

    codfuncionario INT,
    CONSTRAINT fk_login_funcionario
        FOREIGN KEY (codfuncionario)
        REFERENCES funcionario(codfuncionario)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 17) controlelogsistema = {codcontrole, codlogin, data, hora}
CREATE TABLE controlelogsistema (
    codcontrole SERIAL PRIMARY KEY,

    codlogin INT,
    CONSTRAINT fk_controlelogsistema_login
        FOREIGN KEY (codlogin)
        REFERENCES login(codlogin)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    
    data DATE NOT NULL DEFAULT CURRENT_DATE,
    hora TIME NOT NULL DEFAULT CURRENT_TIME
);

-- 18) acesso = {codacesso, nomeacesso}
CREATE TABLE acesso (
    codacesso SERIAL PRIMARY KEY,
    nomeacesso nome_padrao
);

-- 19) itensacessologin = {codacesso, codlogin}
CREATE TABLE itensacessologin (
    codacesso INT,
    CONSTRAINT fk_itensacessologin_acesso
        FOREIGN KEY (codacesso)
        REFERENCES acesso(codacesso)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codlogin INT,
    CONSTRAINT fk_itensacessologin_login
        FOREIGN KEY (codlogin)
        REFERENCES login(codlogin)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    PRIMARY KEY (codacesso, codlogin)
);

-- 21) itenstelefoneloja = {codloja, codtelefone}
CREATE TABLE itenstelefoneloja (
    codloja INT,
    CONSTRAINT fk_itenstelefoneloja_loja
        FOREIGN KEY (codloja)
        REFERENCES loja(codloja)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codtelefone INT,
    CONSTRAINT fk_itenstelefoneloja_telefone
        FOREIGN KEY (codtelefone)
        REFERENCES telefone(codtelefone)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    PRIMARY KEY (codloja, codtelefone)
);

-- 23) marca = {codmarca, nomemarca}
CREATE TABLE marca (
    codmarca SERIAL PRIMARY KEY,
    nomemarca nome_padrao
);

-- 24) tipo = {codtipo, nometipo}
CREATE TABLE tipo (
    codtipo SERIAL PRIMARY KEY,
    nometipo nome_padrao
);

-- 22) produto = {codproduto, nomeproduto, quantidade, valor, codmarca, codtipo}
CREATE TABLE produto (
    codproduto SERIAL PRIMARY KEY,
    nomeproduto nome_padrao,
    quantidade DECIMAL(10,2) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,

    codmarca INT,
    CONSTRAINT fk_produto_marca
        FOREIGN KEY (codmarca)
        REFERENCES marca(codmarca)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codtipo INT,
    CONSTRAINT fk_produto_tipo
        FOREIGN KEY (codtipo)
        REFERENCES tipo(codtipo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 25) fornecedor = {codfornecedor, nomefornecedor, numerocasa, codrua, codbairro, codcep, codcidade}
CREATE TABLE fornecedor (
    codfornecedor SERIAL PRIMARY KEY,
    nomefornecedor nome_padrao,
    numerocasa VARCHAR(10),

    codrua INT,
    CONSTRAINT fk_fornecedor_rua
        FOREIGN KEY (codrua)
        REFERENCES rua(codrua)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codbairro INT,
    CONSTRAINT fk_fornecedor_bairro
        FOREIGN KEY (codbairro)
        REFERENCES bairro(codbairro)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codcep INT,
    CONSTRAINT fk_fornecedor_cep
        FOREIGN KEY (codcep)
        REFERENCES cep(codcep)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codcidade INT,
    CONSTRAINT fk_fornecedor_cidade
        FOREIGN KEY (codcidade)
        REFERENCES cidade(codcidade)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 26) itenstelefonefornecedor = {codtelefone, codfornecedor}
CREATE TABLE itenstelefonefornecedor (
    codtelefone INT,
    CONSTRAINT fk_itenstelefonefornecedor_telefone
        FOREIGN KEY (codtelefone)
        REFERENCES telefone(codtelefone)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codfornecedor INT,
    CONSTRAINT fk_itenstelefonefornecedor_fornecedor
        FOREIGN KEY (codfornecedor)
        REFERENCES fornecedor(codfornecedor)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    PRIMARY KEY (codtelefone, codfornecedor)
);

-- 27) compraproduto = {codcompra, datacompra, codfornecedor, codfuncionario}
CREATE TABLE compraproduto (
    codcompra SERIAL PRIMARY KEY,
    datacompra DATE,
    codfornecedor INT,
    CONSTRAINT fk_compraproduto_fornecedor
        FOREIGN KEY (codfornecedor)
        REFERENCES fornecedor(codfornecedor)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    
    codfuncionario INT,
    CONSTRAINT fk_compraproduto_funcionario
        FOREIGN KEY (codfuncionario)
        REFERENCES funcionario(codfuncionario)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 28) itenscompraproduto = {codcompra, codproduto, quantidade, valorc}
CREATE TABLE itenscompraproduto (
    codcompra INT,
    CONSTRAINT fk_itenscompraproduto_compra
        FOREIGN KEY (codcompra)
        REFERENCES compraproduto(codcompra)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codproduto INT,
    CONSTRAINT fk_itenscompraproduto_produto
        FOREIGN KEY (codproduto)
        REFERENCES produto(codproduto)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    quantidade DECIMAL(10,2) NOT NULL,
    valorc DECIMAL(10,2) NOT NULL,

    PRIMARY KEY (codcompra, codproduto)
);

-- 30) situacao = {codsituacao, nomesituacao}
CREATE TABLE situacao (
    codsituacao SERIAL PRIMARY KEY,
    nomesituacao nome_padrao
);

-- 29) parcelacompra = {codparcelacompra, datavencimento, valor, codsituacao, codcompra}
CREATE TABLE parcelacompra (
    codparcelacompra SERIAL PRIMARY KEY,
    datavencimento DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,

    codsituacao INT,
    CONSTRAINT fk_parcelacompra_situacao
        FOREIGN KEY (codsituacao)
        REFERENCES situacao(codsituacao)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codcompra INT,
    CONSTRAINT fk_parcelacompra_compra
        FOREIGN KEY (codcompra)
        REFERENCES compraproduto(codcompra)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 31) vendaproduto = {codvenda, datavenda, codcliente, codfuncionario}
CREATE TABLE vendaproduto (
    codvenda SERIAL PRIMARY KEY,
    datavenda DATE NOT NULL,

    codcliente INT,
    CONSTRAINT fk_vendaproduto_cliente
        FOREIGN KEY (codcliente)
        REFERENCES cliente(codcliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codfuncionario INT,
    CONSTRAINT fk_vendaproduto_funcionario
        FOREIGN KEY (codfuncionario)
        REFERENCES funcionario(codfuncionario)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 32) itensvendaproduto = {codvenda, codproduto, quantidade, valor}
CREATE TABLE itensvendaproduto (
    codvenda INT,
    CONSTRAINT fk_itensvendaproduto_venda
        FOREIGN KEY (codvenda)
        REFERENCES vendaproduto(codvenda)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codproduto INT,
    CONSTRAINT fk_itensvendaproduto_produto
        FOREIGN KEY (codproduto)
        REFERENCES produto(codproduto)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    quantidade DECIMAL(10,2) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,

    PRIMARY KEY (codvenda, codproduto)
);

-- 33) parcelavenda = {codparcela, datavencimento, valor, codsituacao, codvenda}
CREATE TABLE parcelavenda (
    codparcela SERIAL PRIMARY KEY,
    datavencimento DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,

    codsituacao INT,
    CONSTRAINT fk_parcelavenda_situacao
        FOREIGN KEY (codsituacao)
        REFERENCES situacao(codsituacao)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    codvenda INT,
    CONSTRAINT fk_parcelavenda_venda
        FOREIGN KEY (codvenda)
        REFERENCES vendaproduto(codvenda)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 34) imagens = {codimagens, imagem, descricao, codproduto}
CREATE TABLE imagem (
    codimagem SERIAL PRIMARY KEY,
    imagem BYTEA NOT NULL,
    descricao TEXT NOT NULL,

    codproduto INT,
    CONSTRAINT fk_imagens_produto
        FOREIGN KEY (codproduto)
        REFERENCES produto(codproduto)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);