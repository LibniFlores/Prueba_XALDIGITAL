CREATE DATABASE VuelosMexico;
use VuelosMexico;

CREATE TABLE aerolineas (ID_aerolineas INT NOT NULL AUTO_INCREMENT UNIQUE, 
nombre_aerolinea VARCHAR(45) NOT NULL, PRIMARY KEY(ID_aerolineas) );

INSERT INTO aerolineas (nombre_aerolinea)VALUES ('Volaris');
INSERT INTO aerolineas (nombre_aerolinea)VALUES ('Aeromar');
INSERT INTO aerolineas (nombre_aerolinea)VALUES ('Interjet');
INSERT INTO aerolineas (nombre_aerolinea)VALUES ('Aeromexico');

SELECT * FROM aerolineas;

CREATE TABLE aeropuertos (ID_aeropuerto INT NOT NULL AUTO_INCREMENT UNIQUE,
 nombre_aerolinea VARCHAR(45), PRIMARY KEY (ID_aeropuerto) );
 
 INSERT INTO aeropuertos (nombre_aerolinea)VALUES('Benito Juarez');
 INSERT INTO aeropuertos (nombre_aerolinea)VALUES('Guanajuato');
 INSERT INTO aeropuertos (nombre_aerolinea)VALUES('La Paz');
 INSERT INTO aeropuertos (nombre_aerolinea)VALUES('Oaxaca');
 
 SELECT * FROM aeropuertos;
 
 
 CREATE TABLE movimientos (ID_movimiento INT NOT NULL AUTO_INCREMENT UNIQUE, 
 descripcion VARCHAR(45), PRIMARY KEY (ID_movimiento)); 
 
 INSERT INTO movimientos (descripcion) VALUES ('Salida');
 INSERT INTO movimientos (descripcion) VALUES ('Llegada');
 
 SELECT * FROM movimientos;
 
 
 CREATE TABLE vuelos 
 (ID_aerolinea INT, 
 ID_aeropuerto INT, 
 ID_movimiento INT,
 DIA DATE NOT NULL,
 CONSTRAINT FK_aerolinea FOREIGN KEY (ID_aerolinea) REFERENCES aerolineas(ID_aerolineas),
 CONSTRAINT FK_aeropuerto FOREIGN KEY (ID_aeropuerto) REFERENCES aeropuertos(ID_aeropuerto),
 CONSTRAINT FK_movimiento FOREIGN KEY (ID_movimiento) REFERENCES movimientos(ID_movimiento));
 
 INSERT INTO vuelos (ID_aerolinea, ID_aeropuerto, ID_movimiento, DIA) VALUES 
 (1,1,1,'2021-05-02'),
 (2,1,1,'2021-05-02'),
 (3,2,2,'2021-05-02'),
 (4,3,2,'2021-05-02'),
 (1,3,2,'2021-05-02'),
 (2,1,1,'2021-05-02'),
 (2,3,1,'2021-05-04'),
 (3,4,1,'2021-05-04'),
 (3,4,1,'2021-05-04');
 

 

/*¿Cuál es el nombre aeropuerto que ha tenido mayor movimiento durante el año?*/
select a.nombre_aerolinea as aeropuerto, count(*) as total from vuelos v inner join aeropuertos a on v.ID_aeropuerto=a.id_aeropuerto group by v.ID_aeropuerto order by total desc limit 1;

/*¿Cuál es el nombre aerolínea que ha realizado mayor número de vuelos durante el año?*/
select a.nombre_aerolinea as aerolinea, count(*)as total from vuelos v inner join aerolineas a on v.id_aerolinea=a.id_aerolineas group by v.id_aerolinea order by total desc limit 1;

/*¿En qué día se han tenido mayor número de vuelos?*/
select day(dia) as dia, count(*) as total from vuelos group by  dia order by total desc limit 1;

/*¿Cuáles son las aerolíneas que tienen mas de 2 vuelos por día?*/
select a.id_aerolineas as aerolinea, count(*) as total from vuelos v inner join aerolineas a on v.id_aerolinea=a.id_aerolineas group by v.id_aerolinea having count(day(dia)) > 2 order by date('2021-05-02');

 
