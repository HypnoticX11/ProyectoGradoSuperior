DROP DATABASE if EXISTS BBDD_infoSistemas;
-- Creamos la base de datos
CREATE DATABASE BBDD_infoSistemas;
-- Nos colocamos sobre ella
USE BBDD_infoSistemas;

CREATE TABLE Equipos_Encendidos (
    IP VARCHAR(20) NOT NULL,
    NOMBRE_Equipo VARCHAR(45) NOT NULL,
    SO VARCHAR(45) NOT NULL,
    Encendido BOOLEAN NOT NULL,
)