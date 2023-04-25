DROP PROCEDURE IF EXISTS INFO_IMPRESORAS.Log_Impresion;
-- Cambiamos el delimitador por "$$" 
DELIMITER $$
-- Creamos un procedimiento al que le pasamos un parámetro float
CREATE PROCEDURE INFO_IMPRESORAS.Log_Impresion()

BEGIN
    -- Declaramos las variables Que necesitamos
    Declare Ruta varchar(100);

    SET @RUTA = concat("SELECT * FROM Drivers_Impresoras INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/Impresion/Log_Drivers_Impresion",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.txt ', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE Drivers_Impresoras;

    SET @RUTA = concat("SELECT * FROM Puertos_Impresoras INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/Impresion/Log_Puertos_Impresion",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.txt ', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE Puertos_Impresoras;

    SET @RUTA = concat("SELECT * FROM Impresoras INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/Impresion/Log_Impresoras",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.txt ', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE Impresoras;

END$$