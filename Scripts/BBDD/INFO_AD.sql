DROP DATABASE if EXISTS INFO_AD;
-- Creamos la base de datos
CREATE DATABASE INFO_AD;
-- Nos colocamos sobre ella
USE INFO_AD;

CREATE TABLE Usuarios_AD (
    Nombre_Distinguido VARCHAR(500) NOT NULL,
    Nombre VARCHAR(45),
    Nombre_Principal VARCHAR(500),
    PRIMARY KEY (Nombre_Distinguido)
);

CREATE TABLE Grupos_AD (
    Nombre_Distinguido VARCHAR(500) NOT NULL,
    Nombre VARCHAR(200),
    Categoria VARCHAR(45),
    Alcance VARCHAR(500),
    PRIMARY KEY (Nombre_Distinguido)
);

CREATE TABLE Equipos_AD (
    Nombre_Distinguido VARCHAR(500) NOT NULL,
    Nombre_DNS VARCHAR(150),
    Nombre VARCHAR(45),
    PRIMARY KEY (Nombre_Distinguido)
);