DROP PROCEDURE IF EXISTS INFO_IMPRESORAS.Log_Impresion;
-- Cambiamos el delimitador por "$$" 
DELIMITER $$
-- Creamos un procedimiento al que le pasamos un parámetro float
CREATE PROCEDURE INFO_IMPRESORAS.Log_Impresion()