create database Tienda
use Tienda
Select*from Existencias
CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(10, 2) NOT NULL,
    stock_actual INT NOT NULL,
    categoria VARCHAR(50) NOT NULL
);

CREATE TABLE Proveedores (
    id_proveedor INT PRIMARY KEY,
    nombre_empresa VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(20),
    direccion VARCHAR(255)
);

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255)
);

CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE DetalleVentas (
    id_detalle_venta INT AUTO_INCREMENT  PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE Existencias (
    id_existencia INT PRIMARY KEY,
    id_producto INT,
    cantidad INT NOT NULL,
    fecha_actualizacion DATE NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);


INSERT INTO Proveedores (id_proveedor, nombre_empresa, contacto, telefono, direccion)
VALUES (1, 'Distribuidora ABC', 'Juan Pérez', '555-123-4567', 'Calle 123, Ciudad'),
       (2, 'Mayorista XYZ', 'Ana Gómez', '555-987-6543', 'Avenida Principal, Ciudad');

INSERT INTO Clientes (id_cliente, nombre, telefono, direccion)
VALUES (1, 'María Rodríguez', '555-111-2222', 'Calle 456, Ciudad'),
       (2, 'Pedro Gómez', '555-333-4444', 'Avenida Secundaria, Ciudad');
INSERT INTO Ventas (fecha_venta, id_cliente)
VALUES ( '2023-07-31', 1),
       ( '2023-07-30', 2);
INSERT INTO DetalleVentas ( id_venta, id_producto, cantidad, precio_unitario, subtotal)
VALUES (1, 1, 2, 1.99, 3.98),
       (1, 3, 3, 1.25, 3.75),
       (2, 2, 5, 2.49, 12.45),
       (2, 4, 2, 3.50, 7.00);
INSERT INTO Existencias (id_existencia, id_producto, cantidad, fecha_actualizacion)
VALUES (1, 1, 100, '2023-07-31'),
       (2, 2, 80, '2023-07-31'),
       (3, 3, 50, '2023-07-31'),
       (4, 4, 120, '2023-07-31'),
       (5, 5, 60, '2023-07-31');
       
       INSERT INTO Productos (id_producto, nombre, descripcion, precio, stock_actual, categoria)
VALUES (1, 'Arroz', 'Arroz blanco de grano largo', 1.99, 100, 'Cereales'),
       (2, 'Frijoles', 'Frijoles negros', 2.49, 80, 'Cereales'),
       (3, 'Azúcar', 'Azúcar refinada', 1.25, 50, 'Endulzantes'),
       (4, 'Aceite', 'Aceite vegetal', 3.50, 120, 'Aceites'),
       (5, 'Leche', 'Leche entera', 2.20, 60, 'Lácteos');



SET @productos_detalle = '[
    {"id_producto": 1, "cantidad": 3, "precio_unitario": 1.99},
    {"id_producto": 2, "cantidad": 5, "precio_unitario": 2.49}
]';

-- Llamamos al procedimiento almacenado con los parámetros correspondientes
CALL RegistrarVenta(1, '2023-07-31', @productos_detalle);
