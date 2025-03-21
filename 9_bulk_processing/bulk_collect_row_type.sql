/*
FORALL is used to perform bulk DML operations (INSERT, UPDATE, DELETE) on collections, which minimizes context switching.
*/

CREATE OR REPLACE PROCEDURE BULK_COLLECT_ROW_TYPE_EXAMPLE AS
    TYPE SALES_RECORD_TYPE IS TABLE OF SALES%ROWTYPE;
    L_SALES_RECORDS SALES_RECORD_TYPE;
BEGIN
    SELECT * BULK COLLECT INTO L_SALES_RECORDS FROM SALES;

    -- Process the collected records
    FOR i IN 1 .. L_SALES_RECORDS.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Order ID: ' || L_SALES_RECORDS(i).ORDER_ID);
    END LOOP;
END;
/

BEGIN
    BULK_COLLECT_ROW_TYPE_EXAMPLE;
END;
/