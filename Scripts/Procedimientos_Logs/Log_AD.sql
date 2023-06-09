DROP PROCEDURE IF EXISTS INFO_AD.Log_AD;
-- Cambiamos el delimitador por "$$" 
DELIMITER $$
-- Creamos un procedimiento
CREATE PROCEDURE INFO_AD.Log_AD()

-- Iniciamos el procedimiento
BEGIN
    -- Declaramos las variables Que necesitamos
    Declare Ruta varchar(100);

    SET @RUTA = concat("SELECT * FROM Usuarios_AD INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/AD/Log_Usuarios_AD",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.csv', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE Usuarios_AD;

    SET @RUTA = concat("SELECT * FROM Grupos_AD INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/AD/Log_Grupos_AD",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.csv', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE Grupos_AD;

    SET @RUTA = concat("SELECT * FROM Equipos_AD INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/AD/Log_Equipos_AD",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.csv', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE Equipos_AD;

-- Finalizamos el procedimiento
END$$

delimiter ;