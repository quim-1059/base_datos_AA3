--ingresamos datos a la tabla cliente
INSERT INTO 
restaurante.cliente(id_cliente,cedula,nombre,celular,direccion,barrio)
VALUES(1,'4567765434','martin','3245678909','5#8-20','centro'),
      (2,'456776890','mariana','3256878909','8#4-23','bello');

--ingresamos datos a la tabla categoria
INSERT INTO
restaurante.categoria(id_categoria,nombre_categoria)
VALUES(3,'entradas'),
      (4,'bebidas');

--ingresamos datos a la tabla moto
INSERT INTO
restaurante.moto(id_moto,placa_moto,modelo_moto,vencimiento_soat)
VALUES(5,'NTQ-39D','2015','2027/11/13'),
      (6,'UTY-56R','2000','2023/10/12');

--ingresamos datos a la tabla platos
INSERT INTO
restaurante.plato(id_plato,nombre_plato,precio_actual,id_categoria)
VALUES(7,'hamburguesa','12.000','3'),
      (8,'limonada','5.000','4');

--ingresamos datos a la tabla domiciliario
INSERT INTO 
restaurante.domiciliario(id_domiciliario,nombre_domiciliario,id_moto)
VALUES(9,'juan','5'),
      (10,'pedro','6');

--ingresamos datos a la tabla pedido
INSERT INTO
restaurante.pedido(id_pedido,fecha_pedido,estado_pedido,id_cliente,id_domiciliario)
VALUES(11,'2023/12/10','pendiente','1','10'),
      (12,'2025/11/11','en preparacion','2',9);

--ingresamos datos a la tabla detalle_pedido
INSERT INTO
restaurante.detalle_pedido(id_detalle_pedido,cantidad,precio_unitario,id_pedido,id_plato)
VALUES(13,'5','5.000','11','8'),
      (14,'8','12.000','12',7);