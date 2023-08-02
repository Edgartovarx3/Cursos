-- Esta consulta muestra información sobre una venta específica, incluyendo detalles de los productos vendidos y datos del cliente asociado.

-- Seleccionamos los campos relevantes de las tablas "Ventas", "DetalleVentas", "Productos" y "Clientes".
SELECT V.id_venta, V.fecha_venta, C.nombre AS nombre_cliente, P.nombre AS nombre_producto, DV.cantidad, DV.precio_unitario, DV.subtotal

-- Comenzamos un INNER JOIN entre la tabla "Ventas" (alias V) y la tabla "DetalleVentas" (alias DV) utilizando la columna "id_venta" como condición de unión.
FROM Ventas V
INNER JOIN DetalleVentas DV ON V.id_venta = DV.id_venta

-- Continuamos el INNER JOIN entre la tabla "DetalleVentas" (alias DV) y la tabla "Productos" (alias P) utilizando la columna "id_producto" como condición de unión.
INNER JOIN Productos P ON DV.id_producto = P.id_producto

-- Finalizamos el INNER JOIN entre la tabla "Ventas" (alias V) y la tabla "Clientes" (alias C) utilizando la columna "id_cliente" como condición de unión.
INNER JOIN Clientes C ON V.id_cliente = C.id_cliente

-- Agregamos una condición WHERE para filtrar los resultados y mostrar solo la información de la venta con ID igual a 1.
WHERE V.id_venta = 1;
