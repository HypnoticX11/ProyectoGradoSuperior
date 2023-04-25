DROP PROCEDURE IF EXISTS INFO_DNS.Log_DNS;
-- Cambiamos el delimitador por "$$" 
DELIMITER $$
-- Creamos un procedimiento al que le pasamos un parámetro float
CREATE PROCEDURE INFO_DNS.Log_DNS()