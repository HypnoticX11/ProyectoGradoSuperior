DROP PROCEDURE IF EXISTS INFO_CARPETAS_COMPARTIDAS.Log_Usuarios_Carpetas_Compartidas;
-- Cambiamos el delimitador por "$$" 
DELIMITER $$
-- Creamos un procedimiento al que le pasamos un parámetro float
CREATE PROCEDURE INFO_CARPETAS_COMPARTIDAS.Log_Usuarios_Carpetas_Compartidas()