USE mydb;

-- Set up
DROP TABLE IF EXISTS test_division_cases_table;

-- TEMPORARY table has an issue with opening it multiple times, so regular table is used instead
CREATE TABLE test_division_cases_table (
    id INT AUTO_INCREMENT,
    test_case_description TEXT,
    dividend FLOAT,
    divisor FLOAT,
    expected_result FLOAT,
    PRIMARY KEY (id)
);

-- Test cases data
INSERT INTO test_division_cases_table (test_case_description, dividend, divisor, expected_result) 
VALUES 
    ("Both numbers are whole positive numbers, dividend is higher", 6, 3, 2),
    ("Both numbers are whole positive numbers, divisor is higher", 3, 6, 0.5),
    ("Both numbers are whole positive equal numbers", 5, 5, 1),
    
    ("Both numbers are not whole positive numbers, dividend is higher", 2.5, 0.5, 5),
    ("Both numbers are not whole positive numbers, divisor is higher", 2.2, 8.8, 0.25),
    ("Both numbers are not whole positive equal numbers", 2.5, 2.5, 1),
    
    ("Dividend is negative number, divisor is positive number", -10, 5, -2),
    ("Dividend is posistive number, divisor is negative number", 5, -20, -0.25),
    ("Both numbers are negative numbers", -20, -5, 4),
    
    ("Dividend is NULL, divisor is number", NULL, 5, NULL),
    ("Dividend is number, divisor is NULL", 5, NULL, NULL),
    ("Both numbers are NULL", NULL, NULL, NULL),
    
    ("Dividend is zero, divisor is number", 0, 8, 0),
    ("Dividend is number, divisor is zero", 20, 0, NULL), 
    ("Both numbers are zero", 0, 0, NULL);

-- Actual tests execution, results validation and summary in header
WITH test_results AS (
    SELECT 
        id,
        test_case_description,
        dividend,
        divisor,
        expected_result,
        fn_divide_numbers(dividend, divisor) AS actual_result,
        IF(
            COALESCE(expected_result, 'NULL') = COALESCE(fn_divide_numbers(dividend, divisor), 'NULL'), 
            'OK', 
            'FAILED'
        ) AS test_result
    FROM test_division_cases_table
)
SELECT 
    NULL AS id,
    'SUMMARY:' AS test_case_description,
    NULL AS dividend, NULL AS divisor, NULL AS expected_result, NULL AS actual_result, NULL AS test_result
UNION
SELECT 
    NULL AS id,
    CONCAT('    Total number of tests: ', COUNT(*)) AS test_case_description,
    NULL AS dividend, NULL AS divisor, NULL AS expected_result, NULL AS actual_result, NULL AS test_result
FROM test_results
UNION
SELECT 
    NULL AS id,
    CONCAT('    Passed tests: ', COUNT(*)) AS test_case_description,
    NULL AS dividend, NULL AS divisor, NULL AS expected_result, NULL AS actual_result, NULL AS test_result
FROM test_results
WHERE test_result = 'OK'
UNION
SELECT 
    NULL AS id,
    CONCAT('    Failed tests: ', COUNT(*)) AS test_case_description,
    NULL AS dividend, NULL AS divisor, NULL AS expected_result, NULL AS actual_result, NULL AS test_result
FROM test_results
WHERE test_result = 'FAILED'
UNION
SELECT * FROM test_results;

-- Clean up
DROP TABLE IF EXISTS test_division_cases_table;