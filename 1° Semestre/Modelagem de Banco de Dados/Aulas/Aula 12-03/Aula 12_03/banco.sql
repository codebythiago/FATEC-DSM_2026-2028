-- cidade = {codcidade, nomecidade}

CREATE TABLE cidade(
    codcidade serial PRIMARY KEY,
    nomecidade varchar(100) NOT NULL UNIQUE
);
 -- nome_campo <tipo_campo> <restrições>
 
 -- bairro = {codbairro, nomebairro}

 CREATE TABLE bairro(
    codbairro serial PRIMARY KEY,
    nomebairro varchar(100) NOT NULL UNIQUE
 );