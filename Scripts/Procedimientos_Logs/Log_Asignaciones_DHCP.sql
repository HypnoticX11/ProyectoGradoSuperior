DROP PROCEDURE IF EXISTS Log_Asignaciones_DHCP;
-- Cambiamos el delimitador por "$$" 
DELIMITER $$
-- Creamos un procedimiento al que le pasamos un parámetro float
CREATE PROCEDURE Borrado_Tablas

-- Iniciamos el procedimiento
BEGIN
    -- Declaramos las variables Que necesitamos
    Declare Ruta varchar(100);

    SET @RUTA = concat("SELECT * FROM IP_Asignadas INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.txt ',
                        "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE IP_Asignadas;

END$$

delimiter ;