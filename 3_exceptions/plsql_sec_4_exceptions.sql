CREATE OR REPLACE PROCEDURE GET_CUSTOMER (
    cid IN NUMBER -- Input parameter: Customer ID (must be greater than 0)
)
AS
    -- Declare variables to hold customer details
    c_name customer.first_name%TYPE; -- Variable to store customer's first name
    c_cntry customer.country%TYPE;  -- Variable to store customer's country
    
    -- Declare an exception for invalid customer ID
    ex_customer_id EXCEPTION; 
BEGIN
    -- Check if the customer ID is valid
    IF cid <= 0 THEN
        -- Raise an exception for invalid customer ID
        RAISE ex_customer_id;
    END IF;

    -- Attempt to fetch customer details
    SELECT first_name, country 
    INTO c_name, c_cntry
    FROM customer
    WHERE customer_id = cid;

    -- Print the fetched customer details
    DBMS_OUTPUT.PUT_LINE('Name: ' || c_name);
    DBMS_OUTPUT.PUT_LINE('Country: ' || c_cntry);

EXCEPTION
    -- Handle invalid customer ID exception
    WHEN ex_customer_id THEN
        DBMS_OUTPUT.PUT_LINE('ID must be greater than zero!');
    
    -- Handle no data found exception
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No such customer!');
    
    -- Handle too many rows exception
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('You got more than 1 row!');
    
    -- Handle any other exceptions
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error!');
END;
/



BEGIN
    GET_CUSTOMER(17); -- Replace `1` with the desired customer ID
END;
/