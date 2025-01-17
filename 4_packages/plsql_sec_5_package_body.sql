create or replace PACKAGE BODY CUSTOMER_PACKAGE AS
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
)
AS
BEGIN
    -- Insert new customer record into the CUSTOMER table
    INSERT INTO CUSTOMER (
        customer_id, 
        first_name, 
        last_name, 
        middle_name, 
        address_line1, 
        address_line2, 
        city, 
        country, 
        date_added, 
        region
    )
    VALUES (
        c_id, 
        c_fname, 
        c_lname, 
        c_mname, 
        c_add1, 
        c_add2, 
        c_city, 
        c_country, 
        c_date_added, 
        c_region
    );

    -- Confirm the transaction
    COMMIT;

    -- Output success message
    DBMS_OUTPUT.PUT_LINE('Data Successfully Inserted');

    -- Get total count of records from the CUSTOMER table
    SELECT COUNT(1) INTO c_id FROM CUSTOMER;
END ADD_CUSTOMER;

    FUNCTION FIND_SALESCOUNT (
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
    END FIND_SALESCOUNT;
END CUSTOMER_PACKAGE;

DECLARE
    sales_count NUMBER;
BEGIN
    sales_count := CUSTOMER_PACKAGE.FIND_SALESCOUNT(TO_DATE('2025-01-03', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Number of sales: ' || sales_count);
END;