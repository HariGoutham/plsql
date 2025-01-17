CREATE OR REPLACE PROCEDURE ADD_CUSTOMER(
    c_id IN NUMBER,
    c_fname IN VARCHAR2,
    c_lname IN VARCHAR2,
    c_mname IN VARCHAR2,
    c_add1 IN VARCHAR2,
    c_add2 IN VARCHAR2,
    c_city IN VARCHAR2,
    c_country IN VARCHAR2,
    c_date_added IN DATE,
    c_region IN VARCHAR2,
    total_count OUT NUMBER
)
AS
BEGIN
    -- Insert new customer record
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

    DBMS_OUTPUT.PUT_LINE('Data Successfully Inserted');

    -- Retrieve the total count of customers
    SELECT COUNT(1) INTO total_count FROM CUSTOMER;
END ADD_CUSTOMER;
/





DECLARE
    total_count NUMBER;
BEGIN
    ADD_CUSTOMER(
        c_id => 101,
        c_fname => 'John',
        c_lname => 'Doe',
        c_mname => 'A',
        c_add1 => '123 Main St',
        c_add2 => 'Apt 4B',
        c_city => 'New York',
        c_country => 'USA',
        c_date_added => SYSDATE,
        c_region => 'East',
        total_count => total_count
    );

    DBMS_OUTPUT.PUT_LINE('Total Customers: ' || total_count);
END;
/