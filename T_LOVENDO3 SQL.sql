
CREATE DATABASE t_lovendo3;

-- se crea la tabla proveedores --

CREATE TABLE proveedores (
  proveedor_id INT PRIMARY KEY,
  nombre VARCHAR(255),
  rep_legal VARCHAR(255),
  fono1 VARCHAR(20),
  fono2 VARCHAR(20),
  contacto VARCHAR(255),
  correo VARCHAR(255)
);

-- se crea la tabla clientes --

CREATE TABLE clientes (
  cliente_id INT PRIMARY KEY,
  nombres VARCHAR(255),
  apellidos VARCHAR(255),
  direccion VARCHAR(255)
);

-- se crea la tabla productos --

CREATE TABLE productos (
  productos_id INT PRIMARY KEY,
  nombre VARCHAR(255),
  precio VARCHAR(20),
  color VARCHAR(30),
  stock VARCHAR(20),
  categoria VARCHAR(255),
  proveedor_id INT,
  FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id)
);

-- se agregan datos a la tabla cliente --

INSERT INTO clientes (cliente_id, nombres, apellidos, direccion) 
VALUES 
(1, 'Juan', 'Perez', 'Avenida Libertador Bernardo O''Higgins 1234, Santiago'),
(2, 'María', 'Gomez', 'Calle Moneda 567, Providencia, Santiago'),
(3, 'Pedro', 'Ramirez', 'Avenida Las Condes 789, Las Condes, Santiago'),
(4, 'Carla', 'Silva', 'Calle Merced 432, Valparaíso'),
(5, 'Andrés', 'Rodriguez', 'Avenida Pedro Montt 567, Concepción'),
(6, 'Isabel', 'Torres', 'Calle Bulnes 789, Temuco'),
(7, 'Alejandro', 'López', 'Avenida Balmaceda 987, Viña del Mar'),
(8, 'Camila', 'Fernández', 'Calle Condell 654, La Serena'),
(9, 'Diego', 'García', 'Avenida Bilbao 321, Antofagasta'),
(10, 'Valentina', 'Martínez', 'Calle San Martín 789, Iquique');

-- se agregan datos a la tabla proveedores -- 

INSERT INTO proveedores (proveedor_id, nombre, rep_legal, fono1, fono2, contacto, correo)
VALUES
(1, 'Proveedor1', 'Representante1', '1234567890', '9876543210', 'Contacto1', 'proveedor1@lossincodigo.com'),
(2, 'Proveedor2', 'Representante2', '2345678901', '8765432109', 'Contacto2', 'proveedor2@lossincodigo.com'),
(3, 'Proveedor3', 'Representante3', '3456789012', '7654321098', 'Contacto3', 'proveedor3@lossincodigo.com'),
(4, 'Proveedor4', 'Representante4', '4567890123', '6543210987', 'Contacto4', 'proveedor4@lossincodigo.com'),
(5, 'Proveedor5', 'Representante5', '5678901234', '5432109876', 'Contacto5', 'proveedor5@lossincodigo.com'),
(6, 'Proveedor6', 'Representante6', '6789012345', '4321098765', 'Contacto6', 'proveedor6@lossincodigo.com'),
(7, 'Proveedor7', 'Representante7', '7890123456', '3210987654', 'Contacto7', 'proveedor7@lossincodigo.com'),
(8, 'Proveedor8', 'Representante8', '8901234567', '2109876543', 'Contacto8', 'proveedor8@lossincodigo.com'),
(9, 'Proveedor9', 'Representante9', '9012345678', '1098765432', 'Contacto9', 'proveedor9@lossincodigo.com'),
(10, 'Proveedor10', 'Representante10', '0123456789', '0987654321', 'Contacto10', 'proveedor10@lossincodigo.com');

-- se agregan datos a la tabla productos --

INSERT INTO productos (productos_id, nombre, precio, color, stock, categoria, proveedor_id)
VALUES
(1, 'Camiseta de algodón', 19990, 'Blanco', 100, 'ropa', 1),
(2, 'Pantalón de mezclilla', 27990, 'Azul', 50, 'ropa',2),
(3, 'Zapatos de cuero', 59990, 'Negro', 20, 'calzado', 3),
(4, 'Reloj de pulsera', 135000, 'Plateado', 10, 'accesorio', 4),
(5, 'Gorra de béisbol', 7990, 'Rojo', 30, 'accesorio', 5),
(6, 'Bolso de viaje', 45000, 'Negro', 15, 'accesorio', 6),
(7, 'Audífonos inalámbricos', 89990, 'Negro', 25, 'electronica', 7),
(8, 'Tablet', 320000, 'Gris', 5, 'electronica', 8),
(9, 'Cámara digital', 55000, 'Plateado', 12, 'electronica', 9),
(10, 'Lentes de sol', 28000, 'Café', 40, 'accesorio', 10);


-- Cuál es la categoría de productos que más se repite.
SELECT categoria, COUNT(categoria) AS frecuencia -- SELECCIONA COLUMNA, LA CUENTA Y DENOMINA COMO frecuencia
FROM t_lovendo3.productos -- DESDE LA TABLA 
GROUP BY categoria -- LAS AGRUPA
ORDER BY frecuencia DESC -- ORDENA DE MAYOR A MENOR
LIMIT 1; -- MUESTRA LA CATEGORÍA CON MAYOR REPETICIÓN

-- Cuáles son los productos con mayor stock.
SELECT * -- SELECCIONA COLUMNA A ORDENAR
FROM t_lovendo3.productos -- DESDE LA TABLA ESPECIFICADA
ORDER BY stock DESC -- ORDENA DE MANERA DESCENDENTE
LIMIT 1; -- MUESTRA SOLO EL CON MAYOR STOCK

-- Qué color de producto es más común en nuestra tienda.
SELECT color, COUNT(color) AS frecuencia -- SELECCIONA LA COLUMNA, CUENTA CADA ELEMENTO Y LO ASIGNA COMO frecuencia
FROM t_lovendo3.productos -- DESDE TABLA ESPECIFICADA
GROUP BY color -- AGRUPA EN BASE AL COLOR
ORDER BY frecuencia DESC -- ORDENA EN BASE A LA FRECUENCIA DE MANERA DESCENDENTE
LIMIT 1; -- Y FINALMENTE MUESTRA SOLO EL COLOR CON MAYOR FRECUENCIA

-- Cual o cuales son los proveedores con menor stock de productos.
-- ESTO REQUIERE MISMA QUERY ANTERIOR PERO CAMBIANDO EL ORDEN.
SELECT * -- SELECCIONA COLUMNA A ORDENAR
FROM t_lovendo3.productos -- DESDE LA TABLA ESPECIFICADA
ORDER BY stock ASC -- ORDENA DE MANERA ASCENDENTE
LIMIT 10; -- MUESTRA LOS 10 PRODUCTOS CON MENOR STOCK

-- Cambien la categoría de productos más popular por ‘Electrónica y computación’.
UPDATE productos -- COMIENZA DECLARANDO MODIFICACIÓN DE LA TABLA productos
SET categoria = 'electronica y computacion' -- CAMBIO A REALIZAR EN categoria
WHERE categoria = ( -- DETERMINA LA CONDICIÓN DE CATEGORIA MÁS COMÚN EN BASE A SUBQUERY
    SELECT categoria 
    FROM (
        SELECT categoria, COUNT(*) AS frecuencia
        FROM t_lovendo3.productos
        GROUP BY categoria
        ORDER BY frecuencia DESC
        LIMIT 1
    ) AS subquery -- SUBQUERY QUE DETERMINA CATEGORIA MÁS COMÚN Y LA SELECCIONA PARA EL LA CONDICIONAL WHERE
);