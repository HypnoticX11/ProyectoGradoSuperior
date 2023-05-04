-- Borramos la BBDD si ya existe
DROP DATABASE if EXISTS EJEMPLO;
-- Creamos la base de datos
CREATE DATABASE EJEMPLO;
-- Nos colocamos sobre ella
USE EJEMPLO;

-- Creamos una tabla
CREATE TABLE DATOS_EJEMPLO (
    -- Definimos los campos de la tabla y sus tipos de valor
    ID int auto_increment NOT NULL,
    Dato1 VARCHAR(500) NOT NULL,
    Dato2 VARCHAR(45),
    Dato3 VARCHAR(45),
    Dato4 float,
    -- Definimos claves primarias y únicas
    PRIMARY KEY (ID),
    UNIQUE (Dato1)
);