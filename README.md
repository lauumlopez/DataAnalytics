# RetailPro

Proyecto de análisis de datos de ventas de una tienda de tecnología. Usa SQL Server para consultar y resumir las ventas registradas entre el 5 y el 15 de marzo de 2024, y Power BI para 
visualizarlas.

## Descripción

RetailPro responde preguntas del equipo comercial a partir de la base de datos `Ventas_Tech_DB`:

- ¿Cuánto se facturó y cuál fue el ticket promedio? (6.444 en 10 pedidos, ticket promedio de 644,40)
- ¿Qué productos generan más ingresos? (la Laptop Pro 15 lidera con 3.600)
- ¿Qué clientes compran de forma recurrente? (los 5 clientes con ventas compraron 2 veces)
- ¿Qué clientes o productos no tienen ventas? (2 de 7 clientes y 2 de 8 productos)

## Herramientas utilizadas

- **SQL Server Management Studio (SSMS):** ejecución de consultas.
- **Visual Studio Code:** edición de scripts SQL.
- **Power BI:** visualización de datos.
- **GitHub:** control de versiones y documentación.

## Base de datos

Base `Ventas_Tech_DB`, con cuatro tablas:

| Tabla | Contenido |
|---|---|
| `ventas` | Registro de cada venta |
| `clientes` | Datos de los clientes |
| `productos` | Catálogo de productos |
| `categorias` | Categorías de productos |

## Estructura del repositorio

```
DataAnalytics/
├── RetailPro/
│   ├── m4_consultas_negocio.sql
│   ├── m5_consultas_joins.sql
│   └── Lopez_Laura_Checkpoint2.pbix
├── módulo_3/
└── README.md

- **RetailPro/:** carpeta con los archivos del proyecto.
  - **m4_consultas_negocio.sql:** resumen mensual, ranking de productos, clientes recurrentes y productos por encima y por debajo del promedio.
  - **m5_consultas_joins.sql:** consultas con INNER JOIN, LEFT JOIN y UNION ALL.
  - **Lopez_Laura_Checkpoint2.pbix:** reporte de Power BI.
- **módulo_3/:** entrega del módulo 3.

## Cómo ejecutar los scripts SQL

1. Abrí SQL Server Management Studio y conectate a tu servidor.
2. Abrí el script (`m4_consultas_negocio.sql` o `m5_consultas_joins.sql`).
3. Seleccioná la base de datos `Ventas_Tech_DB`.
4. Ejecutá el script con **F5**.

## Datos

10 ventas registradas entre el 5 y el 15 de marzo de 2024. Por ser un período corto, los resultados son orientativos y no representan un mes completo. Cada registro de la tabla `ventas` se cuenta como un pedido.

## Hallazgos principales

- La Laptop Pro 15 generó 3.600 de los 6.444 facturados (casi el 56%).
- El Mouse Inalámbrico fue el más vendido en unidades (13), pero solo aportó 364 (5,6%).
- Los clientes 1 y 5 gastaron 4.740 del total, cerca de tres cuartas partes de la facturación.
- **RetailPro/:** carpeta con los archivos del proyecto.
  - **m4_consultas_negocio.sql:** resumen mensual, ranking de productos, clientes recurrentes y productos por encima y por debajo del promedio.
  - **m5_consultas_joins.sql:** consultas con INNER JOIN, LEFT JOIN y UNION ALL.
  - **Lopez_Laura_Checkpoint2.pbix:** reporte de Power BI.
- **módulo_3/:** entrega del módulo 3.
