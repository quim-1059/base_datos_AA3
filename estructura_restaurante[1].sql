--vamos a eliminar el esquema base o por defecto
DROP SCHEMA Public;


--creamos el esquema para nuestra tabla
CREATE SCHEMA IF NOT EXISTS restaurante;


--creamos la tabla para la entidad independiente cliente
CREATE TABLE IF NOT EXISTS restaurante.cliente(
id_cliente INT UNIQUE NOT NULL primary key,
cedula VARCHAR(50)NOT NULL,
nombre VARCHAR(50)NOT NULL,
celular VARCHAR(50)NOT NULL,
direccion VARCHAR(100)NOT NULL,
barrio VARCHAR(100)NOT NULL
);

--creamos la segunda tabla para la entidad independiente categoria
CREATE TABLE IF NOT EXISTS restaurante.categoria(
id_categoria INT UNIQUE NOT NULL Primary key,
nombre_categoria VARCHAR(50)NOT NULL
);


--creamos la tercera tabla para la entidad independiente moto
CREATE TABLE IF NOT EXISTS restaurante.moto(
id_moto INT UNIQUE NOT NULL Primary key,
placa_moto VARCHAR(50)NOT NULL,
modelo_moto VARCHAR(50)NOT NULL,
vencimiento_soat DATE NOT NULL
); 

--creamos la tabla dependiente platos
CREATE TABLE IF NOT EXISTS restaurante.plato(
id_plato INT UNIQUE NOT NULL Primary key,
nombre_plato VARCHAR(50)NOT NULL,
precio_actual DECIMAL(11,0)NOT NULL,
id_categoria INT NOT NULL,

CONSTRAINT fk_categoria FOREIGN KEY(id_categoria)REFERENCES restaurante.categoria(id_categoria)
);

--creamos la segunda tabla dependiente domiciliario
CREATE TABLE IF NOT EXISTS restaurante.domiciliario(
id_domiciliario INT UNIQUE NOT NULL Primary key,
nombre_domiciliario VARCHAR(50),
id_moto INT NOT NULL,

CONSTRAINT fk_moto FOREIGN KEY(id_moto)REFERENCES restaurante.moto(id_moto)
);

--creamos la tercera tabla dependiente pedido
CREATE TABLE IF NOT EXISTS restaurante.pedido(
id_pedido INT UNIQUE NOT NULL Primary key,
fecha_pedido DATE,
estado_pedido VARCHAR(50),
id_cliente INT NOT NULL,
id_domiciliario INT NOT NULL,

CONSTRAINT fk_cliente FOREIGN KEY(id_cliente)REFERENCES restaurante.cliente(id_cliente),
CONSTRAINT fk_domiciliario FOREIGN KEY(id_domiciliario)REFERENCES restaurante.domiciliario(id_domiciliario) 
);

--creamos la cuarta tabla dependiente detalle_pedido
CREATE TABLE IF NOT EXISTS restaurante.detalle_pedido(
id_detalle_pedido INT UNIQUE NOT NULL Primary key,
cantidad INT NOT NULL,
precio_unitario DECIMAL(10,1),
id_pedido INT UNIQUE NOT NULL,
id_plato INT UNIQUE NOT NULL,

CONSTRAINT fk_pedido FOREIGN KEY(id_pedido)REFERENCES restaurante.pedido(id_pedido),
CONSTRAINT fk_plato FOREIGN KEY(id_plato)REFERENCES restaurante.plato(id_plato)
);

