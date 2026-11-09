# RetailPro

Proyecto de análisis de datos de ventas de una tienda de tecnología. Usa SQL Server para consultar y resumir las ventas de marzo 2024, y Power BI para visualizarlas.

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
RetailPro/
├── m4_consultas_negocio.sql
├── m5_consultas_joins.sql
├── Lopez_Laura_Checkpoint2.pbix
└── README.md
```

- **m4_consultas_negocio.sql:** resumen mensual, ranking de productos, clientes recurrentes y productos por encima y por debajo del promedio.
- **m5_consultas_joins.sql:** consultas con INNER JOIN, LEFT JOIN y UNION ALL.
- **Lopez_Laura_Checkpoint2.pbix:** re
