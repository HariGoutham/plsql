CREATE OR REPLACE TRIGGER customer_after_action
AFTER INSERT OR DELETE OR UPDATE ON CUSTOMER
DECLARE
    v_username VARCHAR2(100);
BEGIN
    -- Get the username of the person performing the action
    SELECT USER INTO v_username FROM DUAL;

    -- Check the type of operation and log it in the audit table
    IF INSERTING THEN
        INSERT INTO AUDIT_TABLE (TABLE_NAME, USERID, OPERATION_DATE, OPERATION) 
        VALUES ('CUSTOMER', v_username, SYSDATE, 'Insert operation');
    ELSIF DELETING THEN
        INSERT INTO AUDIT_TABLE (TABLE_NAME, USERID, OPERATION_DATE, OPERATION) 
        VALUES ('CUSTOMER', v_username, SYSDATE, 'Delete operation');
    ELSIF UPDATING THEN
        INSERT INTO AUDIT_TABLE (TABLE_NAME, USERID, OPERATION_DATE, OPERATION) 
        VALUES ('CUSTOMER', v_username, SYSDATE, 'Update operation');
    END IF;
END;
/

/*
-- Insert a new customer record to test the AFTER INSERT trigger
INSERT INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, REGION)
VALUES (10, 'Jane', 'Smith', 'NORTH');

-- Update a customer record to test the AFTER UPDATE trigger
UPDATE CUSTOMER
SET LAST_NAME = 'Doe'
WHERE CUSTOMER_ID = 10;  -- Use the ID of the newly inserted customer

-- Delete a customer record to test the AFTER DELETE trigger
DELETE FROM CUSTOMER
WHERE CUSTOMER_ID = 10;  -- Use the ID of the customer you just inserted
*/


