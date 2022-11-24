use `henry_checkpoint_m3`;



-- 6) La ganancia neta por sucursal es las ventas menos los gastos (Ganancia = Venta - Gasto) ¿Cuál es la sucursal con mayor ganancia neta en 2020?


-- Ventas por sucursal
drop view if exists v_Ventas_Sucursal;
create view v_Ventas_Sucursal as (
    select idsucursal, year(fecha) as fecha, 
            count(idventa) as cantidad_ventas, 
            sum(cantidad) as cantidad_items, 
            sum(precio) as total_venta-- , (sum(cantidad) * sum(precio)) as venta
    from venta
    group by idsucursal, year(fecha)-- , IdProducto, cantidad, precio
); 

-- gastos por sucursal
drop view if exists v_Gastos_Sucursal;
create view v_Gastos_Sucursal as
    (select idsucursal, year(fecha) as Year, 
    count(idgasto) as cantidad_gasto, 
    sum(monto) as total_gasto
    from gasto
    group by idsucursal, year(fecha)
);


select s.sucursal,s.IdSucursal, v.fecha, v.cantidad_items, v.total_venta , g.total_gasto, (v.total_venta - g.total_gasto) as Ganancia
from sucursal s 
    join v_ventas_sucursal v using (idsucursal)
    join v_Gastos_Sucursal g using (idsucursal)
where v.fecha = 2019 and g.year = 2019
-- group by s.sucursal,s.IdSucursal, v.fecha, g.total_gasto
; 
-- ---------------------------------------------------------------
-- ------------------######## 7 ########--------------------------
-- ---------------------------------------------------------------
-- 7) La ganancia neta por producto es las ventas menos las compras (Ganancia = Venta - Compra) ¿Cuál es el tipo de producto con mayor ganancia neta en 2020?
DROP VIEW IF EXISTS V_VENTA_TIPO_PRODUCTO;
CREATE VIEW V_VENTA_TIPO_PRODUCTO as(
    select 
        p.idTipoProducto, 
        tp.TipoProducto,
        count(p.idTipoProducto) as veces_vendido, 
        sum(v.cantidad) as items_vendidos, 
        sum(p.precio) as dinero_recolectado,
        year(v.Fecha) as Year
    from venta v
        join producto p on (v.IdProducto = p.IdProducto)
        join tipo_producto tp on (p.IdTipoProducto = tp.IdTipoProducto)
    group by p.IdTipoProducto, year(v.fecha)
);


DROP VIEW IF EXISTS V_GASTO_TIPO_PRODUCTO;
CREATE VIEW V_GASTO_TIPO_PRODUCTO as(
    select 
        p.idTipoProducto, 
        tp.TipoProducto,
        count(p.idTipoProducto) as veces_comprado, 
        sum(c.cantidad) as items_comprados, 
        sum(p.precio) as dinero_gastado,
        year(c.Fecha) as Year
    from compra c
        join producto p on (c.IdProducto = p.IdProducto)
        join tipo_producto tp on (p.IdTipoProducto = tp.IdTipoProducto)
    group by p.IdTipoProducto, year(c.fecha)
);


select 
    v.idtipoproducto,
    v.tipoproducto,
    v.year,
    v.dinero_recolectado,
    g.dinero_gastado,
    (v.dinero_recolectado - g.dinero_gastado) as Ganancia    
from 
v_venta_tipo_producto v join v_gasto_tipo_producto g 
    on (v.IdTipoProducto = g.IdTipoProducto)
where v.year = 2019 and g.year = 2019
;

-- ---------------------------------------------------------------
-- ------------------######## 8 ########--------------------------
-- ---------------------------------------------------------------

--  8) Del total de clientes que realizaron compras en 2020 ¿Qué porcentaje lo hizo sólo en una única sucursal?

select count(distinct(idcliente))
from venta
where year(fecha) = 2020
;

select 
    count(idcliente), 
    (select count(distinct(idcliente))
     from venta
     where
         year(fecha) = 2019
    ) * 100
from (
    select 
        IdCliente,
        count(idsucursal) as cant_sucursal
    from (
        select
        distinct(idcliente),
        IdSucursal
        from venta
        where year(fecha) = 2019
        order by idcliente
    ) as detalle
    group by idcliente
    having cant_sucursal > 1
) as deatlle2
;
select (602/2415) ;
/*join venta v on v.IdCliente = c.IdCliente and year(v.fecha) = 2020
join sucursal s on s.idsucursal = v.idsucursal
group by c.idcliente
having total_sucursales = 1*/
;

-- ----------------------------------------------------------------
-- ------------------######## 11 ########--------------------------
-- ----------------------------------------------------------------
-- 11) ¿Qué cantidad de clientes realizó compras sólo por el canal OnLine entre 2019 y 2020? 33
SELECT 
    COUNT(v.IdCliente),
    c.canal, 
    YEAR(v.fecha) AS año
FROM
    venta v JOIN canal_venta c 
        USING (idcanal)
WHERE
    c.canal = 'Presencial'
GROUP BY c.canal , año;



-- ----------------------------------------------------------------
-- ------------------######## 12 ########--------------------------
-- ----------------------------------------------------------------
-- 12) ¿Cuál es la sucursal que más Venta (Precio * Cantidad) hizo en 2019 a clientes que viven fuera de su provincia?
-- ubicacion exacta cliente
DROP VIEW IF EXISTS V_UBICACION_EXACTA_CLIENTE;
CREATE VIEW V_UBICACION_EXACTA_CLIENTE AS
    select 
        c.idcliente,
        l.localidad Localidad_Cliente,
        p.provincia Provincia_Cliente
    from cliente c
        join localidad l
            using(idlocalidad)
        join provincia p
            using(idprovincia)
;

-- ubicacion exacta sucursal
DROP VIEW IF EXISTS V_UBICACION_EXACTA_SUCURSAL;
CREATE VIEW V_UBICACION_EXACTA_SUCURSAL AS
    select 
        s.idsucursal,
        l.localidad Localidad_Sucursal,
        p.provincia Provincia_Sucursal
    from sucursal s
        join localidad l
            using(idlocalidad)
        join provincia p
            using(idprovincia)
;

select 
    -- v.idventa,
    s.provincia_sucursal,
    -- count(s.provincia_sucursal),
    -- c.provincia_cliente,
    (v.cantidad), 
    (v.precio), 
    (sum(v.cantidad)*sum(v.precio)) Total_Venta, 
    year(v.fecha) Anio
from venta v
    join v_ubicacion_exacta_sucursal s
        using (idsucursal)
    join v_ubicacion_exacta_cliente c
        using (idcliente)
where s.provincia_sucursal != c.provincia_cliente and year(fecha) = 2019
group by
    v.idventa,
    -- s.provincia_sucursal,
    -- c.provincia_cliente,
    -- v.cantidad, 
    -- v.precio, 
    -- (v.cantidad*v.precio), 
    year(v.fecha)
;



-- ----------------------------------------------------------------
-- ------------------######## 15 ########--------------------------
-- ----------------------------------------------------------------
-- 15) ¿Cuál es el código de empleado del empleado que mayor comisión obtuvo en diciembre del año 2020?

DROP VIEW IF EXISTS V_COMISIONES;
CREATE VIEW V_COMISIONES AS (
    select *
    from `Comisiones_Córdoba_Centro`
        union 
    select * 
    from `Comisiones_Córdoba_Cerro_de_las_Rosas`
        union
    select *
    from `Comisiones_Córdoba_Quiroz`
);
    
select codigoempleado, count(codigoempleado)
from V_COMISIONES
group by 
    codigoempleado
;


















