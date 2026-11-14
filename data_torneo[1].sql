--ingresamos datos a la tabla ficha
INSERT INTO 
torneo.ficha(id_ficha,codigo,programa,jornada)
VALUES(1,'3456','ADSO','MAÑANA'),
       (2,'4567','CONTABILIDAD','noche');
	   
--ingresamos datos a la tabla cancha
INSERT INTO
torneo.cancha(id_cancha,nombre,ubicacion,capacidad)
VALUES(3,'campin','san eduardo','500'),
      (4,'floral','centro','600');

--ingresamos datos a la tabla arbitro
INSERT INTO
torneo.arbitro(id_arbitro,documento,nombre,celular)
VALUES(5,'3465789098','luis','3234567890'),
      (6,'567890987','carlos','3244567890');

--ingresamos datos a la tabla equipo
INSERT INTO 
torneo.equipo(id_equipo,nombre_equipo,color_camiseta,id_equipo_local,id_equipo_visitante)
VALUES(15,'tigres','amarillo','8','9'),
      (13,'leones','naranja','6','5');

--ingresamos datos a la tabla jugador
INSERT INTO
torneo.jugador(id_jugador,documento,nombre,fecha_nacimiento,numero_camiseta,id_equipo)
VALUES(101,'3456789809','marlon','20008/12/11','12','7'),
      (102,'4567765434','camilo','2007/10/15','9','8');

--ingresamos datos a la tabla partidos
INSERT INTO
torneo.partido(id_partido,fecha,hora,fase,id_cancha,id_equipo_local,id_equipo_visitante)
VALUES(11,'2026/12/11','12:00','primer_tiempo','3','8','6'),
     (12,'2025/11/10','1:00','segundo_tiempo','4','6','5');

--ingresamos datos a la tabla arbitraje
INSERT INTO
torneo.arbitraje(id_arbitraje,documento_arbitro,id_partido,rol)
VALUES(33,'3465789098','11','central'),
      (34,'567890987','12','asistente');

--ingresamos datos a la tabla participacion
INSERT INTO
torneo.participacion(id_participacion,id_partido,id_jugador,goles,tarjetas_amarillas,tarjeta_roja,minutos_jugadores)
VALUES(43,'11','101','4','4','6','10'),
      (44,'12','102','8','2','1','25');