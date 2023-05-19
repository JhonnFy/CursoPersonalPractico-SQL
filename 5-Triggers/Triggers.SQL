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