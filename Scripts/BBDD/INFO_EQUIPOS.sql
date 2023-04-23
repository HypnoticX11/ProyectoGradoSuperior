DROP DATABASE if EXISTS INFO_EQUIPOS;
-- Creamos la base de datos
CREATE DATABASE INFO_EQUIPOS;
-- Nos colocamos sobre ella
USE INFO_EQUIPOS;

CREATE TABLE Equipos_Encendidos (
    IP VARCHAR(20) NOT NULL,
    NOMBRE_Equipo VARCHAR(45),
    SO VARCHAR(45),
    Encendido BOOLEAN NOT NULL,
    PRIMARY KEY (IP)
);