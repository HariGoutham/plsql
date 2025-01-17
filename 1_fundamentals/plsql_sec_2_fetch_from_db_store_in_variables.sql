/*
Fetching data from the database
*/

DECLARE
    c_id NUMBER := 11; 
    c_name VARCHAR2(50); 
    c_addr VARCHAR2(50); 
BEGIN
    SELECT first_name, country 
    INTO c_name, c_addr 
    FROM customer 
    WHERE customer_id = c_id;

    DBMS_OUTPUT.PUT_LINE('Name: ' || c_name);
    DBMS_OUTPUT.PUT_LINE('Country: ' || c_addr);
END;
/

/*
What is %type
when declared as % type what ever the datatype columns in table are there, they are mapped to variables 
*/

DECLARE
    c_id customer.customer_id%type := 11; 
    c_name customer.first_name%type; 
    c_addr customer.country%type; 
BEGIN
    SELECT first_name, country 
    INTO c_name, c_addr 
    FROM customer 
    WHERE customer_id = c_id;

    DBMS_OUTPUT.PUT_LINE('Name: ' || c_name);
    DBMS_OUTPUT.PUT_LINE('Country: ' || c_addr);
END;
/

/*
Insert data in to database using plsql
*/

SET SERVEROUTPUT ON;

DECLARE
    c_id        customer.customer_id%TYPE := 13;
    c_fname     customer.first_name%TYPE := 'JEFE';
    c_lname     customer.last_name%TYPE := 'AFONSO';
    c_mname     customer.middle_name%TYPE := 'A';
    c_add1      customer.address_line1%TYPE := '23 SUKANEE RD';
    c_add2      customer.address_line2%TYPE := 'MULL';
    c_city      customer.city%TYPE := 'ALPHARETTA';
    c_country    customer.country%TYPE := 'USA';
    c_date_added customer.date_added%TYPE := SYSDATE;
    c_region     customer.region%TYPE := 'SOUTH';
BEGIN
    INSERT INTO CUSTOMER (customer_id, first_name, last_name, middle_name, address_line1, address_line2, city, country, date_added, region)
    VALUES (c_id, c_fname, c_lname, c_mname, c_add1, c_add2, c_city, c_country, c_date_added, c_region);

    DBMS_OUTPUT.PUT_LINE('Data Successfully Inserted');
END;
/