USE DB_MYRH
GO

CREATE TABLE TB_AREAS(
	ID INT NOT NULL IDENTITY(1,1),
	DESCRICAO VARCHAR(100) NOT NULL,
	PRIMARY KEY(ID)
)
GO

CREATE TABLE TB_CARGOS(
	ID INT NOT NULL IDENTITY(1,1),
	ID_AREA INT NOT NULL,
	DESCRICAO VARCHAR(100) NOT NULL,
	SALARIO FLOAT NOT NULL,
	TP_SALARIO SMALLINT NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY(ID_AREA) REFERENCES TB_AREAS(ID),
	CHECK(SALARIO > 0),
	CHECK (TP_SALARIO = 1 OR TP_SALARIO = 2) --1: MENSAL, 2: POR HORA
)
GO

CREATE TABLE TB_CANDIDATOS(
	CPF VARCHAR(11) NOT NULL,
	NOME VARCHAR(100) NOT NULL,
	TELEFONE VARCHAR(20) NOT NULL,
	EMAIL VARCHAR(100) NOT NULL UNIQUE,
	PRIMARY KEY(CPF), --O CPF POR SER CHAVE PRIM�RIA, J� SER� UM CAMPO �NICO
	CHECK(LEN(CPF)= 11)
)
GO

CREATE TABLE TB_INSCRICOES (
	ID INT NOT NULL IDENTITY(1,1),
	ID_CARGO INT NOT NULL,
	CPF VARCHAR(11) NOT NULL,
	SITUACAO SMALLINT DEFAULT 1,
	DATA_INSCRICAO DATETIME NOT NULL,
	DATA_EFETIVACAO DATETIME,
	PRIMARY KEY(ID),
	FOREIGN KEY(ID_CARGO) REFERENCES TB_CARGOS(ID),
	FOREIGN KEY(CPF) REFERENCES TB_CANDIDATOS(CPF),
	CHECK(SITUACAO BETWEEN 1 AND 3), --1: RECEM INSCRITO, 2: CONTRATADO, 3: EFETIVADO
	UNIQUE(ID_CARGO, CPF)
)
GO