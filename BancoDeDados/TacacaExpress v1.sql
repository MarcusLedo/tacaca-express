CREATE DATABASE IF NOT EXISTS tacaca_express;

USE tacaca_express;

CREATE TABLE IF NOT EXISTS Address (
	id INT AUTO_INCREMENT NOT NULL,
	address VARCHAR(50) NOT NULL,
	number_address VARCHAR(5) NOT NULL,
	address_line2 VARCHAR(25),
    borough VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state CHAR(2) NOT NULL,
    postal_code CHAR(8) NOT NULL,
    
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Information_Type (
	id INT AUTO_INCREMENT NOT NULL,
	information_type CHAR(1) UNIQUE,
	description VARCHAR(20) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Marital_Status (
	id INT AUTO_INCREMENT NOT NULL,
	acronym CHAR(1) UNIQUE,
	acronym_description VARCHAR(20) NOT NULL,
    
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Provider (
	id INT AUTO_INCREMENT NOT NULL,
	companies_house_id CHAR(14) NOT NULL,
	name_provider VARCHAR(80) NOT NULL,
	area_code CHAR(2) ,
	phone CHAR(9) ,
	email VARCHAR(80) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Expenditure_Type (
	id INT AUTO_INCREMENT NOT NULL,
	expenditure_type VARCHAR(80) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Unity_Expenditure (
	id INT AUTO_INCREMENT NOT NULL,
    reference_date DATE NOT NULL,
    expenditure_value DECIMAL(10,2) NOT NULL,
    expenditure_type INT NOT NULL,
    
    FOREIGN KEY (expenditure_type) REFERENCES Expenditure_Type(id),

	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Premise_Type (
	id INT AUTO_INCREMENT NOT NULL,
	type_premise VARCHAR(25) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Position_Title (
	id INT AUTO_INCREMENT NOT NULL,
	position_title VARCHAR(25) NOT NULL,
	salary DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Unity_Type (
	id INT AUTO_INCREMENT NOT NULL,
	type_unity VARCHAR(25) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Unity (
	id INT AUTO_INCREMENT NOT NULL, /*não precisa ser declarado no insert (autoIncrement)*/
	name_unity VARCHAR(80) NOT NULL,
	type_unity INT NOT NULL,
	companies_house_id  CHAR(14) NOT NULL,
	active_unity BOOL,
    
	FOREIGN KEY (type_unity) REFERENCES Unity_Type(id),

	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Phone (
	id INT AUTO_INCREMENT NOT NULL,
	unity INT NOT NULL,
	area_code CHAR(2) NOT NULL,
	phone CHAR(9) NOT NULL,
    
    FOREIGN KEY (unity) REFERENCES Unity(id),
    
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Email (
	id INT AUTO_INCREMENT NOT NULL,
	unity INT,
	email VARCHAR(100) NOT NULL,
	label VARCHAR(80) NOT NULL,
    
	FOREIGN KEY (unity) REFERENCES Unity(id),
    
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Employee (
	id INT AUTO_INCREMENT NOT NULL,
	employee_name VARCHAR(80) NOT NULL,
	gender CHAR(1) NOT NULL,
	email VARCHAR(100) NOT NULL,
	area_code CHAR(2) NOT NULL,
	mobile CHAR(9) NOT NULL,
	insurance_number CHAR(11) NOT NULL,
	father_name VARCHAR(80) ,
	mother_name VARCHAR(80) ,
	hiring_date DATE NOT NULL,
    dismissal_date DATE,
	birth_date DATE NOT NULL,
	marital_status INT,
	children INT NOT NULL,
	disabled_person BOOL NOT NULL,
	health_plan BOOL NOT NULL,
	driver_license_type CHAR(2),
    address INT NOT NULL,
    
	FOREIGN KEY (marital_status) REFERENCES Marital_Status(id),
	FOREIGN KEY (address) REFERENCES Address(id),

    
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Career (
	id INT AUTO_INCREMENT NOT NULL,
    employee_id INT NOT NULL,
	position_title INT NOT NULL,
    unity INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,

	FOREIGN KEY (employee_id) REFERENCES Employee(id),
    FOREIGN KEY (position_title) REFERENCES Position_Title(id),
	FOREIGN KEY (unity) REFERENCES Unity(id),
    
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Unity_Premise (
	id INT AUTO_INCREMENT NOT NULL,
    unity INT NOT NULL,
    start_date DATE NOT NULL,
	end_date DATE,
	premise_type INT NOT NULL,
    address INT NOT NULL,
    
	FOREIGN KEY (unity) REFERENCES Unity(id),
    FOREIGN KEY (address) REFERENCES Address(id),
    
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Outsourcing (
	id INT AUTO_INCREMENT NOT NULL,
	expenditure_type INT NOT NULL,
	provider INT NOT NULL,
	unity INT NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE,
	due_payment DECIMAL(10,2) NOT NULL,
    
    FOREIGN KEY (expenditure_type) REFERENCES Expenditure_Type(id),
    FOREIGN KEY (provider) REFERENCES Provider(id),
    FOREIGN KEY (unity) REFERENCES Unity(id),
    
	PRIMARY KEY (id)
);