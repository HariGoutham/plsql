/*
Function in plsql
*/

CREATE OR REPLACE FUNCTION find_salescount(
    p_sales_date IN DATE
) 
RETURN NUMBER
AS
    num_of_sales NUMBER := 0;
BEGIN
    -- Count the number of sales on the given date
    SELECT COUNT(*)
    INTO num_of_sales
    FROM sales
    WHERE sales_date = p_sales_date;

    -- Return the total number of sales
    RETURN num_of_sales;
END find_salescount;
/


--Calling the Function in SQL

SELECT find_salescount(SYSDATE) AS sales_count
FROM dual;

--Using in a PL/SQL Block

DECLARE
    sales_count NUMBER;
BEGIN
    sales_count := find_salescount(SYSDATE);
    DBMS_OUTPUT.PUT_LINE('Number of sales today: ' || sales_count);
END;
/