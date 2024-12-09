-- Crear la base de datos
CREATE DATABASE bproductos;

-- Usar la base de datos creada
USE bproductos;

-- Tabla: clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    latitud DOUBLE,
    longitud DOUBLE
);

-- Tabla: productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    stock INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

-- Tabla: sucursales
CREATE TABLE sucursales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    latitud DOUBLE,
    longitud DOUBLE
);

-- Tabla: compras
CREATE TABLE compras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    producto_id INT NOT NULL,
    sucursal_id INT NOT NULL,
    fecha DATETIME NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id),
    FOREIGN KEY (sucursal_id) REFERENCES sucursales(id)
);

-- Tabla: devoluciones
CREATE TABLE devoluciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    compra_id INT NOT NULL,
    motivo VARCHAR(255),
    fecha DATETIME NOT NULL,
    producto_id INT NOT NULL,
    sucursal_id INT NOT NULL,
    FOREIGN KEY (compra_id) REFERENCES compras(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id),
    FOREIGN KEY (sucursal_id) REFERENCES sucursales(id)
);
