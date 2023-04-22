DROP DATABASE if EXISTS BBDD_infoSistemas;
-- Creamos la base de datos
CREATE DATABASE BBDD_infoSistemas;
-- Nos colocamos sobre ella
USE BBDD_infoSistemas;

CREATE TABLE Equipos_Encendidos (
    IP VARCHAR(20) NOT NULL,
    NOMBRE_Equipo VARCHAR(45),
    SO VARCHAR(45),
    Encendido BOOLEAN NOT NULL,
    PRIMARY KEY (IP)
)

CREATE TABLE Drivers_Impresoras (
    Nombre VARCHAR(500) NOT NULL,
    Entorno_Impresion VARCHAR(45),
    Version VARCHAR(45),
    Fabricante VARCHAR(500),
    PRIMARY KEY (Nombre)
)

CREATE TABLE Puertos_Impresoras (
    Nombre VARCHAR(500) NOT NULL,
    Nombre_Equipo VARCHAR(45),
    Descripción VARCHAR(45),
    Tipo_monitor VARCHAR(500),
    PRIMARY KEY (Nombre)
)

CREATE TABLE Cola_Impresión (
    ID VARCHAR(500) NOT NULL,
    Nombre_Equipo VARCHAR(45),
    Nombre_Impresora VARCHAR(45),
    Nombre_Documento VARCHAR(500),
    Fecha VARCHAR(500),
    Estado VARCHAR(500),
    PRIMARY KEY (ID)
)

CREATE TABLE Impresoras (
    Nombre VARCHAR(500) NOT NULL,
    NOMBRE_Equipo VARCHAR(45),
    Tipo VARCHAR(45),
    Driver VARCHAR(500),
    Puerto VARCHAR(500),
    Compartida VARCHAR(45),
    Publicada VARCHAR(45),
    PRIMARY KEY (IP),
    FOREIGN KEY (Driver) REFERENCES Drivers_Impresoras(Nombre),
    FOREIGN KEY (Puerto) REFERENCES Puertos_Impresoras(Nombre),
    FOREIGN KEY (Nombre) REFERENCES Cola_Impresión(Nombre_Equipo)
)