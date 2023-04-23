DROP DATABASE if EXISTS BBDD_infoSistems;
-- Creamos la base de datos
CREATE DATABASE BBDD_infoSistems;
-- Nos colocamos sobre ella
USE BBDD_infoSistems;

CREATE TABLE Equipos_Encendidos (
    IP VARCHAR(20) NOT NULL,
    NOMBRE_Equipo VARCHAR(45),
    SO VARCHAR(45),
    Encendido BOOLEAN NOT NULL,
    PRIMARY KEY (IP)
);

CREATE TABLE Drivers_Impresoras (
    Nombre VARCHAR(500) NOT NULL,
    Entorno VARCHAR(45),
    Version_Driver VARCHAR(45),
    Fabricante VARCHAR(500)
);

CREATE TABLE Puertos_Impresoras (
    ID int auto_increment,
    Nombre VARCHAR(500) NOT NULL,
    Nombre_Equipo VARCHAR(45),
    Descripción VARCHAR(45),
    Tipo_monitor VARCHAR(500),
    PRIMARY KEY (ID)
);

CREATE TABLE Cola_Impresión (
    ID VARCHAR(500) NOT NULL,
    Nombre_Equipo VARCHAR(45),
    Nombre_Impresora VARCHAR(45),
    Nombre_Documento VARCHAR(500),
    Fecha VARCHAR(500),
    Estado VARCHAR(500),
    PRIMARY KEY (ID)
);

CREATE TABLE Impresoras (
    Nombre VARCHAR(500) NOT NULL,
    NOMBRE_Equipo VARCHAR(45),
    Tipo VARCHAR(45),
    Driver VARCHAR(500),
    Puerto VARCHAR(500),
    Compartida VARCHAR(45),
    Publicada VARCHAR(45),
    PRIMARY KEY (Nombre)
);

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

CREATE TABLE Ambitos (
    ID VARCHAR(500) NOT NULL,
    NOMBRE_Ambito VARCHAR(45),
    Estado VARCHAR(45),
    IP_Inicio VARCHAR(500),
    IP_Final VARCHAR(500),
    Tiempo_Concesión VARCHAR(45),
    PRIMARY KEY (ID)
);

CREATE TABLE Opciones_Ambitos (
    ID_OPCIÓN VARCHAR(500) NOT NULL,
    ID_Ambito VARCHAR(45),
    NOMBRE VARCHAR(45),
    Tipo VARCHAR(45),
    Valor VARCHAR(500),
    PRIMARY KEY (ID)
);

CREATE TABLE Reservas_Ambitos (
    IP VARCHAR(500) NOT NULL,
    ID_Ambito VARCHAR(45),
    ID_Cliente VARCHAR(45),
    Nombre VARCHAR(45),
    Tipo VARCHAR(500),
    Descripcion VARCHAR(500),
    PRIMARY KEY (ID)
);

CREATE TABLE Estadísticas_Ambitos (
    ID_Ambito VARCHAR(45),
    IP_Libres VARCHAR(45),
    IP_Uso VARCHAR(45),
    Reservadas VARCHAR(45)
);

CREATE TABLE IP_Asignadas (
    ID_Ambito VARCHAR(45),
    IP_Cliente VARCHAR(45),
    ID_Cliente VARCHAR(45),
    Nombre VARCHAR(45),
    Estado VARCHAR(45),
    PRIMARY KEY (IP_Cliente)
);