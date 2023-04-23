DROP DATABASE if EXISTS INFO_DHCP;
-- Creamos la base de datos
CREATE DATABASE INFO_DHCP;
-- Nos colocamos sobre ella
USE INFO_DHCP;

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
    ID_OPCION VARCHAR(500) NOT NULL,
    ID_Ambito VARCHAR(45),
    NOMBRE VARCHAR(45),
    Tipo VARCHAR(45),
    Valor VARCHAR(500),
    PRIMARY KEY (OPCION)
);

CREATE TABLE Reservas_Ambitos (
    IP VARCHAR(500) NOT NULL,
    ID_Ambito VARCHAR(45),
    ID_Cliente VARCHAR(45),
    Nombre VARCHAR(45),
    Tipo VARCHAR(500),
    Descripcion VARCHAR(500),
    PRIMARY KEY (IP)
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