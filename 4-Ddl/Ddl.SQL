
USE GestionDePedidos
GO

DROP PROCEDURE IF EXISTS
[TablaPRUEBAS];
GO

DROP TABLE IF EXISTS
[PRUEBAS];
GO

--Crear una tabla PRUEBAS, con StoreProcedure
CREATE PROCEDURE TablaPRUEBAS
AS
BEGIN
CREATE TABLE PRUEBAS(
IdPrueba INT IDENTITY (1,1) NOT NULL,
NroPrueba INT PRIMARY KEY NOT NULL,
Nombre VARCHAR(80) NOT NULL,
Usuario TEXT NOT NULL,
Edad INT NOT NULL,
FechaNacimiento DATE NOT NULL,
Carnet BIT NOT NULL,
)
END
GO
EXECUTE dbo.TablaPRUEBAS
GO
--Insertar datos
INSERT INTO PRUEBAS (NroPrueba, Nombre, Usuario,Edad,FechaNacimiento,Carnet)
VALUES
('1','PruebaUno','Jp','20','2020-10-02','False');
--Actualizar Un Valor Descrito
UPDATE PRUEBAS
SET Carnet = 'TRUE'
WHERE NroPrueba = '1'
GO
--Consultar
SELECT * FROM PRUEBAS
GO





--Crear una tabla, usando StoreProcedure
DROP PROCEDURE IF EXISTS 
[TablaCONSULTA];
GO
DROP TABLE IF EXISTS
[CONSULTA];
GO
CREATE PROCEDURE TablaCONSULTA
AS
BEGIN
CREATE TABLE CONSULTA(
IdConsulta INT IDENTITY(1,1) NOT NULL,
NroConsulta INT PRIMARY KEY NOT NULL,
NombreUsuario VARCHAR(50) NOT NULL
)
END
GO
EXECUTE dbo.TablaCONSULTA
GO
--Agregar Columna Apellidos
ALTER TABLE Consulta
ADD Apellidos VARCHAR(50) NOT NULL;
GO
--Agregar Columna Edad
ALTER TABLE Consulta
ADD Edad INT NOT NULL;
GO
--Agregar Columna FechaBaja
ALTER TABLE Consulta 
ADD FechaBaja DATE  NOT NULL;
GO
--Agregar Columna Poblacion
ALTER TABLE Consulta
ADD Poblacion VARCHAR(50) NOT NULL;
GO

--Eliminar Columna Poblacion
ALTER TABLE Consulta
DROP COLUMN Poblacion;
Go
--Eliminar Columna FechaBaja
ALTER TABLE Consulta
DROP COLUMN FechaBaja;
Go
--Eliminar Columna Edad
ALTER TABLE Consulta
DROP COLUMN Edad;
GO
--Eliminar Columna Apellidos
ALTER TABLE Consulta
DROP COLUMN Apellidos;
GO
--Agregar Columna FechaBaja
ALTER TABLE Consulta
ADD FechaBaja DATE NOT NULL
GO
--ModificarElTipoDeDato
ALTER TABLE Consulta
ALTER COLUMN FechaBaja Varchar(50) NOT NULL;
GO

SELECT * FROM CONSULTA
GO

