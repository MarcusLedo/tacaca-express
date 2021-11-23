-- Requisitos do Trabalho - Entrega III --

/*

O projeto 03 deve ser desenvolvido em: um novo SGBD, a escolha da equipe, utilizando o mesmo script do projeto 02. 

SGBD: MICROSOFT SQL SERVER

O trabalho deve conter, no m�nimo:

L066	update
L789	e delete de tabelas
L792	e banco; 
L772	update
L777	e delete de itens da tabela;
L061	altera��es nos campos da tabela:
L785	exclus�o de campos,
L772	atualiza��o...
L709	incluir index;
L766	view;
L719	commit
L727	e rollback;
L733	grant
L734	e revoke;
L753	store procedure
L764	e/ou function;
L736	trigger.

*/

-- Cria��o do Banco de Dados --

CREATE DATABASE [tacaca_express]
ON (NAME = 'tacaca.DAT',
	FILENAME = 'C:\TACACA\tacaca.MDF',
	SIZE = 200MB,
	MAXSIZE = 1024MB,
	FILEGROWTH = 10MB)
LOG ON
(NAME = 'tacaca.LOG',
 FILENAME = 'C:\TACACA\tacaca.LDF',
 SIZE = 10MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 10MB);

USE [tacaca_express];

-- CRIA��O DAS TABELAS --

CREATE TABLE Address_Catalog (
	id INT NOT NULL IDENTITY(1,1),
	address_line1 VARCHAR(80),
	number_address VARCHAR(5) NOT NULL,
	address_line2 VARCHAR(25),
	borough VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	state_initials CHAR(2) NOT NULL,
	postal_code CHAR(8) NOT NULL,
);

/* Altera��o de Atributo de Endere�o */
ALTER TABLE [Address_Catalog]
ALTER COLUMN [address_line1]
VARCHAR(50) NOT NULL;

/* Inclus�o de Chave Prim�ria em Endere�o */
ALTER TABLE [Address_Catalog]
ADD CONSTRAINT PK_id
PRIMARY KEY CLUSTERED ([id]);

CREATE TABLE Info_Type (
	id INT NOT NULL IDENTITY(1,1),
	info_type CHAR(1) UNIQUE,
	descrip VARCHAR(20) NOT NULL,
	CONSTRAINT [PK_Info_Type] PRIMARY KEY CLUSTERED ([id])
);

CREATE TABLE Marital_Status (
	id INT NOT NULL IDENTITY(1,1),
	acronym CHAR(1) UNIQUE,
	acronym_description VARCHAR(20) NOT NULL,
	CONSTRAINT [PK_Marital_Status] PRIMARY KEY CLUSTERED ([id])
);

CREATE TABLE Provider (
	id INT NOT NULL IDENTITY(1,1),
	companies_house_id CHAR(14) NOT NULL,
	name_provider VARCHAR(80) NOT NULL,
	area_code CHAR(2) ,
	phone CHAR(9) ,
	email VARCHAR(80) NOT NULL,
	CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED ([id])
);

CREATE TABLE Expenditure_Type (
	id INT NOT NULL IDENTITY(1,1),
	expenditure_type VARCHAR(80) NOT NULL,
	CONSTRAINT [PK_Expenditure_Type] PRIMARY KEY CLUSTERED ([id])
);

CREATE TABLE Unity_Expenditure (
	id INT NOT NULL IDENTITY(1,1),
	reference_date DATE NOT NULL,
	expenditure_value DECIMAL(10,2) NOT NULL,
	expenditure_type INT NOT NULL,
	FOREIGN KEY (expenditure_type) REFERENCES Expenditure_Type(id),
	CONSTRAINT [PK_Unity_Expenditure] PRIMARY KEY CLUSTERED ([id])
);

CREATE TABLE Premise_Type (
	id INT NOT NULL IDENTITY(1,1),
	type_premise VARCHAR(25) NOT NULL,
	CONSTRAINT [PK_Premise_Type] PRIMARY KEY CLUSTERED ([id])
);

CREATE TABLE Position_Title (
	id INT NOT NULL IDENTITY(1,1),
	position_title VARCHAR(25) NOT NULL,
	salary DECIMAL(10,2) NOT NULL,
	CONSTRAINT [PK_Position_Title] PRIMARY KEY CLUSTERED ([id])
);

CREATE TABLE Unity_Type (
	id INT NOT NULL IDENTITY(1,1),
	type_unity VARCHAR(25) NOT NULL,
	CONSTRAINT [PK_Unity_Type] PRIMARY KEY CLUSTERED ([id])
);

CREATE TABLE Unity (
	id INT NOT NULL IDENTITY(1,1), /*n�o precisa ser declarado no insert (autoIncrement)*/
	name_unity VARCHAR(80) NOT NULL,
	type_unity INT NOT NULL,
	companies_house_id  CHAR(14) NOT NULL,
	active_unity TINYINT,
	FOREIGN KEY (type_unity) REFERENCES Unity_Type(id),
	CONSTRAINT [PK_Unity] PRIMARY KEY CLUSTERED ([id])
);

CREATE TABLE Phone (
	id INT NOT NULL IDENTITY(1,1),
	unity INT NOT NULL,
	area_code CHAR(2) NOT NULL,
	phone CHAR(9) NOT NULL,
	FOREIGN KEY (unity) REFERENCES Unity(id),
	CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED ([id])
);

CREATE TABLE Email (
	id INT NOT NULL IDENTITY(1,1),
	unity INT,
	email VARCHAR(100) NOT NULL,
	label VARCHAR(80) NOT NULL,
	FOREIGN KEY (unity) REFERENCES Unity(id),
	CONSTRAINT [PK_Email] PRIMARY KEY CLUSTERED ([id])
);

CREATE TABLE Employee (
	id INT NOT NULL IDENTITY(1,1),
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
	disabled_person TINYINT NOT NULL,
	health_plan TINYINT NOT NULL,
	driver_license_type CHAR(2),
	address_ref INT NOT NULL,
	FOREIGN KEY (marital_status) REFERENCES Marital_Status(id),
	FOREIGN KEY (address_ref) REFERENCES Address_Catalog(id),
	CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED ([id])
);

CREATE TABLE Career (
	id INT NOT NULL IDENTITY(1,1),
	employee_id INT NOT NULL,
	position_title INT NOT NULL,
	unity INT NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE,
	FOREIGN KEY (employee_id) REFERENCES Employee(id),
	FOREIGN KEY (position_title) REFERENCES Position_Title(id),
	FOREIGN KEY (unity) REFERENCES Unity(id),
	CONSTRAINT [PK_Career] PRIMARY KEY CLUSTERED ([id])
);

CREATE TABLE Unity_Premise (
	id INT NOT NULL IDENTITY(1,1),
	unity INT NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE,
	premise_type INT NOT NULL,
	address_ref INT NOT NULL,
	FOREIGN KEY (unity) REFERENCES Unity(id),
	FOREIGN KEY (address_ref) REFERENCES Address_Catalog(id),
	CONSTRAINT [PK_Unity_Premise] PRIMARY KEY CLUSTERED ([id])
);

CREATE TABLE Outsourcing (
	id INT NOT NULL IDENTITY(1,1),
	expenditure_type INT NOT NULL,
	provider INT NOT NULL,
	unity INT NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE,
	due_payment DECIMAL(10,2) NOT NULL,
	FOREIGN KEY (expenditure_type) REFERENCES Expenditure_Type(id),
	FOREIGN KEY (provider) REFERENCES Provider(id),
	FOREIGN KEY (unity) REFERENCES Unity(id),
	CONSTRAINT [PK_Outsourcing] PRIMARY KEY CLUSTERED ([id])
);

-- C�DIGOS DE INSER��O --

INSERT INTO Address_Catalog (address_line1, number_address, address_line2, borough, city, state_initials, postal_code)
VALUES
('Rua Ribamar Coelho', '15', NULL, 'Guam�', 'Bel�m', 'PA', '66023225'),
('Pra�a Cl�vis de Azevedo', '25', NULL, 'Mutum', 'Bel�m', 'PA', '66022115'),
('Rua Bel�m', '059', NULL,  'Centro',  'Ananindeua', 'PA', '66095265'),
('Avenida Bel�m', '458', NULL,  'Centro',  'Santar�m', 'PA', '66095345'),
('Alameda Abra�o Athias', '999', NULL,  'Jurunas',  'Bel�m', 'PA', '66085010'),
('Alameda Acatauassu Nunes', '628', NULL,  'Mangueir�o',  'Bel�m', 'PA', '66087010'),
('Passagem Acatauassu Nunes', '553', NULL,  'Mangueiras',  'Bel�m', 'PA', '66087050'),
('Passagem Ac�cia', '514', NULL,  'Maracacuera',  'Bel�m', 'PA', '66087190'),
('Passagem Alacid Nunes', '391', NULL,  'Maracaj�',  'Bel�m', 'PA', '66087200'),
('Rua Albatroz', '387', NULL,  'Maracangalha',  'Bel�m', 'PA', '66087660'),
('Vila Alexandre Bourbon', '376', NULL,  'Marah�',  'Bel�m', 'PA', '66093010'),
('Vila Alexandria', '340', NULL,  'Marambaia',  'Bel�m', 'PA', '66093020'),
('Travessa Alferes Costa', '315', NULL,  'Marco',  'Bel�m', 'PA', '66093031'),
('Rua Betim', '311', NULL,  'Miramar',  'Bel�m', 'PA', '66093032'),
('Avenida Almirante Barroso', '297', NULL,  'Montese (Terra Firme)',  'Bel�m', 'PA', '66093033'),
('Rua Bel�m', '291', NULL,  'Murubira',  'Bel�m', 'PA', '66093034'),
('Rua Ananindeua', '271', NULL,  'Natal do Murubira',  'Bel�m', 'PA', '66093570'),
('Rua Santar�m', '265', NULL,  'Nazar�',  'Bel�m', 'PA', '66093901'),
('Rua Marab�', '265', NULL,  'Paracuri',  'Bel�m', 'PA', '66093902'),
('Rua Parauapebas', '250', NULL,  'Para�so',  'Bel�m', 'PA', '66093903'),
('Rua Castanhal', '239', NULL,  'Parque Guajar�',  'Bel�m', 'PA', '66093904'),
('Rua Abaetetuba', '239', NULL,  'Parque Verde',  'Bel�m', 'PA', '66093905'),
('Rua Camet�', '220', NULL,  'Pedreira',  'Bel�m', 'PA', '66093906'),
('Rua Marituba', '208', NULL,  'Ponta Grossa',  'Bel�m', 'PA', '66093907'),
('Rua S�o F�lix do Xingu', '178', NULL,  'Porto Arthur',  'Bel�m', 'PA', '66093908'),
('Rua Bragan�a', '162', NULL,  'Praia Grande',  'Bel�m', 'PA', '66095010'),
('Rua Barcarena', '161', NULL,  'Pratinha',  'Bel�m', 'PA', '66095020'),
('Rua Altamira', '146', NULL,  'Reduto',  'Ananindeua', 'PA', '66095030'),
('Rua Tucuru�', '139', NULL,  'Sacramenta',  'Santar�m', 'PA', '66095225'),
('Rua Paragominas', '135', NULL,  'S�o Br�s',  'Marab�', 'PA', '66085010'),
('Rua Tail�ndia', '127', NULL,  'S�o Clemente',  'Parauapebas', 'PA', '66087010'),
('Rua Breves', '117', NULL,  'S�o Francisco',  'Castanhal', 'PA', '66087050'),
('Rua Itaituba', '113', NULL,  'S�o Jo�o de Outeiro',  'Abaetetuba', 'PA', '66087190'),
('Rua Reden��o', '110', NULL,  'Souza',  'Camet�', 'PA', '66087200'),
('Rua Moju', '106', NULL,  'Sucurijuquara',  'Marituba', 'PA', '66087660'),
('Rua Novo Repartimento', '103', NULL,  'Tapan�',  'S�o F�lix do Xingu', 'PA', '66093010'),
('Rua Santana do Araguaia', '102', NULL,  'Tel�grafo',  'Bragan�a', 'PA', '66093020'),
('Rua Oriximin�', '99', NULL,  'Tenon�',  'Barcarena', 'PA', '66093031'),
('Rua Santa Izabel do Par�', '98', NULL,  'Umarizal',  'Altamira', 'PA', '66093032'),
('Rua Capanema', '97', NULL,  'Una',  'Bel�m', 'PA', '66093033'),
('Conjunto Alvorada', '91', NULL,  'Universit�rio',  'Bel�m', 'PA', '66093034'),
('Passagem Amaral', '90', NULL,  'Val-de-C�es',  'Bel�m', 'PA', '66093570'),
('Alameda Amazonas Figueiredo', '90', NULL,  'Vila',  'Bel�m', 'PA', '66093901'),
('Alameda Abra�o Athias', '86', NULL,  'Aeroporto',  'Bel�m', 'PA', '66093902'),
('Alameda Acatauassu Nunes', '86', NULL,  '�gua Boa',  'Bel�m', 'PA', '66093903'),
('Passagem Acatauassu Nunes', '86', NULL,  '�guas Lindas',  'Bel�m', 'PA', '66093904'),
('Passagem Ac�cia', '80', NULL,  '�guas Negras',  'Bel�m', 'PA', '66093905'),
('Passagem Alacid Nunes', '73', NULL,  'Agulha',  'Bel�m', 'PA', '66093906'),
('Rua Albatroz', '72', NULL,  'Ariramba',  'Bel�m', 'PA', '66093907'),
('Vila Alexandre Bourbon', '71', NULL,  'Aur�',  'Bel�m', 'PA', '66093908'),
('Vila Alexandria', '68', NULL,  'Baia do Sol',  'Bel�m', 'PA', '66095010'),
('Travessa Alferes Costa', '66', NULL,  'Barreiro',  'Bel�m', 'PA', '66095020'),
('Rua Betim', '65', NULL,  'Batista Campos',  'Bel�m', 'PA', '66095030'),
('Avenida Almirante Barroso', '64', NULL,  'Bengu�',  'Bel�m', 'PA', '66095225'),
('Rua Bel�m', '63', NULL,  'Bonfim',  'Bel�m', 'PA', '66085010'),
('Rua Ananindeua', '61', NULL,  'Bras�lia',  'Ananindeua', 'PA', '66087010'),
('Rua Santar�m', '59', NULL,  'Cabanagem',  'Santar�m', 'PA', '66087050'),
('Rua Marab�', '57', NULL,  'Campina (Com�rcio)',  'Marab�', 'PA', '66087190'),
('Rua Parauapebas', '54', NULL,  'Campina de Icoaraci',  'Parauapebas', 'PA', '66087200'),
('Rua Castanhal', '53', NULL,  'Canudos',  'Castanhal', 'PA', '66087660'),
('Rua Abaetetuba', '51', NULL,  'Carananduba',  'Abaetetuba', 'PA', '66093010'),
('Rua Betim', '50', NULL,  'Caruara',  'Camet�', 'PA', '66093020'),
('Avenida Almirante Barroso', '50', NULL,  'Castanheira',  'Marituba', 'PA', '66093031'),
('Rua Bel�m', '49', NULL,  'Chap�u-Virado',  'S�o F�lix do Xingu', 'PA', '66093032'),
('Rua Ananindeua', '49', NULL,  'Cidade Velha',  'Bragan�a', 'PA', '66093033'),
('Rua Santar�m', '49', NULL,  'Condor',  'Barcarena', 'PA', '66093034'),
('Rua Marab�', '47', NULL,  'Coqueiro',  'Altamira', 'PA', '66093570'),
('Rua Parauapebas', '45', NULL,  'Crema��o',  'Bel�m', 'PA', '66093901'),
('Rua Castanhal', '45', NULL,  'Cruzeiro',  'Bel�m', 'PA', '66093902'),
('Rua Abaetetuba', '45', NULL,  'Aeroporto',  'Bel�m', 'PA', '66093903'),
('Rua Camet�', '45', NULL,  '�gua Boa',  'Bel�m', 'PA', '66093904'),
('Rua Marituba', '43', NULL,  '�guas Lindas',  'Bel�m', 'PA', '66093905'),
('Rua S�o F�lix do Xingu', '42', NULL,  '�guas Negras',  'Ananindeua', 'PA', '66093906'),
('Rua Bragan�a', '42', NULL,  'Agulha',  'Santar�m', 'PA', '66093907'),
('Rua Barcarena', '41', NULL,  'Ariramba',  'Marab�', 'PA', '66093908'),
('Rua Altamira', '40', NULL,  'Aur�',  'Parauapebas', 'PA', '66095010'),
('Rua Tucuru�', '38', NULL,  'Baia do Sol',  'Castanhal', 'PA', '66095020'),
('Rua Paragominas', '38', NULL,  'Barreiro',  'Abaetetuba', 'PA', '66095030'),
('Rua Tail�ndia', '36', NULL,  'Batista Campos',  'Camet�', 'PA', '66095225'),
('Rua Breves', '36', NULL,  'Bengu�',  'Marituba', 'PA', '66085010'),
('Rua Itaituba', '35', NULL,  'Bonfim',  'S�o F�lix do Xingu', 'PA', '66087010'),
('Rua Reden��o', '35', NULL,  'Bras�lia',  'Bragan�a', 'PA', '66087050'),
('Rua Moju', '34', NULL,  'Cabanagem',  'Barcarena', 'PA', '66087190'),
('Rua Novo Repartimento', '34', NULL,  'Campina (Com�rcio)',  'Altamira', 'PA', '66087200'),
('Rua Santana do Araguaia', '34', NULL,  'Campina de Icoaraci',  'Ananindeua', 'PA', '66087660'),
('Rua Oriximin�', '34', NULL,  'Canudos',  'Santar�m', 'PA', '66093010'),
('Rua Santa Izabel do Par�', '34', NULL,  'Carananduba',  'Marab�', 'PA', '66093020'),
('Rua Capanema', '33', NULL,  'Caruara',  'Parauapebas', 'PA', '66093031'),
('Rua Tucuru�', '33', NULL,  'Castanheira',  'Castanhal', 'PA', '66093032'),
('Rua Paragominas', '33', NULL,  'Chap�u-Virado',  'Abaetetuba', 'PA', '66093033'),
('Rua Tail�ndia', '32', NULL,  'Cidade Velha',  'Camet�', 'PA', '66093034'),
('Rua Breves', '32', NULL,  'Condor',  'Marituba', 'PA', '66093570'),
('Rua Itaituba', '31', NULL,  'Coqueiro',  'S�o F�lix do Xingu', 'PA', '66093901'),
('Rua Reden��o', '31', NULL,  'Crema��o',  'Bragan�a', 'PA', '66093902'),
('Rua Moju', '28', NULL,  'Cruzeiro',  'Barcarena', 'PA', '66093903'),
('Rua Novo Repartimento', '27', NULL,  'Curi�-Utinga',  'Altamira', 'PA', '66093904'),
('Rua Santana do Araguaia', '26', NULL,  'Farol',  'Bel�m', 'PA', '66093905'),
('Rua Oriximin�', '26', NULL,  'F�tima (Matinha)',  'Bel�m', 'PA', '66093906'),
('Rua Itaituba', '26', NULL,  'Guam�',  'Bel�m', 'PA', '66093907'),
('Rua Itaituba', '25', NULL,  'Guanabara',  'Bel�m', 'PA', '66093908'),
('Rua Itaituba', '25', NULL,  'Itaiteua',  'Bel�m', 'PA', '66095010');


INSERT INTO Info_Type (info_type, descrip)
VALUES 
('P', 'P�blico'),
('R', 'Privado'),
('C', 'Corporativo');

INSERT INTO Marital_Status (acronym, acronym_description)
VALUES 
('S', 'Solteiro'),
('C', 'Casado'),
('V', 'Vi�vo'),
('U', 'Uni�o Est�vel');

INSERT INTO Premise_Type (type_premise)
VALUES
('Aluguel'),
('Cess�o'),
('Comodato'),
('Propriedade');

INSERT INTO Position_Title (position_title, salary)
VALUES
('Manager', 10000),
('Waiter', 4000),
('Host', 3000),
('Bartender', 3000),
('Chef', 8000),
('Cook Assistant', 2000),
('Busser', 1500),
('Cleaner', 1400),
('Cashier', 3500),
('Analyst', 6000),
('Manager Assistant', 4000),
('Superintendent', 15000),
('Director', 20000);

INSERT INTO Unity_Type (type_unity)
VALUES
('Business'),
('Backoffice');

INSERT INTO Unity (name_unity, type_unity, companies_house_id, active_unity)
VALUES
('Bel�m', 1, '01492745000114', 1);

INSERT INTO Unity (name_unity, type_unity, companies_house_id, active_unity)
VALUES
('Ananindeua', 1, '01492745000253', 1),
('Santar�m', 1, '01492745000330', 1),
('Marab�', 1, '01492745000427', 1),
('Parauapebas', 1, '01492745000520', 1),
('Castanhal', 1, '01492745000620', 1),
('Abaetetuba', 1, '01492745000715', 1),
('Camet�', 1, '01492745000813', 1),
('Marituba', 1, '01492745000913', 1),
('S�o F�lix do Xingu', 1, '01492745001113', 1),
('Bragan�a', 1, '01492745001012', 1),
('Barcarena', 1, '01492745001212', 1),
('Altamira', 1, '01492745001311', 1),
('Tucuru�', 1, '01492745001411', 1),
('Paragominas', 1, '01492745001511', 1),
('Tail�ndia', 1, '01492745001610', 1),
('Breves', 1, '01492745001710', 1),
('Itaituba', 1, '01492745001810', 1),
('Reden��o', 1, '01492745001985', 1),
('Moju', 1, '01492745002083', 1),
('Novo Repartimento', 1, '01492745002177', 1),
('Santana do Araguaia', 1, '01492745002374', 1),
('Oriximin�', 1, '01492745002274', 1),
('Santa Izabel do Par�', 1, '01492745002471', 1),
('Capanema', 1, '01492745002568', 1),
('Breu Branco', 1, '01492745002664', 1),
('Tom�-A�u', 1, '01492745002762', 1),
('Ipixuna do Par�', 1, '01492745002862', 1),
('Igarap�-Miri', 1, '01492745002962', 1),
('Benevides', 1, '01492745003016', 1),
('Presid�ncia', 2, '01492745009031', 1),
('Recursos Humanos', 2, '01492745009171', 1),
('Materiais', 2, '01492745009243', 1),
('Rela��es Institucionais', 2, '01492745009339', 1),
('Tecnologia', 2, '01492745009418', 1),
('Jur�dico', 2, '01492745009585', 1),
('Financeiro e Cont�bil', 2, '01492745009647', 1),
('Regional Marab�', 2, '01492745009728', 1),
('Regional Santar�m', 2, '01492745009824', 1),
('Regional Bel�m', 2, '01492745009923', 1);

INSERT INTO Phone (unity, area_code, phone)
VALUES
(1, '91', '32192745'),
(2, '91', '32130598'),
(3, '91', '32104589'),
(4, '91', '32179349'),
(5, '91', '32108273'),
(6, '91', '32100793'),
(7, '91', '32159080'),
(8, '91', '32139364'),
(9, '91', '32133685'),
(10, '91', '32132138'),
(1, '91', '32128914'),
(2, '91', '32127027'),
(3, '91', '32115969'),
(4, '91', '32115144'),
(5, '91', '32114503'),
(6, '91', '32108969'),
(7, '91', '32103497'),
(8, '91', '32101395'),
(9, '91', '32185563'),
(10, '91', '32183182'),
(31, '91', '32177214'),
(32, '91', '32174419'),
(33, '91', '32174016'),
(34, '91', '32171837'),
(35, '91', '32168616'),
(36, '91', '32164738'),
(37, '91', '32162854'),
(38, '91', '32162455'),
(39, '91', '32162355'),
(40, '91', '32161689'),
(31, '91', '32183147'),
(32, '91', '32177179'),
(33, '91', '32174384'),
(34, '91', '32173981'),
(35, '91', '32171802'),
(36, '91', '32168581'),
(37, '91', '32164703'),
(38, '91', '32162819'),
(39, '91', '32162420'),
(40, '91', '32162320');

INSERT INTO Email (unity, email, label)
VALUES
(1, 'r01@tacaca.com.br', 'Tacac� Express - Restaurante Bel�m - 0001'),
(2, 'r02@tacaca.com.br', 'Tacac� Express - Restaurante Ananindeua - 0002'),
(3, 'r03@tacaca.com.br', 'Tacac� Express - Restaurante Santar�m - 0003'),
(4, 'r04@tacaca.com.br', 'Tacac� Express - Restaurante Marab� - 0004'),
(5, 'r05@tacaca.com.br', 'Tacac� Express - Restaurante Parauapebas - 0005'),
(6, 'r06@tacaca.com.br', 'Tacac� Express - Restaurante Castanhal - 0006'),
(7, 'r07@tacaca.com.br', 'Tacac� Express - Restaurante Abaetetuba - 0007'),
(8, 'r08@tacaca.com.br', 'Tacac� Express - Restaurante Camet� - 0008'),
(9, 'r09@tacaca.com.br', 'Tacac� Express - Restaurante Marituba - 0009'),
(10, 'r11@tacaca.com.br', 'Tacac� Express - Restaurante S�o F�lix do Xingu - 0011'),
(11, 'r10@tacaca.com.br', 'Tacac� Express - Restaurante Bragan�a - 0010'),
(12, 'r12@tacaca.com.br', 'Tacac� Express - Restaurante Barcarena - 0012'),
(13, 'r13@tacaca.com.br', 'Tacac� Express - Restaurante Altamira - 0013'),
(14, 'r14@tacaca.com.br', 'Tacac� Express - Restaurante Tucuru� - 0014'),
(15, 'r15@tacaca.com.br', 'Tacac� Express - Restaurante Paragominas - 0015'),
(16, 'r16@tacaca.com.br', 'Tacac� Express - Restaurante Tail�ndia - 0016'),
(17, 'r17@tacaca.com.br', 'Tacac� Express - Restaurante Breves - 0017'),
(18, 'r18@tacaca.com.br', 'Tacac� Express - Restaurante Itaituba - 0018'),
(19, 'r19@tacaca.com.br', 'Tacac� Express - Restaurante Reden��o - 0019'),
(20, 'r20@tacaca.com.br', 'Tacac� Express - Restaurante Moju - 0020'),
(21, 'r21@tacaca.com.br', 'Tacac� Express - Restaurante Novo Repartimento - 0021'),
(22, 'r23@tacaca.com.br', 'Tacac� Express - Restaurante Santana do Araguaia - 0023'),
(23, 'r22@tacaca.com.br', 'Tacac� Express - Restaurante Oriximin� - 0022'),
(24, 'r24@tacaca.com.br', 'Tacac� Express - Restaurante Santa Izabel do Par� - 0024'),
(25, 'r25@tacaca.com.br', 'Tacac� Express - Restaurante Capanema - 0025'),
(26, 'r26@tacaca.com.br', 'Tacac� Express - Restaurante Breu Branco - 0026'),
(27, 'r27@tacaca.com.br', 'Tacac� Express - Restaurante Tom�-A�u - 0027'),
(28, 'r28@tacaca.com.br', 'Tacac� Express - Restaurante Ipixuna do Par� - 0028'),
(29, 'r29@tacaca.com.br', 'Tacac� Express - Restaurante Igarap�-Miri - 0029'),
(30, 'r30@tacaca.com.br', 'Tacac� Express - Restaurante Benevides - 0030'),
(31, 'presidencia@tacaca.com.br', 'Tacac� Express - Presid�ncia'),
(32, 'rh@tacaca.com.br', 'Tacac� Express - Recursos Humanos'),
(33, 'materiais@tacaca.com.br', 'Tacac� Express - Materiais'),
(34, 'ri@tacaca.com.br', 'Tacac� Express - Rela��es Institucionais'),
(35, 'ti@tacaca.com.br', 'Tacac� Express - Tecnologia'),
(36, 'juridico@tacaca.com.br', 'Tacac� Express - Jur�dico'),
(37, 'financeiro@tacaca.com.br', 'Tacac� Express - Financeiro e Cont�bil'),
(38, 'maraba@tacaca.com.br', 'Tacac� Express - Regional Marab�'),
(39, 'santarem@tacaca.com.br', 'Tacac� Express - Regional Santar�m'),
(40, 'belem@tacaca.com.br', 'Tacac� Express - Regional Bel�m');

INSERT INTO Employee (employee_name, gender, email, area_code, mobile, insurance_number, father_name, mother_name, hiring_date, dismissal_date, birth_date, marital_status, children, disabled_person, health_plan, driver_license_type, address_ref)
VALUES
('Maria Silva', 'F', 'Maria.Silva@tacaca.com.br', '91', '953059830', '99114927415', 'Jos� Silva', 'Rosa Silva', '2000-01-01', NULL, '1961-01-01', 1, 0, 0, 1, 'A', 100),
('Jos� Santos', 'M', 'Jos�.Santos@tacaca.com.br', '91', '930458927', '53059830458', 'Paulo Santos', 'Marta Santos', '2000-03-18', NULL, '1962-01-02', 2, 1, 0, 1, 'A', 100),
('Ant�nio Ferreira', 'M', 'Ant�nio.Ferreira@tacaca.com.br', '91', '927934920', '30458927934', 'Jos� Ferreira', 'Rosa Ferreira', '2000-06-03', '2003-02-02', '1963-01-03', 1, 2, 0, 1, 'A', 99),
('Jo�o Pereira', 'M', 'Jo�o.Pereira@tacaca.com.br', '92', '920827320', '27934920827', 'Paulo Pereira', 'Marta Pereira', '2000-08-19', '2003-04-20', '1964-01-04', 2, 3, 0, 1, 'A', 99),
('Francisco Oliveira', 'M', 'Francisco.Oliveira@tacaca.com.br', '91', '920079315', '20827320079', 'Jos� Oliveira', 'Rosa Oliveira', '2000-11-04', '2003-07-06', '1965-01-04', 3, 4, 0, 1, 'B', 98),
('Ana Costa', 'F', 'Ana.Costa@tacaca.com.br', '91', '915908013', '20079315908', 'Paulo Costa', 'Marta Costa', '2001-01-20', '2003-09-21', '1966-01-05', 1, 5, 0, 1, 'B', 98),
('Luiz Rodrigues', 'M', 'Luiz.Rodrigues@tacaca.com.br', '91', '913936413', '15908013936', 'Jos� Rodrigues', 'Rosa Rodrigues', '2001-04-07', '2003-12-07', '1967-01-06', 2, 0, 0, 1, 'B', 97),
('Paulo Martins', 'M', 'Paulo.Martins@tacaca.com.br', '91', '913368513', '13936413368', 'Paulo Martins', 'Marta Martins', '2001-06-23', '2004-02-22', '1968-01-07', 4, 1, 0, 1, 'B', 97),
('Carlos Jesus', 'M', 'Carlos.Jesus@tacaca.com.br', '93', '913213812', '13368513213', 'Jos� Jesus', 'Rosa Jesus', '2001-09-08', '2004-05-09', '1969-01-07', 4, 2, 0, 1, 'B', 96),
('Manoel Sousa', 'M', 'Manoel.Sousa@tacaca.com.br', '94', '912891412', '13213812891', 'Paulo Sousa', 'Marta Sousa', '2001-11-24', '2004-07-25', '1970-01-08', 4, 3, 0, 1, 'B', 96),
('Pedro Fernandes', 'M', 'Pedro.Fernandes@tacaca.com.br', '91', '912702711', '12891412702', 'Jos� Fernandes', 'Rosa Fernandes', '2002-02-09', '2004-10-10', '1971-01-09', 4, 4, 0, 1, 'B', 95),
('Francisca Gon�alves', 'F', 'Francisca.Gon�alves@tacaca.com.br', '91', '911596911', '12702711596', 'Paulo Gon�alves', 'Marta Gon�alves', '2002-04-27', '2004-12-26', '1972-01-10', 4, 0, 0, 1, 'B', 95),
('Marcos Gomes', 'M', 'Marcos.Gomes@tacaca.com.br', '91', '911514411', '11596911514', 'Jos� Gomes', 'Rosa Gomes', '2002-07-13', '2005-03-13', '1973-01-10', 4, 1, 0, 1, 'B', 94),
('Raimundo Lopes', 'M', 'Raimundo.Lopes@tacaca.com.br', '92', '911450310', '11514411450', 'Paulo Lopes', 'Marta Lopes', '2002-09-28', '2005-05-29', '1974-01-11', 4, 2, 0, 1, 'B', 94),
('Sebasti�o Marques', 'M', 'Sebasti�o.Marques@tacaca.com.br', '91', '910896910', '11450310896', 'Jos� Marques', 'Rosa Marques', '2002-12-14', '2005-08-14', '1975-01-12', 4, 3, 0, 1, 'B', 93),
('Ant�nia Alves', 'F', 'Ant�nia.Alves@tacaca.com.br', '91', '910349710', '10896910349', 'Paulo Alves', 'Marta Alves', '2003-03-01', '2005-10-30', '1976-01-13', 4, 0, 0, 1, 'B', 93),
('Marcelo Almeida', 'M', 'Marcelo.Almeida@tacaca.com.br', '91', '910139553', '10349710139', 'Jos� Almeida', 'Rosa Almeida', '2003-05-17', NULL, '1977-01-13', 4, 1, 0, 1, 'AC', 92),
('Jorge Ribeiro', 'M', 'Jorge.Ribeiro@tacaca.com.br', '91', '953059830', '10139553059', 'Paulo Ribeiro', 'Marta Ribeiro', '2003-08-02', NULL, '1978-01-14', 1, 2, 0, 1, 'AC', 92),
('M�rcia Pinto', 'F', 'M�rcia.Pinto@tacaca.com.br', '93', '930458927', '53059830458', 'Jos� Pinto', 'Rosa Pinto', '2003-10-18', NULL, '1979-01-15', 2, 3, 0, 1, 'C', 91),
('Geraldo Carvalho', 'M', 'Geraldo.Carvalho@tacaca.com.br', '94', '927934920', '30458927934', 'Paulo Carvalho', 'Marta Carvalho', '2004-01-03', NULL, '1980-01-16', 1, 0, 0, 1, 'C', 91),
('Adriana Teixeira', 'F', 'Adriana.Teixeira@tacaca.com.br', '91', '920827320', '27934920827', 'Jos� Teixeira', 'Rosa Teixeira', '2004-03-20', '2006-01-15', '1981-01-16', 2, 1, 0, 1, 'C', 90),
('Sandra Moreira', 'F', 'Sandra.Moreira@tacaca.com.br', '91', '920079315', '20827320079', 'Paulo Moreira', 'Marta Moreira', '2004-06-05', '2006-04-02', '1982-01-17', 2, 2, 0, 1, 'C', 90),
('Luis Correia', 'M', 'Luis.Correia@tacaca.com.br', '91', '915908013', '20079315908', 'Jos� Correia', 'Rosa Correia', '2004-08-21', '2006-06-18', '1983-01-18', 2, 3, 0, 1, 'C', 89),
('Fernando Mendes', 'M', 'Fernando.Mendes@tacaca.com.br', '92', '913936413', '15908013936', 'Paulo Mendes', 'Marta Mendes', '2004-11-06', '2006-09-03', '1984-01-19', 1, 0, 0, 1, 'C', 89),
('Fabio Nunes', 'M', 'Fabio.Nunes@tacaca.com.br', '91', '913368513', '13936413368', 'Jos� Nunes', 'Rosa Nunes', '2005-01-22', '2006-11-19', '1985-01-19', 2, 1, 0, 1, 'C', 87),
('Roberto Soares', 'M', 'Roberto.Soares@tacaca.com.br', '91', '913213812', '13368513213', 'Paulo Soares', 'Marta Soares', '2005-04-09', '2007-02-04', '1986-01-20', 1, 2, 0, 1, 'C', 87),
('M�rcio Vieira', 'M', 'M�rcio.Vieira@tacaca.com.br', '91', '912891412', '13213812891', 'Jos� Vieira', 'Rosa Vieira', '2005-06-25', '2007-04-22', '1987-01-21', 1, 3, 0, 1, 'C', 86),
('Edson Monteiro', 'M', 'Edson.Monteiro@tacaca.com.br', '91', '912702711', '12891412702', 'Paulo Monteiro', 'Marta Monteiro', '2005-09-10', '2007-07-08', '1988-01-22', 1, 4, 0, 1, 'C', 86),
('Andr� Cardoso', 'M', 'Andr�.Cardoso@tacaca.com.br', '93', '911596911', '12702711596', 'Jos� Cardoso', 'Rosa Cardoso', '2005-11-26', '2007-09-23', '1989-01-22', 1, 0, 0, 1, 'D', 85),
('S�rgio Rocha', 'M', 'S�rgio.Rocha@tacaca.com.br', '94', '911514411', '11596911514', 'Paulo Rocha', 'Marta Rocha', '2006-02-11', '2007-12-09', '1990-01-23', 1, 1, 0, 1, 'D', 85),
('Josefa Raposo', 'F', 'Josefa.Raposo@tacaca.com.br', '91', '911450310', '11514411450', 'Jos� Raposo', 'Rosa Raposo', '2006-04-29', '2008-02-24', '1991-01-24', 1, 2, 0, 1, 'E', 84),
('Patr�cia Neves', 'F', 'Patr�cia.Neves@tacaca.com.br', '91', '910896910', '11450310896', 'Paulo Neves', 'Marta Neves', '2006-07-15', '2008-05-11', '1992-01-25', 1, 3, 0, 1, 'E', 84),
('Daniel Coelho', 'M', 'Daniel.Coelho@tacaca.com.br', '91', '910349710', '10896910349', 'Jos� Coelho', 'Rosa Coelho', '2006-09-30', '2008-07-27', '1993-01-25', 1, 0, 0, 1, 'N', 83),
('Rose Cruz', 'F', 'Rose.Cruz@tacaca.com.br', '92', '910139553', '10349710139', 'Paulo Cruz', 'Marta Cruz', '2006-12-16', '2008-10-12', '1994-01-26', 1, 1, 0, 1, 'N', 83),
('Rafaela Cunha', 'F', 'Rafaela.Cunha@tacaca.com.br', '91', '953059830', '10139553059', 'Jos� Cunha', 'Rosa Cunha', '2007-03-03', '2008-12-28', '1995-01-27', 1, 2, 0, 1, 'N', 82),
('Joaquina Pires', 'F', 'Joaquina.Pires@tacaca.com.br', '91', '930458927', '53059830458', 'Paulo Pires', 'Marta Pires', '2007-05-19', '2009-03-15', '1996-01-28', 2, 3, 0, 1, 'N', 82),
('Vera Ramos', 'F', 'Vera.Ramos@tacaca.com.br', '91', '927934920', '30458927934', 'Jos� Ramos', 'Rosa Ramos', '2007-08-04', '2009-05-31', '1997-01-28', 1, 0, 0, 1, 'N', 81),
('Ricardina Reis', 'F', 'Ricardina.Reis@tacaca.com.br', '91', '920827320', '27934920827', 'Paulo Reis', 'Marta Reis', '2007-10-20', '2009-08-16', '1998-01-29', 2, 1, 0, 1, 'N', 81),
('Eduarda Sim�es', 'F', 'Eduarda.Sim�es@tacaca.com.br', '93', '920079315', '20827320079', 'Jos� Sim�es', 'Rosa Sim�es', '2008-01-05', '2009-11-01', '1999-01-30', 3, 2, 0, 1, 'N', 80),
('Terezinha Antunes', 'F', 'Terezinha.Antunes@tacaca.com.br', '94', '915908013', '20079315908', 'Paulo Antunes', 'Marta Antunes', '2008-03-22', '2010-01-17', '2000-01-31', 1, 3, 0, 1, 'N', 79),
('S�nia Matos', 'F', 'S�nia.Matos@tacaca.com.br', '91', '913936413', '15908013936', 'Jos� Matos', 'Rosa Matos', '2008-06-07', '2010-04-04', '2001-01-31', 2, 0, 0, 1, 'N', 79),
('Alecsandra Fonseca', 'F', 'Alecsandra.Fonseca@tacaca.com.br', '91', '913368513', '13936413368', 'Paulo Fonseca', 'Marta Fonseca', '2008-08-23', '2010-06-20', '2002-02-01', 4, 1, 0, 1, 'N', 78),
('Rita Machado', 'F', 'Rita.Machado@tacaca.com.br', '91', '913213812', '13368513213', 'Jos� Machado', 'Rosa Machado', '2008-11-08', NULL, '2003-02-02', 4, 2, 0, 1, 'N', 78),
('Luciana Ara�jo', 'F', 'Luciana.Ara�jo@tacaca.com.br', '92', '912891412', '13213812891', 'Paulo Ara�jo', 'Marta Ara�jo', '2009-01-24', NULL, '1961-01-28', 4, 3, 0, 1, 'N', 77),
('Cl�udia Barbosa', 'F', 'Cl�udia.Barbosa@tacaca.com.br', '91', '912702711', '12891412702', 'Jos� Barbosa', 'Rosa Barbosa', '2009-04-11', NULL, '1962-01-29', 4, 4, 0, 1, 'N', 76),
('Rosa Tavares', 'F', 'Rosa.Tavares@tacaca.com.br', '91', '911596911', '12702711596', 'Paulo Tavares', 'Marta Tavares', '2009-06-27', NULL, '1963-01-30', 4, 0, 1, 1, 'N', 76),
('Benedita Louren�o', 'F', 'Benedita.Louren�o@tacaca.com.br', '91', '911514411', '11596911514', 'Jos� Louren�o', 'Rosa Louren�o', '2009-09-12', '2010-09-05', '1964-01-31', 4, 1, 1, 1, 'N', 75),
('Leandra Castro', 'F', 'Leandra.Castro@tacaca.com.br', '91', '911450310', '11514411450', 'Paulo Castro', 'Marta Castro', '2009-11-28', '2010-11-21', '1965-01-31', 4, 2, 1, 1, 'N', 75),
('Raimunda Figueiredo', 'F', 'Raimunda.Figueiredo@tacaca.com.br', '93', '910896910', '11450310896', 'Jos� Figueiredo', 'Rosa Figueiredo', '2010-02-13', '2011-02-06', '1966-02-01', 4, 3, 1, 1, 'N', 74),
('Marilene Azevedo', 'F', 'Marilene.Azevedo@tacaca.com.br', '94', '910349710', '10896910349', 'Paulo Azevedo', 'Marta Azevedo', '2010-05-01', '2011-04-24', '1967-02-02', 4, 0, 1, 1, 'N', 74),
('Andressa Freitas', 'F', 'Andressa.Freitas@tacaca.com.br', '91', '910139553', '10349710139', 'Jos� Freitas', 'Rosa Freitas', '2010-07-17', '2011-07-10', '1968-02-03', 4, 1, 0, 1, 'N', 73),
('Simone Magalh�es', 'F', 'Simone.Magalh�es@tacaca.com.br', '91', '953059830', '10139553059', 'Paulo Magalh�es', 'Marta Magalh�es', '2010-10-02', '2011-09-25', '1969-02-03', 1, 2, 0, 1, 'N', 73),
('Helena Henriques', 'F', 'Helena.Henriques@tacaca.com.br', '91', '930458927', '53059830458', 'Jos� Henriques', 'Rosa Henriques', '2010-12-18', '2011-12-11', '1970-02-04', 2, 3, 0, 1, 'N', 72),
('Alice Lima', 'F', 'Alice.Lima@tacaca.com.br', '92', '927934920', '30458927934', 'Paulo Lima', 'Marta Lima', '2011-03-05', '2012-02-26', '1971-02-05', 1, 0, 0, 1, 'N', 72),
('Silvana Guerreiro', 'F', 'Silvana.Guerreiro@tacaca.com.br', '91', '920827320', '27934920827', 'Jos� Guerreiro', 'Rosa Guerreiro', '2011-05-21', '2012-05-13', '1972-02-06', 2, 1, 0, 1, 'N', 71),
('Doralice Batista', 'F', 'Doralice.Batista@tacaca.com.br', '91', '920079315', '20827320079', 'Paulo Batista', 'Marta Batista', '2011-08-06', '2012-07-29', '1973-02-06', 2, 2, 0, 1, 'N', 71),
('Valentina Pinheiro', 'F', 'Valentina.Pinheiro@tacaca.com.br', '91', '915908013', '20079315908', 'Jos� Pinheiro', 'Rosa Pinheiro', '2011-10-22', '2012-10-14', '1974-02-07', 2, 3, 0, 1, 'N', 70),
('Laura Faria', 'F', 'Laura.Faria@tacaca.com.br', '91', '913936413', '15908013936', 'Paulo Faria', 'Marta Faria', '2012-01-07', NULL, '1975-02-08', 1, 0, 0, 1, 'N', 70),
('Helo�sa Miranda', 'F', 'Helo�sa.Miranda@tacaca.com.br', '93', '913368513', '13936413368', 'Jos� Miranda', 'Rosa Miranda', '2012-03-24', NULL, '1976-02-09', 2, 1, 0, 1, 'N', 69),
('J�lia Barros', 'F', 'J�lia.Barros@tacaca.com.br', '94', '913213812', '13368513213', 'Paulo Barros', 'Marta Barros', '2012-06-09', '2012-12-30', '1977-02-09', 1, 2, 0, 1, 'N', 68),
('Maria Edaurda Morais', 'F', 'Maria Edaurda.Morais@tacaca.com.br', '93', '912891412', '13213812891', 'Jos� Morais', 'Rosa Morais', '2012-08-25', '2013-03-17', '1978-02-10', 1, 0, 0, 1, 'N', 68),
('L�cia Nogueira', 'F', 'L�cia.Nogueira@tacaca.com.br', '93', '912702711', '12891412702', 'Paulo Nogueira', 'Marta Nogueira', '2012-11-10', '2013-06-02', '1979-02-11', 1, 1, 0, 1, 'N', 67),
('Paula Esteves', 'F', 'Paula.Esteves@tacaca.com.br', '93', '911596911', '12702711596', 'Jos� Esteves', 'Rosa Esteves', '2013-01-26', '2013-08-18', '1980-02-12', 1, 2, 0, 1, 'N', 67),
('Carla Anjos', 'F', 'Carla.Anjos@tacaca.com.br', '93', '911514411', '11596911514', 'Paulo Anjos', 'Marta Anjos', '2013-04-13', '2013-11-03', '1981-02-12', 1, 3, 0, 1, 'N', 66),
('Manuela Baptista', 'F', 'Manuela.Baptista@tacaca.com.br', '94', '911450310', '11514411450', 'Jos� Baptista', 'Rosa Baptista', '2013-06-29', '2014-01-19', '1982-02-13', 1, 4, 0, 1, 'N', 66),
('Pedro Campos', 'F', 'Pedro.Campos@tacaca.com.br', '91', '910896910', '11450310896', 'Paulo Campos', 'Marta Campos', '2013-09-14', '2014-04-06', '1983-02-14', 1, 5, 0, 1, 'N', 65),
('Francisca Mota', 'F', 'Francisca.Mota@tacaca.com.br', '91', '910349710', '10896910349', 'Jos� Mota', 'Rosa Mota', '2013-11-30', '2014-06-22', '1984-02-15', 1, 0, 0, 1, 'N', 65),
('Marcos Andrade', 'M', 'Marcos.Andrade@tacaca.com.br', '91', '910139553', '10349710139', 'Paulo Andrade', 'Marta Andrade', '2014-02-15', '2014-09-07', '1985-02-15', 1, 1, 0, 1, 'N', 64),
('Raimundo Brito', 'M', 'Raimundo.Brito@tacaca.com.br', '91', '953059830', '10139553059', 'Jos� Brito', 'Rosa Brito', '2014-05-03', '2014-11-23', '1986-02-16', 2, 2, 0, 1, 'N', 64),
('M�rcia S�', 'F', 'M�rcia.S�@tacaca.com.br', '91', '930458927', '53059830458', 'Paulo S�', 'Marta S�', '2014-07-19', NULL, '1987-02-17', 2, 3, 0, 1, 'N', 63),
('Sebasti�o Nascimento', 'M', 'Sebasti�o.Nascimento@tacaca.com.br', '91', '927934920', '30458927934', 'Jos� Nascimento', 'Rosa Nascimento', '2014-10-04', NULL, '1988-02-18', 2, 4, 0, 1, 'N', 63),
('Ant�nia Leite', 'F', 'Ant�nia.Leite@tacaca.com.br', '91', '920827320', '27934920827', 'Paulo Leite', 'Marta Leite', '2014-12-20', '2015-02-08', '1989-02-18', 2, 0, 0, 1, 'N', 62),
('Marcelo Abreu', 'M', 'Marcelo.Abreu@tacaca.com.br', '91', '920079315', '20827320079', 'Jos� Abreu', 'Rosa Abreu', '2015-03-07', '2015-04-26', '1990-02-19', 2, 1, 0, 0, 'N', 61),
('Jorge Borges', 'M', 'Jorge.Borges@tacaca.com.br', '91', '915908013', '20079315908', 'Paulo Borges', 'Marta Borges', '2015-05-23', '2015-07-12', '1991-02-20', 2, 2, 0, 0, 'N', 61),
('Geraldo Melo', 'M', 'Geraldo.Melo@tacaca.com.br', '91', '913936413', '15908013936', 'Jos� Melo', 'Rosa Melo', '2015-08-08', '2015-09-27', '1992-02-21', 2, 3, 0, 0, 'N', 60),
('Adriana Vaz', 'F', 'Adriana.Vaz@tacaca.com.br', '91', '913368513', '13936413368', 'Paulo Vaz', 'Marta Vaz', '2015-10-24', '2015-12-13', '1993-02-21', 2, 0, 0, 0, 'N', 60),
('Sandra Pinho', 'F', 'Sandra.Pinho@tacaca.com.br', '91', '913213812', '13368513213', 'Jos� Pinho', 'Rosa Pinho', '2016-01-09', '2016-02-28', '1994-02-22', 2, 1, 0, 0, 'N', 59),
('Luis Vicente', 'M', 'Luis.Vicente@tacaca.com.br', '91', '912891412', '13213812891', 'Paulo Vicente', 'Marta Vicente', '2016-03-26', '2016-05-15', '1995-02-23', 2, 2, 0, 0, 'N', 59),
('Fernando Gaspar', 'M', 'Fernando.Gaspar@tacaca.com.br', '91', '912702711', '12891412702', 'Jos� Gaspar', 'Rosa Gaspar', '2016-06-11', '2016-07-31', '1996-02-24', 2, 3, 0, 0, 'N', 58),
('Fabio Assun��o', 'M', 'Fabio.Assun��o@tacaca.com.br', '91', '911596911', '12702711596', 'Paulo Assun��o', 'Marta Assun��o', '2016-08-27', '2016-10-16', '1997-02-24', 2, 0, 0, 0, 'N', 58),
('Roberto Maia', 'M', 'Roberto.Maia@tacaca.com.br', '91', '911514411', '11596911514', 'Jos� Maia', 'Rosa Maia', '2016-11-12', NULL, '1998-02-25', 2, 1, 0, 0, 'N', 57),
('M�rcio Moura', 'M', 'M�rcio.Moura@tacaca.com.br', '91', '911450310', '11514411450', 'Paulo Moura', 'Marta Moura', '2017-01-28', NULL, '1999-02-26', 2, 2, 0, 0, 'N', 57),
('Edson Valente', 'M', 'Edson.Valente@tacaca.com.br', '91', '910896910', '11450310896', 'Jos� Valente', 'Rosa Valente', '2017-04-15', NULL, '2000-02-27', 2, 3, 0, 0, 'N', 56),
('Andr� Domingues', 'M', 'Andr�.Domingues@tacaca.com.br', '91', '910349710', '10896910349', 'Paulo Domingues', 'Marta Domingues', '2017-07-01', NULL, '2001-02-27', 1, 0, 0, 0, 'N', 56),
('Maria Garcia', 'F', 'Maria.Garcia@tacaca.com.br', '91', '910139553', '10349710139', 'Jos� Garcia', 'Rosa Garcia', '2017-09-16', NULL, '2002-02-28', 1, 1, 0, 0, 'N', 55),
('Jos� Carneiro', 'M', 'Jos�.Carneiro@tacaca.com.br', '91', '953059830', '10139553059', 'Paulo Carneiro', 'Marta Carneiro', '2017-12-02', NULL, '2003-03-01', 1, 2, 0, 0, 'N', 55),
('Ant�nio Loureiro', 'M', 'Ant�nio.Loureiro@tacaca.com.br', '91', '930458927', '53059830458', 'Jos� Loureiro', 'Rosa Loureiro', '2018-02-17', NULL, '1961-02-24', 1, 3, 0, 0, 'N', 54),
('Jo�o Neto', 'M', 'Jo�o.Neto@tacaca.com.br', '91', '927934920', '30458927934', 'Paulo Neto', 'Marta Neto', '2018-05-05', NULL, '1962-02-25', 1, 4, 0, 0, 'N', 53),
('Francisco Amaral', 'M', 'Francisco.Amaral@tacaca.com.br', '91', '920827320', '27934920827', 'Jos� Amaral', 'Rosa Amaral', '2018-07-21', NULL, '1963-02-26', 2, 0, 0, 0, 'N', 53),
('Ana Branco', 'F', 'Ana.Branco@tacaca.com.br', '91', '920079315', '20827320079', 'Paulo Branco', 'Marta Branco', '2018-10-06', NULL, '1964-02-27', 2, 1, 0, 0, 'N', 52),
('Luiz Leal', 'M', 'Luiz.Leal@tacaca.com.br', '91', '915908013', '20079315908', 'Jos� Leal', 'Rosa Leal', '2018-12-22', NULL, '1965-02-27', 2, 2, 0, 0, 'N', 52),
('Paulo Pacheco', 'M', 'Paulo.Pacheco@tacaca.com.br', '91', '913936413', '15908013936', 'Paulo Pacheco', 'Marta Pacheco', '2019-03-09', NULL, '1966-02-28', 2, 3, 0, 0, 'N', 51),
('Carlos Macedo', 'M', 'Carlos.Macedo@tacaca.com.br', '91', '913368513', '13936413368', 'Jos� Macedo', 'Rosa Macedo', '2019-05-25', NULL, '1967-03-01', 2, 0, 0, 0, 'N', 51),
('Manoel Paiva', 'M', 'Manoel.Paiva@tacaca.com.br', '91', '913213812', '13368513213', 'Paulo Paiva', 'Marta Paiva', '2019-08-10', NULL, '1968-03-01', 2, 1, 0, 0, 'N', 50),
('Pedro Matias', 'M', 'Pedro.Matias@tacaca.com.br', '91', '912891412', '13213812891', 'Jos� Matias', 'Rosa Matias', '2019-10-26', NULL, '1969-03-02', 2, 2, 0, 0, 'N', 50),
('Francisca Amorim', 'F', 'Francisca.Amorim@tacaca.com.br', '91', '912702712', '12891412702', 'Paulo Amorim', 'Marta Amorim', '2020-01-11', NULL, '1970-03-03', 1, 3, 0, 0, 'N', 49),
('Maria Torres', 'F', 'Maria.Torres@tacaca.com.br', '91', '913213812', '12702712702', 'Jos� Torres', 'Rosa Torres', '2020-03-28', NULL, '1971-03-04', 1, 0, 0, 0, 'N', 49);

INSERT INTO Career (employee_id, position_title, unity, start_date, end_date)
VALUES
(19, 1, 1, '2003-10-18', '2005-12-15'),
(19, 2, 1, '2005-12-16', '2009-07-15'),
(19, 3, 1, '2009-07-16', '2012-11-30'),
(19, 4, 1, '2012-12-01', '2016-05-30'),
(19, 5, 1, '2016-05-31', '2021-09-16'),
(19, 6, 1, '2021-09-17', NULL),
(18, 2, 1, '2003-10-25', '2005-12-22'),
(18, 3, 1, '2005-12-23', '2009-07-22'),
(18, 4, 1, '2009-07-23', '2012-12-07'),
(18, 5, 1, '2012-12-08', '2016-06-06'),
(18, 6, 1, '2016-06-07', '2021-09-23'),
(18, 1, 1, '2021-09-24', NULL);

INSERT INTO Unity_Premise (unity, start_date, end_date, premise_type, address_ref)
VALUES
(1, '2003-10-18', '2009-11-17', 1, 7),
(1, '2009-11-18', '2015-12-19', 1, 8),
(1, '2015-12-20', NULL, 1, 9);

-- C�DIGOS DE SELE��O --

USE tacaca_express;

SELECT * FROM Unity;

/*Selecionar apenas as unidades administrativas*/

SELECT id, name_unity
FROM Unity
WHERE type_unity = 2;

/*Selecionar funcion�rios que ainda fazem parte do quadro*/

SELECT id, employee_name
FROM Employee
WHERE ([dismissal_date]) IS NULL;

/*Selecionar funcion�rios com fun��o gratificada vigente*/

SELECT employee.id, employee.employee_name , position_title.position_title, career.start_date
FROM Career
INNER JOIN Employee
ON career.employee_id = employee.id
INNER JOIN Position_Title
ON career.position_title = position_title.id
WHERE (Career.end_date) IS NULL
ORDER BY (employee.id);

/*Exibir funcion�rios da unidade de Bel�m*/

SELECT employee_name, name_unity
FROM Employee
LEFT JOIN Career
ON employee.id = career.employee_id
LEFT JOIN Unity
ON career.unity = unity.id
WHERE career.unity = 1
AND career.end_date IS NULL
ORDER BY (employee_name);

/*Altera��o do nome da unidade de RH*/

UPDATE Unity
SET name_unity = 'Gest�o de Pessoas'
WHERE unity.id = 32;

/*Altera��o do g�nero de Pedro Campos*/

UPDATE Employee
SET gender = 'M'
WHERE employee.id = 66;

/*Exclus�o de Telefone*/
 
 DELETE FROM Phone
 WHERE id  = 4;
 
/*Funcion�rios com menos de dois anos de empresa*/

SELECT employee_name
FROM Employee
WHERE hiring_date >= '2019-10-20'
AND (dismissal_date) IS NULL;

/*M�es que n�o moram em Bel�m*/

SELECT employee.employee_name
FROM Employee
RIGHT JOIN Address_Catalog
ON employee.address_ref = address_catalog.id
WHERE employee.gender = 'F'
AND children > 0
AND NOT Address_Catalog.city = 'Bel�m';

/*Funcion�rias que moram em Bel�m e n�o s�o m�es*/

SELECT employee.employee_name
FROM Employee
RIGHT JOIN Address_Catalog
ON employee.address_ref = address_catalog.id
WHERE employee.gender = 'F'
AND children = 0
AND address_catalog.city = 'Bel�m'
ORDER BY (employee.employee_name);

-- Comandos Diversos --

/* Indexar N�mero do Seguro dos Empregados */
CREATE INDEX idx_insurance_number
ON Employee (insurance_number);

/* Desativar as Unidades de Breu Branco e Tom�-A�u */
BEGIN TRANSACTION
UPDATE Unity
SET active_unity = 0
WHERE unity.id = 6
OR unity.id = 7;
COMMIT; /* Confirmar Transa��o */

/* Desativar as Unidades de Moju e Santanda do Araguaia */
BEGIN TRANSACTION
UPDATE Unity
SET active_unity = 0
WHERE unity.id = 20
OR unity.id = 22;
ROLLBACK; /* Retornar ao Ponto de Recupera��o */

/* Acesso de Fulano ao Cat�logo de Endere�os */
USE tacaca_express
CREATE LOGIN Fulano WITH PASSWORD = 'xyz'
CREATE USER DeTal FROM LOGIN Fulano;
GRANT CONTROL ON Address_Catalog TO DeTal; /* Conceder Acesso */
REVOKE CONTROL ON Address_Catalog TO DeTal2; /* Revogar Acesso */

/* Gatilho de Listagem das Unidades */
CREATE TRIGGER list_unity
ON Unity
AFTER INSERT, DELETE
AS
BEGIN
	SET NOCOUNT ON;
SELECT * 
FROM Unity;
END

INSERT INTO Unity (name_unity, type_unity, companies_house_id, active_unity)
VALUES
('Crepori', 1, '01492745000127', 1);

/* Procedimento Reutiliz�vel */
USE tacaca_express
CREATE PROCEDURE inactive_unity
AS
BEGIN
SET NOCOUNT ON;
SELECT unity.id, unity.name_unity
FROM Unity
WHERE unity.active_unity = 0;
END;
EXECUTE inactive_unity;

/* Fun��o Letras Mai�sculas */
SELECT UPPER ('este � um teste') AS TESTE;

/* Criar uma View com as Unidades Ativas*/
CREATE VIEW Unidades_Ativas AS
SELECT unity.id, unity.name_unity
FROM Unity
WHERE unity.active_unity = 1;

/* Atualiza��o do logradouro */
UPDATE [Address_Catalog]
SET [address_line1] = 'Travessa Ribamar Coelho Neto'
WHERE[id] = 1;

/* Exclus�o de Endere�o do Cat�logo */
DELETE FROM [Address_Catalog]
WHERE [id] = 10;

/* Sele��o de Endere�os de Guam�*/
SELECT * FROM [Address_Catalog]
WHERE borough = 'Guam�';

/* Exclus�o do Campo de Licen�a de Motorista */
ALTER TABLE Employee
DROP COLUMN driver_license_type;

/* Exclus�o da Tabela de Telefones */
DROP TABLE Phone;

/* Exclus�o do Banco de Dados */
USE tempdb;
DROP DATABASE TACACA_EXPRESS;