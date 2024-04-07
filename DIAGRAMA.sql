CREATE DATABASE locadora;
USE locadora;
ALTER DATABASE locadora CHARACTER SET utf8;

SHOW TABLES;

CREATE TABLE Veiculos (
    Veiculo_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Categoria_Veiculos (
    Categoria_Veiculos_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Manutencao (
    Manutencao_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Reserva (
    Reserva_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Tipo_Pagamento (
    Tipo_Pagamento_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Funcionario (
    Funcionario_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Aluguel (
    Aluguel_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Agencia (
    Agencia_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Cliente (
    Cliente_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Endereco (
    Endereco_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Multa (
    Multa_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Seguro (
    Seguro_ID INT AUTO_INCREMENT PRIMARY KEY
);

ALTER TABLE Veiculos
    ADD COLUMN Numero_Chassi VARCHAR(17) UNIQUE,
    ADD COLUMN Modelo VARCHAR(100),
    ADD COLUMN Marca VARCHAR(50),
    ADD COLUMN Ano VARCHAR(4),
    ADD COLUMN Placa VARCHAR(7) UNIQUE,
    ADD COLUMN Categoria VARCHAR(50),
    ADD COLUMN Disponibilidade BOOLEAN,
    
    ADD COLUMN Reserva_ID INT,
    ADD COLUMN Aluguel_ID INT,
    ADD COLUMN Agencia_ID INT,
    ADD COLUMN Cliente_ID INT,
    ADD COLUMN Categoria_Veiculos_ID INT,
    ADD COLUMN Manutencao_ID INT,
    
    ADD FOREIGN KEY (Reserva_ID) REFERENCES Reserva(Reserva_ID),
    ADD FOREIGN KEY (Aluguel_ID) REFERENCES Aluguel(Aluguel_ID),
    ADD FOREIGN KEY (Agencia_ID) REFERENCES Agencia(Agencia_ID),
    ADD FOREIGN KEY (Cliente_ID) REFERENCES Cliente(Cliente_ID),
    ADD FOREIGN KEY (Categoria_Veiculos_ID) REFERENCES Categoria_Veiculos(Categoria_Veiculos_ID),
    ADD FOREIGN KEY (Manutencao_ID) REFERENCES Manutencao(Manutencao_ID);

ALTER TABLE Categoria_Veiculos
    ADD COLUMN Nome_Categoria VARCHAR(50),
    ADD COLUMN Descricao VARCHAR(255),
    ADD COLUMN Tarifa_Diaria DECIMAL(10,2);

ALTER TABLE Manutencao
    ADD COLUMN Tipo_Manutencao VARCHAR(255),
    ADD COLUMN Data_Inicio DATETIME,
    ADD COLUMN Data_Conclusao DATETIME,
    ADD COLUMN Custo DECIMAL (10,2),
    
    ADD COLUMN Veiculo_ID INT,
    
    ADD FOREIGN KEY (Veiculo_ID) REFERENCES Veiculos(Veiculo_ID);

ALTER TABLE Reserva
    ADD COLUMN Data_Reserva DATETIME,
    ADD COLUMNData_Retirada_Prevista DATETIME,
    ADD COLUMN Disponibilidade_Reserva BOOLEAN,
    
    ADD COLUMN Veiculo_ID INT,
    ADD COLUMN Cliente_ID INT,
    
    ADD FOREIGN KEY (Veiculo_ID) REFERENCES Veiculos(Veiculo_ID),
    ADD FOREIGN KEY (Cliente_ID) REFERENCES Cliente(Cliente_ID);

ALTER TABLE Tipo_Pagamento
    ADD COLUMN Nome_do_Tipo VARCHAR (255),
    
    ADD COLUMN Aluguel_ID INT,
    
    ADD FOREIGN KEY (Aluguel_ID) REFERENCES Aluguel(Aluguel_ID);
    
ALTER TABLE Funcionario
    ADD COLUMN Nome VARCHAR (255),
    ADD COLUMN CPF VARCHAR (255) UNIQUE,
    ADD COLUMN Cargo VARCHAR (255),
    ADD COLUMN Telefone VARCHAR (15) UNIQUE,
    ADD COLUMN Email VARCHAR (50) UNIQUE,
    
    ADD COLUMN Aluguel_ID INT,
    ADD COLUMN Endereco_ID INT,
    ADD COLUMN Agencia_ID INT,
    
    ADD FOREIGN KEY (Aluguel_ID) REFERENCES Aluguel(Aluguel_ID),
    ADD FOREIGN KEY (Endereco_ID) REFERENCES Endereco(Endereco_ID),
    ADD FOREIGN KEY (Agencia_ID) REFERENCES Agencia(Agencia_ID);

ALTER TABLE Aluguel
    ADD COLUMN Data_Inicio DATETIME,
    ADD COLUMN Data_Termino_Prevista DATETIME,
    ADD COLUMN Data_Termino_Real DATETIME,
    ADD COLUMN Valor DECIMAL (10,2);

ALTER TABLE Agencia 
    ADD COLUMN Nome VARCHAR (255),
    ADD COLUMN CNPJ VARCHAR (255) UNIQUE,
    ADD COLUMN Telefone VARCHAR (15) UNIQUE,
    ADD COLUMN Email VARCHAR (50) UNIQUE,
    
    ADD COLUMN Endereco_ID INT,
    ADD COLUMN Funcionario_ID INT,
    ADD COLUMN Veiculo_ID INT,
    
    ADD FOREIGN KEY (Endereco_ID) REFERENCES Endereco(Endereco_ID),
    ADD FOREIGN KEY (Funcionario_ID) REFERENCES Funcionario(Funcionario_ID),
    ADD FOREIGN KEY (Veiculo_ID) REFERENCES Veiculos(Veiculo_ID);

ALTER TABLE Cliente
    ADD COLUMN Nome VARCHAR(255),
    ADD COLUMN Telefone VARCHAR(15),
    ADD COLUMN Email VARCHAR(255),
    ADD COLUMN CNH VARCHAR(255),
    ADD COLUMN CPF VARCHAR(255),
    
    ADD COLUMN Aluguel_ID INT,	
    ADD COLUMN Endereco_ID INT,
    ADD COLUMN Veiculo_ID INT,	
    ADD COLUMN Reserva_ID INT,	
    
    ADD FOREIGN KEY (Aluguel_ID) REFERENCES Aluguel(Aluguel_ID),
    ADD FOREIGN KEY (Endereco_ID) REFERENCES Endereco(Endereco_ID),
    ADD FOREIGN KEY (Veiculo_ID) REFERENCES Veiculos(Veiculo_ID),
    ADD FOREIGN KEY (Reserva_ID) REFERENCES Reserva(Reserva_ID);

ALTER TABLE Endereco 
    ADD COLUMN Rua VARCHAR(255),
    ADD COLUMN Numero VARCHAR(255),
    ADD COLUMN Complemento VARCHAR(255),
    ADD COLUMN Bairro VARCHAR(255),
    ADD COLUMN Cidade VARCHAR(255),
    ADD COLUMN Estado VARCHAR(255),
    ADD COLUMN CEP VARCHAR(255);

ALTER TABLE Multa 
    ADD COLUMN Infracao VARCHAR(255),
    ADD COLUMN Data_Multa DATETIME,
    ADD COLUMN Valor_Multa DECIMAL(10,2),
    
    ADD COLUMN Aluguel_ID INT,
    ADD COLUMN Veiculo_ID INT,
    ADD COLUMN Cliente_ID INT,
    
    ADD FOREIGN KEY (Aluguel_ID) REFERENCES Aluguel(Aluguel_ID),
    ADD FOREIGN KEY (Veiculo_ID) REFERENCES Veiculos(Veiculo_ID),
    ADD FOREIGN KEY (Cliente_ID) REFERENCES Cliente(Cliente_ID);

ALTER TABLE Seguro
    ADD COLUMN Tipo_Seguro VARCHAR(255),
    ADD COLUMN Valor_Premio VARCHAR(255),
    ADD COLUMN Periodo_Seguro DATETIME,
    
    ADD COLUMN Aluguel_ID INT,
    
    ADD FOREIGN KEY (Aluguel_ID) REFERENCES Aluguel(Aluguel_ID);
