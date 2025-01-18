CREATE OR REPLACE TRIGGER customer_before_update
BEFORE UPDATE ON CUSTOMER
DECLARE
    v_username VARCHAR2(10);
BEGIN
    -- Get the username of the user performing the action
    SELECT USER INTO v_username FROM dual;

    -- Insert a record into the audit table
    INSERT INTO AUDIT_TABLE (TABLE_NAME, USERID, OPERATION_DATE, OPERATION)
    VALUES ('CUSTOMER', v_username, SYSDATE, 'Before Update Operation');
END;
/

/*
USGAE:

UPDATE CUSTOMER
SET FIRST_NAME = 'John Doe'
WHERE CUSTOMER_ID = 10; 

select * from audit_table;
*/

