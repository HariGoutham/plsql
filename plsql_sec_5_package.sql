create or replace PACKAGE CUSTOMER_PACKAGE AS
    -- Procedure to add a customer
    PROCEDURE ADD_CUSTOMER(
    c_id IN OUT NUMBER,
    c_fname IN VARCHAR2,
    c_lname IN VARCHAR2,
    c_mname IN VARCHAR2,
    c_add1 IN VARCHAR2,
    c_add2 IN VARCHAR2,
    c_city IN VARCHAR2,
    c_country IN VARCHAR2,
    c_date_added IN DATE,
    c_region IN VARCHAR2
);

    -- Function to find the sales count for a given sales date
    FUNCTION FIND_SALESCOUNT (
        p_sales_date IN DATE -- Input: Sales date
    ) 
    RETURN NUMBER;

END CUSTOMER_PACKAGE;



SELECT CUSTOMER_PACKAGE.find_salescount(TO_DATE('2025-01-03', 'YYYY-MM-DD')) AS sales_count
FROM DUAL;