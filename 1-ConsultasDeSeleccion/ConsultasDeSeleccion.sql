
USE GestionDePedidos
GO




--Todos los clientes de Madrid
SELECT * FROM CLIENTES C WHERE C.Poblacion = 'MADRID'
GO
--SKU (NombreSKU,Seccion,Precio), de la seccion CERAMICA.
SELECT P.NombreArticulo, P.Seccion, P.Precio FROM PRODUCTOS P WHERE P.Seccion = 'CERAMICA'
GO
--SKU, de la sección CERAMICA & DEPORTES
SELECT * FROM PRODUCTOS P WHERE P.Seccion = 'CERAMICA' OR P.Seccion = 'DEPORTES' ORDER BY P.Seccion ASC
GO
--SKU, de la sección DEPORTES & Origen Americanos
SELECT * FROM PRODUCTOS P WHERE P.Seccion = 'DEPORTES' AND P.PaisDeOrigen = 'USA' ORDER BY P.Precio ASC
GO
--SKU, cuyo PRECIO supere 300 E
SELECT * FROM PRODUCTOS P WHERE P.Precio > 300
GO
--SKU, de marzo(1-31) & abril(1-30) del 2000
SELECT * FROM PRODUCTOS P WHERE P.Fecha BETWEEN '2000-03-01' AND '2000-04-30' ORDER  BY P.Fecha
GO
-- “Empresa” y “Población” de la tabla “Clientes”.
SELECT C.Empresa, C.Poblacion FROM CLIENTES C
GO
--SKU de la sección “Cerámica”.
SELECT * FROM PRODUCTOS P WHERE P.Seccion = 'CERAMICA'
GO
/*Realizar una consulta que muestre los productos de la sección “Deportes”  cuyo precio esté entre 100 y 200 €.
En la consulta solo se mostrarán los campos “Nombre de artículo” y “Precio”.*/
SELECT P.NombreArticulo, P.Precio FROM PRODUCTOS P WHERE P.Seccion = 'DEPORTES'  AND P.Precio >= '100' AND P.Precio <='200'
GO
SELECT P.NombreArticulo, P.Precio FROM PRODUCTOS P WHERE P.Precio BETWEEN '100' AND '200' AND P.Seccion = 'DEPORTES'
GO
--SKU cuyo país no sea Espana.
SELECT * FROM PRODUCTOS P WHERE P.PaisDeOrigen <> 'ESPANA' ORDER BY P.PaisDeOrigen
GO
/*Realizar una consulta que muestre los artículos españoles de la sección “Deportes” o aquellos cuyo precio sea superior a 350 € 
independientemente de cual sea su sección o país de origen.*/
SELECT * FROM PRODUCTOS P WHERE (P.PaisDeOrigen = 'ESPANA' AND P.Seccion = 'DEPORTES') OR P.Precio > '350' ORDER BY P.PaisDeOrigen, P.Precio
GO
/*Realizar una consulta que muestre los productos cuya fecha esté entre 1/05/2001 y 15/12/2001. 
En la consulta solo se visualizarán los campos “Nombre de artículo”, “Sección” y “Fecha”.*/
SELECT P.NombreArticulo, P.Seccion, P.Fecha FROM PRODUCTOS P WHERE P.Fecha BETWEEN '2001-05-01' AND '2001-12-15'  ORDER BY P.Fecha, P.NombreArticulo
GO




--SKU, de las secciones deportes, ceramica. Ordenados por sección
SELECT * FROM PRODUCTOS P WHERE P.Seccion = 'DEPORTES' OR P.Seccion = 'CERAMICA' ORDER BY P.Seccion DESC
GO
--SKU, de las secciones deportes, ceramica. Ordenados por precio
SELECT * FROM PRODUCTOS P WHERE P.Seccion = 'DEPORTES' OR P.Seccion = 'CERAMICA' ORDER BY P.Precio  ASC
GO
--SKU, de las secciones deportes, ceramica. Ordenados por Seccion & Precio
SELECT * FROM PRODUCTOS P WHERE P.Seccion = 'DEPORTES' OR P.Seccion = 'CERAMICA' ORDER BY P.Seccion ASC, P.Precio DESC
GO
--SKU, de las secciones deportes, ceramica. Ordenados por Seccion & PaisDeOrigen & Precio
SELECT * FROM PRODUCTOS P WHERE P.Seccion = 'DEPORTES' OR P.Seccion = 'CERAMICA' ORDER BY P.Seccion ASC, P.PaisDeOrigen ASC, P.Precio ASC
GO
/*Realizar una consulta que muestre aquellos productos españoles cuya fecha esté comprendida entre febrero y mayo del 2002. 
Ordenar los resultados por el campo “Nombre artículo” descendentemente.*/
SELECT * FROM PRODUCTOS P WHERE P.Fecha BETWEEN '2002-01-01' AND '2002-05-31' AND P.PaisDeOrigen = 'ESPANA' ORDER BY P.NombreArticulo DESC
GO
/*Realizar una consulta que muestre los campos “Empresa”, “Dirección” y “Población” de la tabla “Clientes”. 
Ordenar la consulta por el campo “Población” ascendentemente y por “Dirección” descendentemente.*/
SELECT C.Empresa, C.Direccion, C.Poblacion FROM CLIENTES C ORDER BY C.Poblacion ASC, C.Direccion DESC
GO
--Realizar una consulta que muestre todos los campos de la tabla “Clientes”. Ordenar los resultados por el campo “Población” ascendentemente.
SELECT * FROM CLIENTES C ORDER BY C.Poblacion ASC
GO




--¿Cuantos SKU, existen por seccion?
SELECT P.Seccion, COUNT(P.CodArticulo) AS Existentes FROM PRODUCTOS P GROUP BY P.Seccion ORDER BY P.Seccion ASC 
GO
--¿Media del precio SKU, por seccion?
SELECT P.Seccion, ROUND(AVG(P.Precio),2) AS Media FROM PRODUCTOS P GROUP BY P.Seccion ORDER BY P.Seccion ASC, Media ASC
GO
--¿Cuantos clientes, existen por pais?
SELECT C.Poblacion, COUNT(C.CodCliente) AS Numero FROM CLIENTES C GROUP BY C.Poblacion ORDER BY C.Poblacion ASC, Numero ASC
GO
--¿Cuantos SKU, por Origen?
SELECT P.PaisDeOrigen, COUNT(P.CodArticulo) AS Numero FROM PRODUCTOS P GROUP BY P.PaisDeOrigen ORDER BY P.PaisDeOrigen ASC, Numero ASC
GO
--¿Valor neto Precio-SKU, por seccion?
SELECT P.Seccion, SUM(P.Precio) AS Neto FROM PRODUCTOS P GROUP BY P.Seccion ORDER BY Neto 
GO
--Media del Precio-SKU. Secciones Deportes & Ceramica
SELECT P.Seccion, ROUND(AVG(P.Precio),2) Media FROM PRODUCTOS P GROUP BY P.Seccion HAVING P.Seccion = 'DEPORTES' OR P.Seccion = 'CERAMICA'
GO
--Precio del SKU mas caro, de la seccion: Confeccion
SELECT P.Seccion, MAX(P.Precio) MaximoValor FROM PRODUCTOS P WHERE P.Seccion = 'CONFECCION' GROUP BY P.Seccion
GO
/*Realizar una consulta sobre la tabla “Clientes”  que muestre los campos “Dirección”, “Teléfono” y “Población”. 
Este último debe aparecer en la consulta con el nombre de “Residencia”. 
Los registros aparecerán ordenados descendentemente por el campo “Población”.*/
SELECT C.Direccion, C.Telefono, C.Poblacion AS Residencia FROM CLIENTES C ORDER BY C.Poblacion DESC
GO
--Realizar una consulta que muestre que poblaciones hay en la tabla “Clientes”.
SELECT C.Poblacion FROM CLIENTES C GROUP BY C.Poblacion
GO
/*Realizar una consulta de agrupación que muestre la media del precio de los artículos de todas las secciones. 
Mostrar en la consulta los campos sección y suma por sección.*/
SELECT P.Seccion, AVG(P.Precio) AS SumaPorSeccion FROM PRODUCTOS P GROUP BY P.Seccion
GO
/*Realizar una consulta de agrupación que muestre la media del precio de todas las secciones menos de juguetería.
En la consulta deberán aparecer los campos “Sección” y “Media por sección”.*/
SELECT P.Seccion, AVG(P.Precio) AS MediaPorSeccion FROM PRODUCTOS P WHERE P.Seccion <> 'JUGUETERIA' GROUP BY P.Seccion
GO
--Realizar Una consulta que muestre cuantos artículos hay de la sección “Deportes”.
SELECT P.Seccion, COUNT(P.CodArticulo) AS TotalSKU FROM PRODUCTOS P GROUP BY P.Seccion HAVING P.Seccion = 'DEPORTES'
GO




--Precio-SKU incluido impuesto IVA del 20%
SELECT P.CodArticulo, P.Seccion, P.NombreArticulo, P.Precio, (P.Precio*20/100) AS IVA, ROUND(P.Precio + (P.Precio*20/100),2) AS ValorNeto, P.Fecha, P.Importado, P.PaisDeOrigen, P.Foto FROM PRODUCTOS P
GO
--En un campo nuevo, imprimir el descuento del 3%, en todos los SKU
SELECT P.CodArticulo, P.Seccion, P.NombreArticulo, P.Precio, (P.Precio*3)/100 AS Descuento, P.Precio - (P.Precio*3)/100 AS ValorNeto, P.Fecha, P.Importado, P.PaisDeOrigen, P.Foto FROM PRODUCTOS P 
GO
--En un campo nuevo, imprimir el descuento del 3Euros, en todos los SKU
SELECT P.CodArticulo, P.Seccion, P.NombreArticulo, P.Precio AS ValorActual, (P.Precio-3) AS ValorNeto, P.Fecha, P.Importado, P.PaisDeOrigen, P.Foto FROM PRODUCTOS P
GO
--¿Diferencia en años, entre la fecha actual, y la del SKU? 
SELECT P.CodArticulo, P.Seccion, P.NombreArticulo, P.Precio, P.Fecha, P.Importado, P.PaisDeOrigen, P.Foto, (YEAR(GETDATE())-YEAR(P.Fecha)) AS AñosDeDiferencia FROM  PRODUCTOS P WHERE P.Seccion = 'DEPORTES' ORDER BY P.Fecha ASC
GO
--¿Diferencia en  días, entre la fecha actual, y la del SKU? 
SELECT P.CodArticulo,P.Seccion,P.NombreArticulo,P.Precio,P.Fecha,P.Importado,P.PaisDeOrigen,P.Foto, DATEDIFF(DAY, DAY(GETDATE()), P.Fecha) AS DiasDeDiferencia FROM  PRODUCTOS P
GO
/*Realizar una consulta que visualice los campos NOMBRE ARTÍCULO, SECCIÓN, PRECIO de la tabla PRODUCTOS y un campo nuevo que nombramos con el texto “DESCUENTO_7”. 
Debe mostrar el resultado de aplicar sobre el campo PRECIO un descuento de un 7 %. El formato del nuevo campo para debe aparecer con 2 lugares decimales.*/
SELECT P.NombreArticulo, P.Seccion, P.Precio, ROUND((P.Precio-(P.Precio*7)/100),2) AS DESCUENTO_7 FROM PRODUCTOS P
GO
/*Realizar una consulta visualizando los campos FECHA, SECCIÓN, NOMBRE ARTÍCULO y PRECIO de la tabla PRODUCTOS 
y un campo nuevo que nombramos con el texto “DTO2 €_EN_CERÁMICA”. 
Debe mostrar el resultado de aplicar sobre el campo PRECIO la resta de 2 € sólo a los artículos de la sección CERÁMICA. 
El formato del nuevo campo debe aparecer con 2 lugares decimales. Ordenar el resultado de la consulta por el campo FECHA descendente.*/
SELECT P.Fecha, P.Seccion, P.NombreArticulo, P.Precio, CASE WHEN P.Seccion <> 'CERAMICA' THEN  '0' ELSE ROUND((P.Precio -2),2) END AS DTO2_EN_CERAMICA FROM PRODUCTOS P ORDER BY P.Seccion, P.Fecha DESC
GO
SELECT P.Fecha, P.Seccion, P.NombreArticulo, P.Precio, ROUND((P.Precio-2),2) AS DTO2_EN_CERAMICA FROM PRODUCTOS P WHERE P.Seccion = 'CERAMICA' ORDER BY P.Fecha DESC
GO
/*Realizar una consulta visualizando los campos NOMBRE ARTÍCULO, SECCIÓN, PRECIO de la tabla PRODUCTOS y un campo nuevo que nombramos con el texto “PRECIO_AUMENTADO_EN_2”. 
Debe mostrar el PRECIO con un incremento de un 2% del PRECIO. Sólo debemos tener en cuenta los registros de la sección FERRETERÍA. 
El nuevo campo debe aparecer en Euros y con 2 lugares decimales.*/
--PRECIO_AUMENTADO_EN_2
SELECT P.NombreArticulo, P.Seccion, P.Precio AS ValorInicial, ROUND((P.Precio + (P.Precio*2)/100),2) PRECIO_AUMENTADO_EN_2 FROM PRODUCTOS P WHERE P.Seccion = 'FERRETERIA'
GO




--MULTITABLA 
--SKU de las secciones DEPORTES & DEPORTES DE RIESGO
SELECT * FROM PRODUCTOS P WHERE P.Seccion = 'DEPORTES' UNION ALL SELECT * FROM PRODUCTOSNro2 R WHERE R.Seccion = 'DEPORTES DE RIESGO' ORDER BY P.PaisDeOrigen ASC
GO
--SKU cuyo precio es >500 & Seccion SKU es ALTA COSTURA
SELECT * FROM PRODUCTOS P WHERE P.Precio >500 UNION ALL SELECT * FROM PRODUCTOSNro2 R WHERE R.Seccion = 'ALTA COSTURA' ORDER BY P.Seccion ASC
GO
--¿Que clientes realizaron pedidos en marzo del 2000?
SELECT * FROM PEDIDOS P INNER JOIN CLIENTES C ON P.FKPED_CodCLIENTE = C.CodCliente WHERE P.FechaDePedido BETWEEN '2000-03-01' AND '2000-03-31' ORDER BY P.FechaDePedido ASC
GO
--Clientes de Madrid. Imprimir(NumeroDePedido,Empresa,Poblacion,Enviado)
SELECT P.NumeroDePedido, C.Empresa, C.Poblacion, P.Enviado FROM PEDIDOS P INNER JOIN CLIENTES C ON P.FKPED_CodCLIENTE = C.CodCliente WHERE C.Poblacion = 'MADRID'
ORDER BY P.Enviado ASC
GO




--Todos los Pedidos(NroPedido,CodCliente,FormaDePago) que han realizado los clientes(CodCliente,) de Madrid
SELECT P.NumeroDePedido, P.FKPED_CodCLIENTE, P.FormaDePago, C.CodCliente FROM PEDIDOS P
INNER JOIN CLIENTES C
ON P.FKPED_CodCLIENTE = C.CodCliente
WHERE C.Poblacion = 'MADRID'
GO
--¿Clientes de Madrid que no han realizado pedidos?
SELECT * FROM CLIENTES C
LEFT JOIN PEDIDOS P
ON C.CodCliente = P.FKPED_CodCLIENTE
WHERE C.Poblacion = 'MADRID' AND P.NumeroDePedido IS NULL
GO




--Consulta que nos devuleva el nombre y la seccion de los Precios-SKU, que sean superior a la media
SELECT A.NombreArticulo, A.Seccion, A.Precio FROM PRODUCTOS A WHERE A.Precio > (SELECT AVG(B.Precio) FROM PRODUCTOS B) ORDER BY A.Seccion ASC
GO
--SKU cuyo valor es mayor que todos los SKU de CERAMICA
SELECT * FROM PRODUCTOS A WHERE A.Precio > ALL (SELECT B.Precio FROM PRODUCTOS B WHERE B.Seccion = 'CERAMICA') ORDER BY A.Seccion ASC
GO
--SKU cuyo precio sea mayor a los precios de los SKU de JUGUETERIA
SELECT * FROM PRODUCTOS A WHERE A.Precio > ALL (SELECT B.Precio FROM PRODUCTOS B WHERE B.Seccion = 'JUGUETERIA') ORDER BY A.Seccion ASC
GO




--IN NOT IN
--Nombre y precio de los SKU que se han pedido con mas de 20 unidades
SELECT B.NombreArticulo, B.Precio, A.Unidades FROM PRODUCTOSPEDIDOS A
INNER JOIN PRODUCTOS B
ON A.FKPP_CodARTICULO = B.CodArticulo
WHERE A.Unidades IN (SELECT B.Unidades FROM PRODUCTOSPEDIDOS B WHERE B.Unidades > '20') ORDER BY A.Unidades ASC
GO
--Clientes que no han pagado con tarjeta
SELECT * FROM PEDIDOS A
INNER JOIN CLIENTES B
ON A.FKPED_CodCLIENTE = B.CodCliente 
WHERE A.FormaDePago IN
(SELECT C.FormaDePago FROM PEDIDOS C WHERE C.FormaDePago <> 'TARJETA') ORDER BY A.FormaDePago ASC
GO
--Clientes que no solicitaron pedidos
SELECT * FROM CLIENTES C  WHERE C.CodCliente NOT IN
(SELECT B.CodCliente FROM PEDIDOS A INNER JOIN CLIENTES B  ON A.FKPED_CodCLIENTE = B.CodCliente)
