DROP DATABASE if EXISTS INFO_EQUIPOS;
-- Creamos la base de datos
CREATE DATABASE INFO_EQUIPOS;
-- Nos colocamos sobre ella
USE INFO_EQUIPOS;

CREATE TABLE Equipos_Encendidos (
    IP VARCHAR(20) NOT NULL,
    NOMBRE_Equipo VARCHAR(45),
    SO VARCHAR(500),
    Encendido BOOLEAN NOT NULL,
    PRIMARY KEY (IP)
);

CREATE TABLE Datos_Equipos (
    IP VARCHAR(20) NOT NULL,
    Capacidad_Disco VARCHAR(20),
    Espacio_Usado_Disco VARCHAR(20),
    Porcentaje_Uso_CPU VARCHAR(20),
    RAM_Total VARCHAR(20),
    RAM_Uso VARCHAR(20),
    PRIMARY KEY (IP)
);