DROP PROCEDURE IF EXISTS INFO_EQUIPOS.Log_Recursos_Sistema;
-- Cambiamos el delimitador por "$$" 
DELIMITER $$
-- Creamos un procedimiento al que le pasamos un parámetro float
CREATE PROCEDURE INFO_EQUIPOS.Log_Recursos_Sistema()

-- Iniciamos el procedimiento
BEGIN
    -- Declaramos las variables Que necesitamos
    Declare Ruta varchar(100);

    SET @RUTA = concat("SELECT * FROM Cola_Impresión INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/Sistemas/Log_Datos_Equipos",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.csv', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE Datos_Equipos;

END$$

delimiter ;