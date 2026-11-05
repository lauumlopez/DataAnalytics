USE Ventas_Tech_DB;

-- Consulta 1: Vista base del proyecto (INNER JOIN)
-- Proposito: ver cada venta con cliente, ciudad, producto y categoria en una sola fila.
SELECT
    v.fecha_venta,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.ciudad,
    p.nombre_producto,
    cat.nombre_categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN productos p ON v.id_producto = p.id_producto
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria;

-- Hallazgo: Computacion es la categoria que mas factura (4.950 de 6.444) y Buenos Aires la ciudad que mas compra.

-- Consulta 2: Clientes sin ventas (LEFT JOIN)
-- Proposito: detectar clientes registrados que nunca compraron, para que CRM los contacte.
SELECT c.nombre, c.email, c.fecha_registro
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

-- Hallazgo: 2 de los 7 clientes nunca compraron; CRM deberia contactarlos.

-- Consulta 3: Productos sin ventas (LEFT JOIN)
-- Proposito: identificar productos del catalogo que no tienen ninguna venta.
SELECT p.nombre_producto, cat.nombre_categoria, p.precio
FROM productos p
LEFT JOIN ventas v ON p.id_producto = v.id_producto
LEFT JOIN categorias cat ON p.id_categoria = cat.id_categoria
WHERE v.id_venta IS NULL;

-- Hallazgo: 2 de los 8 productos no tienen ventas; el area de producto puede revisar si los promociona.

-- Consulta 4: Consolidado por periodo (UNION ALL)
-- Proposito: comparar lo vendido en dos periodos de marzo.
SELECT periodo, SUM(total) AS total_periodo
FROM (
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Periodo 1 (5 al 10 de marzo)' AS periodo
    FROM ventas
    WHERE fecha_venta <= '2024-03-10'
    UNION ALL
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Periodo 2 (11 al 15 de marzo)' AS periodo
    FROM ventas
    WHERE fecha_venta >= '2024-03-11'
) AS consolidado
GROUP BY periodo;

-- Hallazgo: el primer periodo vendio 3.620 y el segundo 2.824, o sea que las ventas bajaron.