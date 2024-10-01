USE mydb;

DROP FUNCTION IF EXISTS fn_divide_numbers;

DELIMITER //

-- Divides two numbers, where first number considered as dividend and second as divisor.
-- Corner cases:
-- - when any of provided numbers is NULL returns NULL
-- - when didisor is zero, returns NULL to prevent divide by zero error
CREATE FUNCTION fn_divide_numbers(dividend FLOAT, divisor FLOAT)
RETURNS FLOAT
DETERMINISTIC
NO SQL
BEGIN
    DECLARE result FLOAT;
    
    -- handle null input values
    IF dividend IS NULL OR divisor IS NULL THEN
        RETURN NULL;
    END IF;
    
    -- handle division by zero numbers
    IF divisor = 0 THEN
        RETURN NULL;
    END IF;
    
    SET result = dividend / divisor;
    
    RETURN result;
END //

DELIMITER ;