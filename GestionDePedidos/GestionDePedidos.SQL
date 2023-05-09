CREATE DATABASE GestionDePedidos
GO

USE GestionDePedidos
GO

DROP TABLE IF EXISTS
[CLIENTES],
[PEDIDOS],
[PRODUCTOSPEDIDOS],
[PRODUCTOS];
GO

DROP PROCEDURE IF EXISTS 
[TablaCLIENTES],
[TablaPEDIDOS],
[TablaProductosPedidos],
[TablaPRODUCTOS],
[AlterPEDIDOS],
[AlterPRODUCTOSPEDIDOSnUno],
[AlterPRODUCTOSPEDIDOSnDos],
[DataCLIENTES],
[DataPEDIDOS];
GO

CREATE PROCEDURE TablaCLIENTES
AS
BEGIN
CREATE TABLE CLIENTES(
CodCliente INT PRIMARY KEY NOT NULL,
Empresa VARCHAR(80) NOT NULL,
Direccion VARCHAR(80) NOT NULL,
Poblacion VARCHAR(80) NOT NULL,
Telefono VARCHAR(80) NOT NULL,
Responsable VARCHAR(80) NOT NULL,
Historial VARCHAR(80) NOT NULL,
)
END
GO
EXECUTE DBO.TablaCLIENTES
GO

CREATE PROCEDURE TablaPEDIDOS
AS
BEGIN
CREATE TABLE PEDIDOS(
NumeroDePedido INT PRIMARY KEY NOT NULL,
FKPED_CodCLIENTE INT NOT NULL,
FechaDePedido DATE NOT NULL,
FormaDePago VARCHAR(50) NOT NULL,
Descuento VARCHAR(50) NOT NULL,
Enviado VARCHAR(50) NOT NULL,
)
END
GO
EXECUTE DBO.TablaPEDIDOS
GO

CREATE PROCEDURE TablaProductosPedidos
AS
BEGIN
CREATE TABLE PRODUCTOSPEDIDOS(
FKPP_NumeroDePEDIDO INT NOT NULL,
FKPP_CodARTICULO INT NOT NULL,
Unidades INT NOT NULL,
)
END
GO
EXECUTE DBO.TablaProductosPedidos
GO

CREATE PROCEDURE TablaPRODUCTOS
AS
BEGIN
CREATE TABLE PRODUCTOS(
CodArticulo INT PRIMARY KEY NOT NULL,
Seccion VARCHAR(50) NOT NULL,
NombreArticulo VARCHAR(50) NOT NULL,
Precio FLOAT NOT NULL,
Fecha DATE NOT NULL,
Importado VARCHAR(50) NOT NULL,
PaisDeOrigen VARCHAR(50) NOT NULL,
Foto IMAGE NOT NULL,
)
END
GO
EXECUTE DBO.TablaPRODUCTOS
GO

CREATE PROCEDURE AlterPEDIDOS
AS
BEGIN
ALTER TABLE PEDIDOS
ADD FOREIGN KEY (FKPED_CodCLIENTE) REFERENCES CLIENTES(CodCliente)
END
GO
EXECUTE DBO.AlterPEDIDOS
GO


CREATE PROCEDURE AlterPRODUCTOSPEDIDOSnUno
AS
BEGIN
ALTER TABLE PRODUCTOSPEDIDOS
ADD FOREIGN KEY (FKPP_NumeroDePEDIDO) REFERENCES PEDIDOS (NumeroDePedido)
END
GO
EXECUTE DBO.AlterPRODUCTOSPEDIDOSnUno
GO

CREATE PROCEDURE AlterPRODUCTOSPEDIDOSnDos
AS
BEGIN
ALTER TABLE PRODUCTOSPEDIDOS
ADD FOREIGN KEY (FKPP_CodARTICULO) REFERENCES PRODUCTOS(CodArticulo)
END
GO
EXECUTE DBO.AlterPRODUCTOSPEDIDOSnDos
GO

CREATE PROCEDURE DataCLIENTES
AS
BEGIN
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('1','BELTRAN E HIJOS','LAS FUENTES 78','MADRID','(914) 45- 64- 35','ANGEL MARTINEZ','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('2','LA MODERNA','LA PALOMA 123','OVIEDO','(985) 32- 34- 34','JUAN GARCIA','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('3','EL ESPANOLITO','MOTORES 34','BARCELONA','(934) 56- 53- 43','ANA FERNANDEZ','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('4','EXPORTASA','VALLECAS 34','MADRID','(913) 45- 23- 78','ELVIRA GOMEZ','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('6','CONFECCIONES AMPARO','LOS MOROS 23','GIJON','(985) 75- 43- 32','LUIS ALVAREZ','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('7','LA CASA DEL JUGUETE','AMERICA 45','MADRID','(912) 64- 99- 87','ELIAS PEREZ','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('8','JUGUETERIA SUAREZ','PARIS 123','BARCELONA','(933) 45- 78- 66','JUAN GARCIA','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('9','ALMACEN POPULAR','LAS FUENTES 124','BILBAO','(942) 34- 71- 27','JOSE ALVAREZ','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('10','FERETERIA EL CLAVO','PASEO DE ALAMOS 78','MADRID','(914) 35- 48- 66','MANUEL MENENDEZ','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('11','JUGUETES MARTINEZ','VIA LAYETANA 245','BARCELONA','(936) 62- 85- 54','FRANCISCO CUEVAS','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('12','FERNANDEZ SL','PASEO DEL MAR 45','SANTANDER','(942) 04- 95- 86','ELISA COLLADO','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('13','CONFECCIONES ARTIMEZ','GENERAL PERON 45','A CORUNA','(981) 34- 52- 39','ESTEBAN PASCUAL','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('14','DEPORTES GARCIA','GUZMAN EL BUENO 45','MADRID','(913) 29- 94- 75','ANA JIMENEZ','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('15','EXCLUSIVAS FERNANDEZ','LLOBREGAT 250','BARCELONA','(939) 55- 83- 65','LUISA FERNANDEZ','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('16','DEPORTES MORAN','AUTONOMIA 45','LUGO','(982) 98- 69- 44','JOSE MANZANO','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('17','BAZAR FRANCISCO','CARMEN 45','ZAMORA','(980) 49- 52- 88','CARLOS BELTRAN','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('18','JUGUETES LA SONRISA','LA BAÑEZA 67','LEON','(987) 94- 53- 68','FAUSTINO PEREZ','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('19','CONFECCIONES GALAN','FUENCARRAL 78','MADRID','(913) 85- 92- 34','JUAN GARCÍA','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('20','LA CURTIDORA','OLIVARES 3','MALAGA','(953) 75- 62- 59','MARIA GOMEZ','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('21','LINEA JOVEN','SIERPES 78','SEVILLA','(953) 45- 25- 67','ASUNCIÓN SALADO','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('22','BAZAR EL BARAT','DIAGONAL 56','BARCELONA','(936) 69- 28- 66','ELISA DAPENA','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('23','EL PALACIO DE LA MODA','ORTEGA Y GASSET 129','MADRID','(927) 78- 52- 35','LAURA CARRASCO','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('24','SAEZ Y CIA','INFANTA MERCEDS 23','SEVILLA','(954) 86- 92- 34','MANUEL GUERRA','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('25','DEPORTES EL MADRILENO','CASTILLA 345','ZARAGOZA','(976) 38- 89- 34','CARLOS GONZALEZ','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('26','FERRETERIA LA ESCOBA','ORENSE 7','MADRID','(918) 45- 93- 46','JOSE GARCIA','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('27','JUGUETES EL BARATO','VIA AUGUSTA 245','BARCELONA','(933) 48- 69- 84','ELVIRA IGLESIAS','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('28','CONFECCIONES HERMINIA','CORRIDA 345','GIJON','(985) 59- 73- 15','ABEL GONZALEZ','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('30','BAZAR EL ARGENTINO','ATOCHA 55','MADRID','(912) 49- 59- 73','ADRIAN ÁLVAREZ','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('31','LA TIENDA ELEGANTE','EL COMENDADOR 67','ZARAGOZA','(975) 69- 40- 35','JOSE PASCUAL','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('32','DEPORTES NAUTICOS GARCIA','JUAN FERNANDEZ 89','AVILA','(920) 26- 86- 48','JUAN CONRADO','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('33','CONFECCIONES RUIZ','LLOBREGAT 345','BARCELONA','(934) 58- 76- 15','CARLOS SANZ','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('34','BAZAR LA FARAONA','CASTILLA Y LEoN 34','MADRID','(915) 48- 36- 27','ANGEL SANTAMARIA','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('35','FERRETERIA EL MARTILLO','CASTELLANOS 205','SALAMANCA','(923) 54- 89- 65','JOAQUIN FERNANDEZ','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('36','JUGUETES EDUCATIVOS SANZ','ORENSE 89','MADRID','(916) 87- 23- 54','PEDRO IGLESIAS','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('37','ALMACENES FERNANDEZ','ANTON 67','TERUEL','(978) 56- 40- 25','MARIA ARDANZA','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('38','CONFECCIONES MONICA','MOTORES 67','BARCELONA','(935) 68- 12- 45','PEDRO SERRANO','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('39','FERRETERIA LIMA','VALLECAS 45','MADRID','(913) 53- 27- 85','LUIS GARCIA','N/A');
INSERT INTO CLIENTES (CodCliente,Empresa,Direccion,Poblacion,Telefono,Responsable,Historial)
VALUES
('40','DEPORTES EL BRASILENO','ABEL MARTINEZ 67','SALAMANCA','(921) 54- 87- 62','CARLOS GOMEZ','N/A');
END 
GO
EXECUTE DBO.DataCLIENTES
GO

CREATE PROCEDURE DataPEDIDOS
AS
BEGIN
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('1','1','2000-03-11','CONTADO','2,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('3','23','2000-03-18','APLAZADO','6,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('5','25','2000-03-31','CONTADO','9,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('7','12','2000-04-12','CONTADO','7,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('8','1','2000-04-15','TARJETA','2,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('9','21','2000-04-21','CONTADO','4,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('13','13','2000-04-30','APLAZADO','3,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('22','7','2000-05-31','TARJETA','5,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('25','18','2000-06-02','CONTADO','6,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('27','34','2000-06-06','CONTADO','4,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('31','30','2000-06-08','TARJETA','5,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('28','28','2000-06-08','APLAZADO','8,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('47','34','2000-07-31','APLAZADO','8,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('30','2','2000-8-15','CONTADO','6,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('63','28','2000-9-10','CONTADO','9,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('77','1','2000-10-28','CONTADO','5,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('79','34','2000-12-12','CONTADO','5,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('105','30','2001-1-1','APLAZADO','9,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('102','6','2001-1-12','CONTADO','7,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('103','2','2001-1-24','CONTADO','4,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('29','30','2001-04-02','TARJETA','6,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('11','4','2001-5-1','CONTADO','8,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('16','25','2001-5-11','CONTADO','12,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('12','6','2001-5-19','CONTADO','9,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('21','16','2001-5-28','CONTADO','3,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('32','14','2001-6-4','APLAZADO','7,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('35','26','2001-6-30','CONTADO','6,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('37','24','2001-7-2','TARJETA','3,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('39','20','2001-7-8','TARJETA','6,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('43','9','2001-7-18','CONTADO','7,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('73','1','2001-8-2','CONTADO','7,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('86','9','2001-12-24','APLAZADO','3,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('98','1','2001-12-27','CONTADO','8,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('5050','30','2002-5-22','TARJETA','0,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('19','10','2002-5-22','CONTADO','7,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('34','26','2002-6-23','TARJETA','5,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('40','4','2002-7-12','CONTADO','12,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('42','34','2002-7-15','APLAZADO','7,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('44','34','2002-7-20','APLAZADO','4,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('45','30','2002-7-22','TARJETA','7,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('46','31','2002-7-25','CONTADO','6,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('5005','30','2002-8-10','TARJETA','0,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('72','1','2002-8-18','CONTADO','5,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('48','18','2002-8-30','CONTADO','3,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('49','28','2002-9-2','CONTADO','3,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('50','9','2002-9-5','APLAZADO','8,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('51','9','2002-9-5','CONTADO','5,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('74','1','2002-9-17','APLAZADO','8,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('75','1','2002-9-30','TARJETA','12,00%','FALSO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('76','1','2002-10-19','CONTADO','4,00%','VERDADERO');
INSERT INTO PEDIDOS (NumeroDePedido,FKPED_CodCLIENTE,FechaDePedido,FormaDePago,Descuento,Enviado)
VALUES
('85','4','2002-12-23','TARJETA','4,00%','FALSO');
END
GO
EXECUTE DBO.DataPEDIDOS
GO