DROP PROCEDURE IF EXISTS INFO_DHCP.Log_Asignaciones_DHCP;
-- Cambiamos el delimitador por "$$" 
DELIMITER $$
-- Creamos un procedimiento al que le pasamos un parámetro float
CREATE PROCEDURE INFO_DHCP.Log_Asignaciones_DHCP()

-- Iniciamos el procedimiento
BEGIN
    -- Declaramos las variables Que necesitamos
    Declare Ruta varchar(100);

    SET @RUTA = concat("SELECT * FROM IP_Asignadas INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/DHCP/Log_Asgnaciones_DHCP",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.csv', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE IP_Asignadas;

END$$

delimiter ;