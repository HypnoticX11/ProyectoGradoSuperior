DROP DATABASE if EXISTS INFO_DNS;
-- Creamos la base de datos
CREATE DATABASE INFO_DNS;
-- Nos colocamos sobre ella
USE INFO_DNS;

CREATE TABLE Zonas_DNS (
    Nombre_Zona VARCHAR(45),
    Tipo VARCHAR(45),
    Firmada VARCHAR(45),
    PRIMARY KEY (Nombre_Zona)
);

CREATE TABLE Registros_Zonas_DNS (
    Nombre_Host VARCHAR(500),
    Tipo VARCHAR(45),
    Fecha VARCHAR(45),
    TTL VARCHAR(45)
);