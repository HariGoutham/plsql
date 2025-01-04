/*
PROCEDURE
*/

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
    c_region IN VARCHAR2
)
AS
BEGIN
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
END ADD_CUSTOMER;
/



/*
1. Positional Parameter Passing
In this format, values are provided in the exact order of the procedure's parameter list.
*/

BEGIN
    ADD_CUSTOMER(
        17,          -- c_id
        'JEFF',      -- c_fname
        'AFONSO',    -- c_lname
        'A',         -- c_mname
        '23 SUWANNEE RD', -- c_add1
        NULL,        -- c_add2
        'ALPHARETTA',-- c_city
        'USA',       -- c_country
        SYSDATE,     -- c_date_added
        'SOUTH'      -- c_region
    );
END;
/


/*
2. Named Parameter Passing
In this format, parameters are explicitly named for clarity and flexibility. Their order can differ from the procedure's parameter list.
*/

BEGIN
    ADD_CUSTOMER(
        c_id => 17,
        c_fname => 'JEFF',
        c_lname => 'AFONSO',
        c_mname => 'A',
        c_add1 => '23 SUWANNEE RD',
        c_add2 => NULL,
        c_city => 'ALPHARETTA',
        c_country => 'USA',
        c_date_added => SYSDATE,
        c_region => 'SOUTH'
    );
END;
/

SELECT * FROM CUSTOMER;
