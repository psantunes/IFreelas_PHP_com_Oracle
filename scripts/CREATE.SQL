-- Gerado por Oracle SQL Developer Data Modeler 19.2.0.182.1216
-- em: 2019-11-10 18:34:58 BRST
-- customizado por Antonio Paulo Serpa Antunes e Jefferson Ribeiro de Souza

-- SISTEMA POSSUI 10 TABELAS. AS 5 PRIMEIRAS SÃO SIMPLES

CREATE TABLE campus (
    id_campus      NUMBER NOT NULL CONSTRAINT PK_campus PRIMARY KEY,
    nome_campus   VARCHAR2(50) NOT NULL
);

CREATE TABLE cliente (
    id_cliente          NUMBER NOT NULL CONSTRAINT PK_cliente primary key,
    nome_responsavel   VARCHAR2(100) NOT NULL,
    razao_social       VARCHAR2(100),
    email              VARCHAR2(75) NOT NULL,
    telefone           VARCHAR2(18) NOT NULL,
    senha              VARCHAR2(25) NOT NULL
);

CREATE TABLE habilidades (
    id_habilidade   NUMBER NOT NULL CONSTRAINT PK_habilidades PRIMARY KEY,
    habilidade     VARCHAR2(50) NOT NULL,
    publica        CHAR(1) NOT NULL
);

CREATE TABLE regiao (
    id_regiao   NUMBER NOT NULL CONSTRAINT PK_regiao PRIMARY KEY,
    regiao     VARCHAR2(50) NOT NULL
);

CREATE TABLE idiomas (
    id_idioma   NUMBER NOT NULL CONSTRAINT PK_idiomas PRIMARY KEY,
    nome_idioma     VARCHAR2(25) NOT NULL
);

-- CRIA AS 5 TABELAS COM CHAVES ESTRANGEIRAS

CREATE TABLE curso (
    id_curso           NUMBER NOT NULL CONSTRAINT PK_curso PRIMARY KEY,
    nome_curso        VARCHAR2(50) NOT NULL,
    id_campus          NUMBER NOT NULL,
    CONSTRAINT FK_campus_idcampus FOREIGN KEY ( id_campus ) REFERENCES campus
);

CREATE TABLE prof (
    id_prof              NUMBER NOT NULL CONSTRAINT PK_prof PRIMARY KEY,
    nome                 VARCHAR2(100) NOT NULL,
    email                VARCHAR2(75) NOT NULL,
    telefone             VARCHAR2(18) NOT NULL,
    descricao            VARCHAR2(1000) NOT NULL,
    avatar               VARCHAR2(100),
    experiencia_1        VARCHAR2(75),
    experiencia_desc_1   VARCHAR2(750),
    experiencia_2        VARCHAR2(75),
    experiencia_desc_2   VARCHAR2(750),
    experiencia_3        VARCHAR2(75),
    experiencia_desc_3   VARCHAR2(750),
    linkedin             VARCHAR2(100),
    website              VARCHAR2(100),
    horarios             VARCHAR2(75),
    tipo_trabalho        VARCHAR2(50),
    senha                VARCHAR2(25) NOT NULL,
    semestre             NUMBER NOT NULL,
    id_curso             NUMBER NOT NULL,
    CONSTRAINT FK_curso_id_curso FOREIGN KEY ( id_curso ) REFERENCES curso
);

CREATE TABLE habilidade_prof (
    id_habilidade   NUMBER NOT NULL,
    id_prof         NUMBER NOT NULL,
	CONSTRAINT PK_habilidade_prof primary key(id_habilidade, id_prof),
	CONSTRAINT FK_h_prof_idprof foreign key ( id_prof ) references prof,
	CONSTRAINT FK_habilidade_idhabilidade foreign key ( id_habilidade ) references habilidades
	);

CREATE TABLE idioma_prof (
    id_idioma      NUMBER NOT NULL,
    id_prof        NUMBER NOT NULL,
    nivel          VARCHAR2(15) NOT NULL,
	CONSTRAINT PK_idioma_prof primary key(id_idioma, id_prof),
	CONSTRAINT FK_idiomas_id_idioma FOREIGN KEY ( id_idioma ) REFERENCES idiomas,
	CONSTRAINT FK_i_prof_id_prof FOREIGN KEY ( id_prof ) REFERENCES prof
);
 
CREATE TABLE regiao_prof (
    id_regiao   	NUMBER NOT NULL,
    id_prof			NUMBER NOT NULL,
	CONSTRAINT PK_regiao_prof primary key(id_regiao, id_prof),
	CONSTRAINT FK_regiao_id_regiao FOREIGN KEY ( id_regiao ) REFERENCES regiao,
	CONSTRAINT FK_r_prof_id_prof FOREIGN KEY ( id_prof ) REFERENCES prof
);

-- CRIA 7 SEQUENCES

CREATE SEQUENCE scampus NOCACHE;

CREATE SEQUENCE scliente NOCACHE;

CREATE SEQUENCE shabilidades NOCACHE;

CREATE SEQUENCE sregiao NOCACHE;

CREATE SEQUENCE sidiomas NOCACHE;

CREATE SEQUENCE scurso NOCACHE;

CREATE SEQUENCE sprof NOCACHE;

--FIM DO ARQUIVO CREATE