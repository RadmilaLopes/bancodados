/*Criar Banco*/
CREATE DATABASE Seguradora USE Seguradora CREATE TABLE Cliente(
CodCliente INT PRIMARY KEY,
Nome VARCHAR(45) NOT NULL UNIQUE,
CPF VARCHAR(45) NOT NULL UNIQUE,
Sexo VARCHAR(20),
Estado VARCHAR(45),
Cidade VARCHAR(45),
Bairro VARCHAR(45),
Numero VARCHAR(45),
Rua VARCHAR(45),
TelefoneFixo VARCHAR(45),
TelefoneCelular VARCHAR(45) NOT NULL UNIQUE,
) 

CREATE TABLE Apolice(
CodApolice INT NOT NULL PRIMARY KEY,
ValorCobertura DECIMAL NOT NULL,
ValorFranquia DECIMAL NOT NULL,
DataInicioVigencia DATE NOT NULL,
DataFimVigencia DATE NOT NULL,
Cliente_CodCliente INT NOT NULL,
Carro_CodCarro INT NOT NULL,
CONSTRAINT FK_Cliente_CodCliente FOREIGN KEY (Cliente_CodCliente) REFERENCES Cliente(CodCliente),
CONSTRAINT FK_CodCarro FOREIGN KEY (Carro_CodCarro) REFERENCES Carro(CodCarro), 
CONSTRAINT CK_DataInicioVigencia CHECK (DataInicioVigencia > GETDATE ()),
) 

CREATE TABLE Carro(
CodCarro INT PRIMARY KEY,
Placa VARCHAR(45),
Marca VARCHAR(45),
Modelo VARCHAR(45),
Ano VARCHAR(45),
Chassi VARCHAR(45),
Cor VARCHAR(45),
) 

CREATE TABLE Sinistro(
CodApolice INT,
HoraSinistro INT,
DataSinistro DATE,
LocalSinistro VARCHAR(45),
Condutor VARCHAR(45),
Carro_CodCarro INT,
CONSTRAINT pk_sinistro PRIMARY KEY (CodApolice, Carro_CodCarro),
CONSTRAINT FK_Carro_CodCarro FOREIGN KEY (Carro_CodCarro) REFERENCES Carro(CodCarro),
) 
