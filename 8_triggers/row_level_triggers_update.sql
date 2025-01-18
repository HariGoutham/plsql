CREATE OR REPLACE TRIGGER customer_after_update_row
AFTER UPDATE ON CUSTOMER
FOR EACH ROW
DECLARE
    v_username VARCHAR2(10);
BEGIN
    -- Get the username of the person performing the action
    SELECT USER INTO v_username FROM dual;

    -- Insert a record into the audit table
    INSERT INTO AUDIT_TABLE (TABLE_NAME, USERID, OPERATION_DATE, OPERATION) 
    VALUES ('CUSTOMER', v_username, SYSDATE, 'Update Operation Row Level');
END;
/


-- Update a customer record to test the AFTER UPDATE ROW LEVEL trigger
UPDATE CUSTOMER
SET REGION = 'SOUTH';  -- Make sure this ID exists in your CUSTOMER table


