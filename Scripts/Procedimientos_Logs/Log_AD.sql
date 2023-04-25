DROP PROCEDURE IF EXISTS INFO_AD.Log_AD;
-- Cambiamos el delimitador por "$$" 
DELIMITER $$
-- Creamos un procedimiento al que le pasamos un parámetro float
CREATE PROCEDURE INFO_AD.Log_AD()

-- Iniciamos el procedimiento
BEGIN
    -- Declaramos las variables Que necesitamos
    Declare Ruta varchar(100);

    SET @RUTA = concat("SELECT * FROM IP_Asignadas INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/DHCP/Log_Asgnaciones_DHCP",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.txt ', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE IP_Asignadas;

END$$

delimiter ;