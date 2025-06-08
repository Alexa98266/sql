-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS seguridad_web;
USE seguridad_web;

-- Crear la tabla de usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    correo VARCHAR(100),
    contraseña VARCHAR(255)
);

-- Insertar datos en la tabla de usuarios
INSERT INTO usuarios (nombre, correo, contraseña) VALUES
('Ana Torres', 'ana@example.com', 'ana123'),
('Luis Gómez', 'luis@example.com', 'luis456'),
('Marta Rojas', 'marta@example.com', 'marta789');

-- Crear la tabla de productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio DECIMAL(10,2),
    stock INT
);

-- Insertar datos en la tabla de productos
INSERT INTO productos (nombre_producto, precio, stock) VALUES
('Teclado mecánico', 150.00, 25),
('Mouse inalámbrico', 45.50, 50),
('Monitor 24 pulgadas', 220.00, 10);
