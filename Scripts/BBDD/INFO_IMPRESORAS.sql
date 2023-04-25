DROP DATABASE if EXISTS INFO_IMPRESORAS;
-- Creamos la base de datos
CREATE DATABASE INFO_IMPRESORAS;
-- Nos colocamos sobre ella
USE INFO_IMPRESORAS;

CREATE TABLE Drivers_Impresoras (
    Nombre VARCHAR(500) NOT NULL,
    Entorno VARCHAR(45),
    Version_Driver VARCHAR(45),
    Fabricante VARCHAR(500)
);
CREATE INDEX ID_DRIVERS_IMPRESORAS ON Drivers_Impresoras(Nombre);

CREATE TABLE Puertos_Impresoras (
    ID int auto_increment,
    Nombre VARCHAR(500) NOT NULL,
    Nombre_Equipo VARCHAR(45),
    Descripción VARCHAR(45),
    Tipo_monitor VARCHAR(500),
    PRIMARY KEY (ID)
);
CREATE INDEX ID_PUERTOS_IMPRESORAS ON Puertos_Impresoras(Nombre);

CREATE TABLE Cola_Impresión (
    ID VARCHAR(500) NOT NULL,
    Nombre_Equipo VARCHAR(45),
    Nombre_Impresora VARCHAR(45),
    Nombre_Documento VARCHAR(500),
    Fecha VARCHAR(500),
    Estado VARCHAR(500),
    PRIMARY KEY (ID)
);
CREATE INDEX ID_COLA_IMPRESORAS ON Cola_Impresión(Nombre_Equipo);

CREATE TABLE Impresoras (
    Nombre VARCHAR(500) NOT NULL,
    NOMBRE_Equipo VARCHAR(45),
    Tipo VARCHAR(45),
    Driver VARCHAR(500),
    Puerto VARCHAR(500),
    Compartida VARCHAR(45),
    Publicada VARCHAR(45),
    PRIMARY KEY (Nombre),
    CONSTRAINT FK_drivers_Impresoras FOREIGN KEY (Driver) REFERENCES Drivers_Impresoras (Nombre),
    CONSTRAINT FK_Ambitos_Opciones_Ambitos FOREIGN KEY (Puerto) REFERENCES Puertos_Impresoras (Nombre),
    CONSTRAINT FK_Cola_Impresora FOREIGN KEY (Nombre) REFERENCES Cola_Impresión (Nombre_Equipo)
);