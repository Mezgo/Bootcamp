use `checkpoint_m2`;

-- 7 productos que cuestan menos de 100

select precio, count(*) as cantidad
from producto
where precio < 100
group by precio;

-- 8 productos que su tipo comiense por I
select tipo, count(*) as cantidad from producto where tipo like 'I%' group by tipo;

-- 9 canal con menos ventas en 2020
select idcanal, year(fecha) as año, count(idventa) as cantidad_ventas, count(cantidad)
from venta v
where year(v.fecha) like 2020
group by idcanal, año
order by idcanal asc;

-- 10  Considerando todos los registros, ¿Cuál fue la sucursal con mayor cantidad de productos vendidos?
select idsucursal, count(cantidad) as cantidad_ventas
from venta
group by IdSucursal
order by cantidad_ventas asc;

-- 11  Considerando el año 2017, ¿Cuál fue el mes (considerando la fecha de venta, es decir, usando el campo Fecha) 
-- con mayor monto total de venta (monto de venta = Precio*Cantidad) para el empleado 1426?
select fecha, month(fecha), idempleado, precio*cantidad as monto_venta
from venta v
where year(v.fecha) like 2017 and v.idempleado like 1426
order by monto_venta desc;

-- 12 ¿Cuál es el canal de venta que tiene el segundo mayor monto total de venta en 2020? 
select idcanal, year(fecha) as año, count(idventa) as cantidad_ventas, max(cantidad*precio) as monto_ventas
from venta v
where year(v.fecha) like 2020
group by idcanal, año
order by monto_ventas desc;

-- 13
SELECT MONTH(v.Fecha) AS mes, YEAR (v.Fecha) AS año, avg(timestampdiff (DAY, v.Fecha, v.Fecha_Entrega)) AS promedio
FROM venta V
GROUP BY MONTH(v.Fecha), year(v.fecha)
ORDER BY promedio ASC;

-- 14 productos con GB en su concepto

select count(*) as cantidad_total
from producto p
where p.concepto like '%GB%' and p.precio < 400;