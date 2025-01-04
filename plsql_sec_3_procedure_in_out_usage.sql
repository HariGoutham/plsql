CREATE OR REPLACE PROCEDURE ADD_CUSTOMER(
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
/



DECLARE
    c_id NUMBER := 101;        -- Input/Output variable for customer_id
    total_count NUMBER;        -- Output variable for total records
BEGIN
    ADD_CUSTOMER(
        c_id => c_id,          -- IN OUT parameter
        c_fname => 'JEFF',     -- IN parameter
        c_lname => 'AFONSO',   -- IN parameter
        c_mname => 'A',        -- IN parameter
        c_add1 => '23 SUWANNEE RD', -- IN parameter
        c_add2 => NULL,        -- IN parameter
        c_city => 'ALPHARETTA',-- IN parameter
        c_country => 'USA',    -- IN parameter
        c_date_added => SYSDATE, -- IN parameter
        c_region => 'SOUTH'   -- IN parameter
    );

    -- Output the updated customer_id if it was modified
    DBMS_OUTPUT.PUT_LINE('Updated Customer ID: ' || c_id);
END;
/

