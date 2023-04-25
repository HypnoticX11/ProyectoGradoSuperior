DROP PROCEDURE IF EXISTS INFO_EQUIPOS.Log_Recursos_Sistema;
-- Cambiamos el delimitador por "$$" 
DELIMITER $$
-- Creamos un procedimiento al que le pasamos un parámetro float
CREATE PROCEDURE INFO_EQUIPOS.Log_Recursos_Sistema()