--vamos a eliminar el esquema base o por defecto
DROP SCHEMA Public;

--creamos el esquema para nuestra tabla
CREATE SCHEMA IF NOT EXISTS torneo;

--creamos la tabla para la entidad independiente ficha
CREATE TABLE IF NOT EXISTS torneo.ficha(
id_ficha INT UNIQUE NOT NULL Primary key,
codigo VARCHAR(50)NOT NULL,
programa VARCHAR(50)NOT NULL,
jornada VARCHAR(50)NOT NULL
);

--creamos la segunda tabla para la entidad independiente cancha
CREATE TABLE IF NOT EXISTS torneo.cancha(
id_cancha INT UNIQUE NOT NULL Primary key,
nombre VARCHAR(50)NOT NULL,
ubicacion VARCHAR(50)NOT NULL,
capacidad INT NOT NULL
);

--creamos la tercera tabla para la entidad independiente arbitro
CREATE TABLE IF NOT EXISTS torneo.arbitro(
id_arbitro INT UNIQUE NOT NULL Primary key, 
documento VARCHAR(50)NOT NULL,
nombre VARCHAR(50)NOT NULL,
celular VARCHAR(50)NOT NULL
);

--creamos la cuarta tabla para la entidad independiente equipo
CREATE TABLE IF NOT EXISTS torneo.equipo(
id_equipo INT UNIQUE NOT NULL Primary key,
nombre_equipo VARCHAR(50)NOT NULL,
color_camiseta VARCHAR(50)NOT NULL,
id_equipo_local INT NOT NULL,
id_equipo_visitante INT NOT NULL
);


--creamos la primer tabla para la entidad dependiente jugador
CREATE TABLE IF NOT EXISTS torneo.jugador(
id_jugador INT UNIQUE NOT NULL Primary key,
documento VARCHAR(50)NOT NULL,
nombre VARCHAR(50)NOT NULL,
fecha_nacimiento DATE NOT NULL,
numero_camiseta INT NOT NULL,
id_equipo INT NOT NULL,

CONSTRAINT fk_equipo FOREIGN KEY(id_equipo)REFERENCES torneo.equipo(id_equipo)
);

--creamos la segunda tabla para la entidad dependiente partidos
CREATE TABLE IF NOT EXISTS torneo.partido(
id_partido INT UNIQUE NOT NULL Primary key,
fecha DATE NOT NULL,
hora TIME NOT NULL,
fase VARCHAR(50)NOT NULL,
id_cancha INT NOT NULL,
id_equipo_local INT NOT NULL,
id_equipo_visitante INT NOT NULL,

CONSTRAINT fk_cancha FOREIGN KEY(id_cancha)REFERENCES torneo.cancha(id_cancha),
CONSTRAINT fk_equipo_local FOREIGN KEY(id_equipo_local)REFERENCES torneo.equipo(id_equipo),
CONSTRAINT fk_equipo_visitante FOREIGN KEY(id_equipo_visitante)REFERENCES torneo.equipo(id_equipo),
CONSTRAINT chk_equipos
CHECK(id_equipo_local <> id_equipo_visitante)
);

--creamos la tercera tabla para la entidad dependiente arbitraje
CREATE TABLE IF NOT EXISTS torneo.arbitraje(
id_arbitraje INT UNIQUE NOT NULL Primary key,
documento_arbitro VARCHAR(50),
id_partido INT NOT NULL,
rol VARCHAR(50)NOT NULL,
CONSTRAINT fk_partido FOREIGN KEY(id_partido)REFERENCES torneo.partido(id_partido)
);

--creamos la cuarta tabla para la entidad dependiente participacion
CREATE TABLE IF NOT EXISTS torneo.participacion(
id_participacion INT UNIQUE NOT NULL Primary key,
id_partido INT NOT NULL,
id_jugador INT NOT NULL,
goles INT NOT NULL,
tarjetas_amarillas INT NOT NULL,
tarjeta_roja INT NOT NULL,
minutos_jugadores INT NOT NULL,

CONSTRAINT fk_partido FOREIGN KEY(id_partido)REFERENCES torneo.partido(id_partido),
CONSTRAINT fk_jugador FOREIGN KEY(id_jugador)REFERENCES torneo.jugador(id_jugador)
);