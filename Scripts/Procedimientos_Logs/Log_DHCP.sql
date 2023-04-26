DROP PROCEDURE IF EXISTS INFO_DHCP.Log_DHCP;
-- Cambiamos el delimitador por "$$" 
DELIMITER $$
-- Creamos un procedimiento al que le pasamos un parámetro float
CREATE PROCEDURE INFO_DHCP.Log_DHCP()

-- Iniciamos el procedimiento
BEGIN
    -- Declaramos las variables Que necesitamos
    Declare Ruta varchar(100);

    SET @RUTA = concat("SELECT * FROM Opciones_Ambitos INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/DHCP/logs_Opciones_Ambitos",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.csv', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE Opciones_Ambitos;

    SET @RUTA = concat("SELECT * FROM Reservas_Ambitos INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/DHCP/logs_Reservas_Ambitos",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.csv', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE Reservas_Ambitos;

    SET @RUTA = concat("SELECT * FROM Estadísticas_Ambitos INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/DHCP/Estadísticas_Ambitos",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.csv', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE Estadísticas_Ambitos;

    SET @RUTA = concat("SELECT * FROM Ambitos INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/DHCP/logs_Ambitos",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.csv', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE Ambitos;

END$$

delimiter ;