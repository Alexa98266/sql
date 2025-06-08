
-- Paso 1: Crear la base de datos
CREATE DATABASE IF NOT EXISTS prueba_seguridad;
USE prueba_seguridad;

-- Paso 2: Crear la tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50),
    correo VARCHAR(100),
    contrasena VARCHAR(100)
);

-- Insertar datos en la tabla de usuarios
INSERT INTO usuarios (nombre_usuario, correo, contrasena) VALUES
('admin', 'admin@ejemplo.com', 'admin123'),
('usuario1', 'usuario1@ejemplo.com', 'userpass1');

-- Crear la tabla de productos
CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio DECIMAL(10,2)
);

-- Insertar datos en la tabla de productos
INSERT INTO productos (nombre_producto, precio) VALUES
('Laptop', 950.00),
('Mouse', 25.00);

-- Paso 3: Ejemplo de prueba de inyección SQL (UNIÓN)
-- Supongamos que se ejecuta desde un campo de búsqueda vulnerable en la tabla usuarios:
-- Entrada maliciosa simulada (por ejemplo, en un formulario de búsqueda):
-- ' UNION SELECT NULL, nombre_producto, precio FROM productos --

-- Consulta real que podría ejecutarse si no hay validación:
SELECT id, nombre_usuario, correo FROM usuarios WHERE nombre_usuario = '' UNION SELECT NULL, nombre_producto, precio FROM productos;
