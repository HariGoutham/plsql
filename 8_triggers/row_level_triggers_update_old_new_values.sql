CREATE OR REPLACE TRIGGER customer_after_update
AFTER UPDATE ON CUSTOMER
FOR EACH ROW
DECLARE
    v_username VARCHAR2(50);  -- Adjusted to match the USERID column size
BEGIN
    -- Get the username of the person performing the action
    SELECT USER INTO v_username FROM dual;

    -- Insert a record into the audit log
    INSERT INTO AUDIT_LOG (USERID, OPERATION_DATE, B_CUSTOMERID, A_CUSTOMERID, B_FIRSTNAME, A_FIRSTNAME) 
    VALUES (v_username, SYSDATE, :OLD.CUSTOMER_ID, :NEW.CUSTOMER_ID, :OLD.FIRST_NAME, :NEW.FIRST_NAME);
END;
/


/*
UPDATE CUSTOMER
SET FIRST_NAME = 'Alice'
WHERE CUSTOMER_ID = 1; 

SELECT * FROM AUDIT_LOG;
*/