DROP PROCEDURE IF EXISTS INFO_CARPETAS_COMPARTIDAS.Log_Carpetas_Compartidas;
-- Cambiamos el delimitador por "$$" 
DELIMITER $$
-- Creamos un procedimiento al que le pasamos un parámetro float
CREATE PROCEDURE INFO_CARPETAS_COMPARTIDAS.Log_Carpetas_Compartidas()

-- Iniciamos el procedimiento
BEGIN
    -- Declaramos las variables Que necesitamos
    Declare Ruta varchar(100);

    SET @RUTA = concat("SELECT * FROM IP_Asignadas INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/Archivos/Log_Carpetas_Compartidas",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.csv', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE Carpetas_Compartidas;

    SET @RUTA = concat("SELECT * FROM IP_Asignadas INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/Archivos/Log_Permisos_Carpetas_Compartidas",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.csv', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE Permisos_Carpetas_Compartidas;

END$$

delimiter ;