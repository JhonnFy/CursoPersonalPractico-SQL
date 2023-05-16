
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

