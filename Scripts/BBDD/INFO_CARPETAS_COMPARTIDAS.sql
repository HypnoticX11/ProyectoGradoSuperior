DROP DATABASE if EXISTS INFO_CARPETAS_COMPARTIDAS;
-- Creamos la base de datos
CREATE DATABASE INFO_CARPETAS_COMPARTIDAS;
-- Nos colocamos sobre ella
USE INFO_CARPETAS_COMPARTIDAS;

CREATE TABLE Carpetas_Compartidas (
    Nombre VARCHAR(500) NOT NULL,
    Ruta VARCHAR(45),
    Descripción VARCHAR(500),
    PRIMARY KEY (Nombre)
);

CREATE TABLE Permisos_Carpetas_Compartidas (
    Nombre VARCHAR(500) NOT NULL,
    Usuario VARCHAR(45),
    Tipo_Acceso VARCHAR(45),
    Permisos VARCHAR(500)
);

CREATE TABLE Usuarios_Carpetas_Compartidas (
    Nombre_Usuario VARCHAR(500) NOT NULL,
    IP_Usuario VARCHAR(45)
);