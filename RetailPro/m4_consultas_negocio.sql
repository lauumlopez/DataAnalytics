USE Ventas_Tech_DB;

-- === CONSULTA 1: Resumen ejecutivo mensual ===
SELECT
    MONTH(fecha_venta)                              AS mes,
    SUM(cantidad * precio_unitario)                 AS total_facturado,
    COUNT(*)                                        AS cantidad_pedidos,
    CAST(AVG(cantidad * precio_unitario) AS DECIMAL(10,2)) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta);

-- === CONSULTA 2: Ranking de productos (Top 5 por facturacion) ===
SELECT TOP 5
    id_producto,
    SUM(cantidad)                   AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;

-- === CONSULTA 3: Clientes recurrentes ===
SELECT
    id_cliente,
    COUNT(*)                        AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;

-- === CONSULTA 4: Productos por encima / por debajo del promedio ===
WITH totales_por_producto AS (
    SELECT
        id_producto,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY id_producto
)
SELECT
    id_producto,
    total_facturado,
    CASE
        WHEN total_facturado > (SELECT AVG(total_facturado) FROM totales_por_producto)
            THEN 'Por encima'
        ELSE 'Por debajo'
    END AS posicion_vs_promedio
FROM totales_por_producto;

-- === HALLAZGOS ===
-- 1. El producto que mas ingresos genero fue Laptop Pro 15, que represento casi el 56% de toda la facturacion de marzo 2024
--    con un total de 3.600 sobre 6.444.
-- 2. El Mouse Inalambrico fue el producto que mas unidades vendio (13 en total), pero eso
--    no se tradujo en mayores ingresos, ya que represento solamente el 5,6% de la facturacion.
-- 3. Los 5 clientes realizaron dos compras cada uno,lo que muestra que todos volvieron a comprar
-- sin embargo los clientes 1 y 5 fueron los que mas gastaron, concentrando entre ambos el 73,6% del total.