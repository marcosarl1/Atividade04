DROP DATABASE IF EXISTS hospital_db_marcosaurelio;

CREATE DATABASE hospital_db_marcosaurelio;

USE hospital_db_marcosaurelio;


CREATE TABLE especialidades(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(45) NOT NULL
);

CREATE TABLE medicos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(80) NOT NULL,
	data_de_nascimento DATE NOT NULL,
    cpf VARCHAR(14) NOT NULL,
	crm VARCHAR(35) NOT NULL,
	uf_crm VARCHAR(2) NOT NULL,
	telefone VARCHAR(15) NOT NULL,
	endereco VARCHAR(250) NOT NULL
);

CREATE TABLE medicos_especialidades(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	medico_id INT NOT NULL,
	especialidade_id INT NOT NULL,
	FOREIGN KEY (medico_id) REFERENCES medicos(id),
	FOREIGN KEY (especialidade_id) REFERENCES especialidades(id)
);

CREATE TABLE convenios(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(80) NOT NULL,
	cnpj VARCHAR(18) NOT NULL,
	tempo_de_carencia INT(3) NOT NULL
);


CREATE TABLE pacientes(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(80) NOT NULL,
	data_de_nascimento DATE NOT NULL,
	endereco VARCHAR(250) NOT NULL,
	telefone VARCHAR(15) NOT NULL,
	email VARCHAR(120) NOT NULL,
	cpf VARCHAR(14) NOT NULL,
	rg VARCHAR(13) NOT NULL,
	convenio_id INT,
    carteira_convenio VARCHAR(25),
	FOREIGN KEY (convenio_id) REFERENCES convenios(id)
);

CREATE TABLE consultas(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	datahora DATETIME,
    medico_id INT NOT NULL,
    paciente_id INT NOT NULL,
	valor_consulta DECIMAL(7,2) NOT NULL,
	medico_especialidade_id INT NOT NULL,
	FOREIGN KEY (medico_id) REFERENCES medicos(id),
	FOREIGN KEY (paciente_id) REFERENCES pacientes(id),
	FOREIGN KEY (medico_especialidade_id) REFERENCES medicos_especialidades(id)
);

CREATE TABLE receitas(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	instrucoes VARCHAR(600) NOT NULL,
	consulta_id INT NOT NULL, 
	FOREIGN KEY (consulta_id) REFERENCES consultas(id)
);

CREATE TABLE tipoquartos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(60) NOT NULL,
    valor_diaria DECIMAL(7,2) NOT NULL
);

CREATE TABLE quartos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	numero INT(10) NOT NULL,
    tipoquartos_id INT NOT NULL,
    FOREIGN KEY (tipoquartos_id) references tipoquartos(id)
);

CREATE TABLE internacoes(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	paciente_id INT NOT NULL,
	medico_id INT NOT NULL,
	data_entrada DATE NOT NULL,
	data_prev_alta DATE NOT NULL,
	data_alta DATE,
	procedimento VARCHAR(600) NOT NULL,
    quarto_id INT NOT NULL,
    FOREIGN KEY (quarto_id) REFERENCES quartos(id),
	FOREIGN KEY (medico_id) REFERENCES medicos(id),
	FOREIGN KEY (paciente_id) REFERENCES pacientes(id)
);

CREATE TABLE enfermeiros(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    cpf VARCHAR(12) NOT NULL,
    cre VARCHAR(6) NOT NULL
);

CREATE TABLE internacoes_enfermeiros(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	internacao_id INT NOT NULL,
    enfermeiro_id INT NOT NULL,
    FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiros(id),
    FOREIGN KEY (internacao_id) REFERENCES internacoes(id)
);

show tables

