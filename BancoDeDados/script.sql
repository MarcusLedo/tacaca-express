CREATE DATABASE IF NOT EXISTS tacaca_express;

CREATE TABLE IF NOT EXISTS Unidade (
	filial INT AUTO_INCREMENT NOT NULL, /*não precisa ser declarado no insert (autoIncrement)*/
	nome VARCHAR(80) NOT NULL,
	tipo INT NOT NULL,
    ocupacaoTipo INT NOT NULL,
	cnpj CHAR(14) NOT NULL,
	instalacao INT,
    
	FOREIGN KEY (tipo) REFERENCES UnidadeTipo(id),
	FOREIGN KEY (ocupacaoTipo) REFERENCES UnidadeOcupacaoTipo(id),

	PRIMARY KEY (filial)
);

CREATE TABLE IF NOT EXISTS UnidadeTipo (
	id INT AUTO_INCREMENT NOT NULL,
	tipo VARCHAR(25) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Telefone (
	id INT AUTO_INCREMENT NOT NULL,
	filial INT NOT NULL,
	ddd CHAR(2) NOT NULL,
	telefone CHAR(9) NOT NULL,
    
    FOREIGN KEY (filial) REFERENCES Unidade(filial),
    
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Email (
	id INT AUTO_INCREMENT NOT NULL,
	filial INT,
	email VARCHAR(100) NOT NULL,
	rotuloEmail VARCHAR(80) NOT NULL,
    
	FOREIGN KEY (filial) REFERENCES Unidade(filial),
    
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Funcionario (
	matricula INT AUTO_INCREMENT NOT NULL,
	nome VARCHAR(80) NOT NULL,
	genero CHAR(1) NOT NULL,
	email VARCHAR(100) NOT NULL,
	ddd CHAR(2) NOT NULL,
	celular CHAR(9) NOT NULL,
	cpf CHAR(11) NOT NULL,
	filiacaoPai VARCHAR(80) ,
	filiacaoMae VARCHAR(80) ,
	logradouro VARCHAR(80) NOT NULL,
	numero VARCHAR(5) NOT NULL,
	complemento VARCHAR(25) NOT NULL,
	bairro VARCHAR(25) NOT NULL,
	municipio VARCHAR(50) NOT NULL,
	uf CHAR(2) NOT NULL,
	cep CHAR(8) NOT NULL,
	admissao DATE NOT NULL,
	nascimento DATE NOT NULL,
	estadoCivil INT,
	filhos TINYINT NOT NULL,
	pcd BOOL NOT NULL,
	planoSaude BOOL NOT NULL,
	categoriaHabilitacao CHAR(2),
    
	FOREIGN KEY (estadoCivil) REFERENCES EstadoCivil(id),
    
	PRIMARY KEY (matricula)
);

CREATE TABLE IF NOT EXISTS UnidadeInstalacao (
	id INT AUTO_INCREMENT NOT NULL,
    filial INT NOT NULL,
	dataInicio DATE NOT NULL,
	dataFim DATE NOT NULL,
	logradouro VARCHAR(80) NOT NULL,
	numero VARCHAR(5) NOT NULL,
	bairro VARCHAR(25) NOT NULL,
	municipio VARCHAR(50) NOT NULL,
	uf CHAR(2) NOT NULL,
	cep CHAR(8) NOT NULL,
	ocupacao INT(4) NOT NULL,
    
	FOREIGN KEY (filial) REFERENCES Unidade(filial),
    
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Cargo (
	id INT AUTO_INCREMENT NOT NULL,
	nome VARCHAR(25) NOT NULL,
	salario DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Carreira(
	id INT AUTO_INCREMENT NOT NULL,
	cargo INT NOT NULL,
    dataInicio DATE NOT NULL,
    dataFim DATE,
    
    FOREIGN KEY (cargo) REFERENCES Cargo(id),
    
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS UnidadeOcupacaoTipo (
	id INT AUTO_INCREMENT NOT NULL,
	tipo VARCHAR(25) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS DespesaTipo (
	id INT AUTO_INCREMENT NOT NULL,
	tipo VARCHAR(80) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ContratoServico (
	id INT AUTO_INCREMENT NOT NULL,
	natureza VARCHAR(100),
	fornecedor INT NOT NULL,
	filial INT NOT NULL,
	dataInicio DATE NOT NULL,
	dataFim DATE,
	pagamentoMensal DECIMAL(10,2) NOT NULL,
    
    FOREIGN KEY (fornecedor) REFERENCES Fornecedor(id),
    FOREIGN KEY (filial) REFERENCES Unidade(filial),
    
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Fornecedor (
	id INT AUTO_INCREMENT NOT NULL,
	cnpj CHAR(14) NOT NULL,
	nome VARCHAR(80) NOT NULL,
	ddd CHAR(2) ,
	telefone CHAR(9) ,
	email VARCHAR(80) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS EstadoCivil (
	id INT AUTO_INCREMENT NOT NULL,
	sigla CHAR(1) UNIQUE,
	definicao VARCHAR(20) NOT NULL,
    
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS NaturezaInformacao (
	id INT AUTO_INCREMENT NOT NULL,
	tipo CHAR(1) UNIQUE,
	denominacao VARCHAR(20) NOT NULL,
	PRIMARY KEY (id)
);
