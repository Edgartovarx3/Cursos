CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarVenta`(
    IN cliente_id INT,
    IN fecha_venta DATE,
    IN productos_detalle JSON
)
BEGIN
    -- Variable para almacenar el ID de la venta recién insertada
    DECLARE venta_id INT;
        -- Variables para iterar a través del JSON
    DECLARE indice INT DEFAULT 0;
    DECLARE total_productos INT;
    
    -- Inserción de la venta en la tabla Ventas
    INSERT INTO Ventas (fecha_venta, id_cliente)
    VALUES (fecha_venta, cliente_id);
    
    -- Obtener el ID de la venta recién insertada
    SET venta_id = LAST_INSERT_ID();
    

    
    -- Obtener la cantidad total de productos en el JSON
    SET total_productos = JSON_LENGTH(productos_detalle);
    
    -- Iterar a través de los detalles de los productos vendidos
    -- y realizar la inserción en la tabla DetalleVentas
    WHILE indice < total_productos DO
        -- Obtener el ID del producto y su cantidad desde el JSON
        SET @id_producto = JSON_UNQUOTE(JSON_EXTRACT(productos_detalle, CONCAT('$[', indice, '].id_producto')));
        SET @cantidad = JSON_UNQUOTE(JSON_EXTRACT(productos_detalle, CONCAT('$[', indice, '].cantidad')));
        SET @precio_unitario = JSON_UNQUOTE(JSON_EXTRACT(productos_detalle, CONCAT('$[', indice, '].precio_unitario')));

        -- Calcular el subtotal del producto
        SET @subtotal = @cantidad * @precio_unitario;
        
        -- Inserción del detalle de venta en la tabla DetalleVentas
        INSERT INTO DetalleVentas (id_venta, id_producto, cantidad, precio_unitario, subtotal)
        VALUES (venta_id, @id_producto, @cantidad, @precio_unitario, @subtotal);
        
        -- Actualizar la tabla Existencias restando la cantidad vendida del stock_actual
        UPDATE Existencias
        SET cantidad = cantidad - @cantidad
        WHERE id_producto = @id_producto;
        
        -- Incrementar el índice para obtener el siguiente producto del JSON
        SET indice = indice + 1;
    END WHILE;
    
    -- Final del procedimiento
END