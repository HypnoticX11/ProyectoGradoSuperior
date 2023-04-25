DROP PROCEDURE IF EXISTS INFO_DHCP.Log_DHCP;
-- Cambiamos el delimitador por "$$" 
DELIMITER $$
-- Creamos un procedimiento al que le pasamos un parámetro float
CREATE PROCEDURE INFO_DHCP.Log_DHCP()

-- Iniciamos el procedimiento
BEGIN
    -- Declaramos las variables Que necesitamos
    Declare Ruta varchar(100);

    SET @RUTA = concat("SELECT * FROM IP_Asignadas INTO OUTFILE '/otp/lampp/mysql/logs_Servicios/",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.txt ', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE IP_Asignadas;

END$$

delimiter ;