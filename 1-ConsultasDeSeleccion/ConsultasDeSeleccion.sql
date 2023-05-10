
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
