--Mantenimiento INSERT
CREATE TABLE nUno(
NroProducto INT PRIMARY KEY NOT NULL,
Tipo VARCHAR(50) NOT NULL,
Precio FLOAT NOT NULL,
)
GO

CREATE TABLE nDos(
NroProducto INT PRIMARY KEY NOT NULL,
Tipo VARCHAR(50) NOT NULL,
Precio FLOAT NOT NULL,
)
GO


CREATE TRIGGER nUnoIAnDos
ON nUno
AFTER INSERT
AS
DECLARE
@NroProducto INT = (SELECT NroProducto FROM inserted),
@Tipo VARCHAR(50) = (SELECT Tipo FROM inserted),
@Precio FLOAT = (SELECT Precio FROM inserted)
INSERT INTO nDos (NroProducto,Tipo,Precio) VALUES (@NroProducto,@Tipo,@Precio)
GO


INSERT INTO nUno (NroProducto,Tipo,Precio) VALUES ('1','KTM DUKE 200','20000000');
GO


SELECT * FROM nUno
SELECT * FROM nDos




--INSERT
USE GestionDePedidos
GO

--MantenimientoPRODUCTOS
DROP PROCEDURE IF EXISTS
[MantenimientoPRODUCTOS];
GO
DROP TABLE IF EXISTS
[MtoPRODUCTOS];
GO

CREATE PROCEDURE MantenimientoPRODUCTOS
AS
BEGIN
CREATE TABLE MtoPRODUCTOS(
MtoCodArticulo INT PRIMARY KEY NOT NULL,
MtoSeccion VARCHAR(50) NOT NULL,
MtoNombreArticulo VARCHAR(50) NOT NULL,
MtoPrecio FLOAT NOT NULL,
MtoFecha DATE NOT NULL,
MtoImportado VARCHAR(50) NOT NULL,
MtoPaisDeOrigen VARCHAR(50) NOT NULL,
--Foto IMAGE NOT NULL,
)
END
GO
EXECUTE dbo.MantenimientoPRODUCTOS
GO

CREATE TRIGGER InsertPRODUCTOS
ON PRODUCTOS
AFTER INSERT
AS
DECLARE
@CodArticulo INT = (SELECT CodArticulo FROM inserted),
@Seccion VARCHAR(50) = (SELECT Seccion FROM inserted),
@NombreArticulo VARCHAR(50) = (SELECT NombreArticulo FROM inserted),
@Precio FLOAT = (SELECT Precio FROM inserted),
@Fecha DATE = (SELECT Fecha FROM inserted),
@Importado VARCHAR(50) = (SELECT Importado FROM inserted),
@PaisDeOrigen VARCHAR(50) = (SELECT PaisDeOrigen FROM inserted)
INSERT INTO MtoPRODUCTOS (MtoCodArticulo,MtoSeccion,MtoNombreArticulo,MtoPrecio,MtoFecha,MtoImportado,MtoPaisDeOrigen)
VALUES
(@CodArticulo,@Seccion,@NombreArticulo,@Precio,@Fecha,@Importado,@PaisDeOrigen)
GO



INSERT INTO PRODUCTOS (CodArticulo,Seccion,NombreArticulo,Precio,Fecha,Importado,PaisDeOrigen,Foto)
VALUES
('42','CONFECCION','TRAJE CABALLERO',285,'2002-3-11','VERDADERO','USA','N/A');
GO

SELECT * FROM PRODUCTOS
SELECT * FROM MtoPRODUCTOS
GO
