DROP PROCEDURE IF EXISTS INFO_EQUIPOS.Log_Test_Conecion;
-- Cambiamos el delimitador por "$$" 
DELIMITER $$
-- Creamos un procedimiento al que le pasamos un parámetro float
CREATE PROCEDURE INFO_EQUIPOS.Log_Test_Conecion()

-- Iniciamos el procedimiento
BEGIN
    -- Declaramos las variables Que necesitamos
    Declare Ruta varchar(100);

    SET @RUTA = concat("SELECT * FROM Equipos_Encendidos INTO OUTFILE '/opt/lampp/mysql/logs_Servicios/Sistemas/Log_Equipos_Encendidos",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.csv', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE Equipos_Encendidos;

END$$

delimiter ;