DROP PROCEDURE IF EXISTS INFO_IMPRESORAS.Log_jobs_Impresion;
-- Cambiamos el delimitador por "$$" 
DELIMITER $$
-- Creamos un procedimiento al que le pasamos un parámetro float
CREATE PROCEDURE INFO_IMPRESORAS.Log_jobs_Impresion()

-- Iniciamos el procedimiento
BEGIN
    -- Declaramos las variables Que necesitamos
    Declare Ruta varchar(100);

    SET @RUTA = concat("SELECT * FROM Cola_Impresión INTO OUTFILE '/otp/lampp/mysql/logs_Servicios/Impresión/Log_jobs_Impresion",DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s'), '.txt ', "' FIELDS TERMINATED BY ','");
    PREPARE statement FROM @RUTA;
    EXECUTE statement;
    TRUNCATE TABLE Cola_Impresión ;

END$$