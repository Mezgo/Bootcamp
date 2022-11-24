USE M3_2;
-- 1) Obtener un listado del nombre y apellido de cada cliente que haya adquirido algun producto junto al id del producto y su respectivo precio.
SELECT DISTINCT
    c.Nombre_Y_Apellido,
    v.idcliente,
    p.Producto,
    v.idproducto,
    v.Precio
FROM
    venta v
        JOIN
    cliente c ON (v.idcliente = c.idcliente)
        JOIN
    producto p ON (v.idproducto = p.idproducto);

-- 2) Obteber un listado de clientes con la cantidad de productos adquiridos, incluyendo aquellos que nunca compraron algún producto.

SELECT c.idcliente, c.nombre_y_apellido, sum(ifnull(v.cantidad,0)) as Compras
FROM Cliente c left join venta v using (idcliente)
group by  c.idcliente, c.nombre_y_apellido;

SELECT 
    idcliente, idproducto, cantidad, year(fecha)
FROM
    venta;

-- 3) Obtener un listado de cual fue el volumen de compra (cantidad) por año de cada cliente.

SELECT
    idcliente,
    COUNT(idcliente) AS Volumen_Compras,
    SUM(cantidad) AS Total_Items,
    YEAR(fecha)
FROM
    venta
GROUP BY IdCliente , YEAR(Fecha);

-- 4) Obtener un listado del nombre y apellido de cada cliente que haya adquirido algun producto junto al id del producto, la cantidad de productos adquiridos y el precio promedio.

SELECT 
    v.idcliente,
    c.Nombre_Y_Apellido,
    v.idproducto,
    p.Producto,
    sum(v.cantidad) as Q_productos,
    round(avg(v.precio),2) as Precio_Promedio
    
FROM
    venta v
        JOIN
    cliente c ON (v.idcliente = c.idcliente)
        JOIN
    producto p ON (v.idproducto = p.idproducto)
group by 
    v.idcliente,
    c.Nombre_Y_Apellido,
    v.idproducto,
    p.Producto;

SELECT 
    idcliente, idproducto, cantidad, year(fecha)
FROM
    venta;
    
-- 5) Cacular la cantidad de productos vendidos y la suma total de ventas para cada localidad, presentar el análisis en un listado con el nombre de cada localidad.

select s.sucursal, v.IdProducto, v.Cantidad
from venta v join sucursal s on (v.IDSucursal=s.IDSucursal);

select l.idlocalidad, l.localidad, sum(v.cantidad) AS cantidad_productos, SUM(v.Precio * v.Cantidad) as total_ventas, count(v.idventa) as Volumen
from venta v
    join sucursal s using (idsucursal)
    join localidad l using (idlocalidad)
WHERE v.Outlier = 1
group by l.IdLocalidad;

-- 7) Obtener un listado de dos campos en donde por un lado se obtenga la cantidad de productos vendidos por rango etario y las ventas totales en base a esta misma dimensión. El resultado debe obtenerse en un solo listado.

select *
from venta;

-- 8