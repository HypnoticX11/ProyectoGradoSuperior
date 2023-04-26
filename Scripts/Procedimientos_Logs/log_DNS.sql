DROP PROCEDURE IF EXISTS INFO_DNS.Log_DNS;
-- Cambiamos el delimitador por "$$" 
DELIMITER $$
-- Creamos un procedimiento al que le pasamos un parámetro float
CREATE PROCEDURE INFO_DNS.Log_DNS()

-- Iniciamos el procedimiento
BEGIN
    -- Declaramos las variables Que necesitamos
    Declare Ruta varchar(100);

    SET @RUTA = concat("SELECT * FROM Zonas_DNS INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/DNS/Log_Zonas_DNS",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.csv', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE Zonas_DNS;

    SET @RUTA = concat("SELECT * FROM Registros_Zonas_DNS INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/DNS/Log_Registros_Zonas_DNS",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.csv', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE Registros_Zonas_DNS;

END$$

delimiter ;