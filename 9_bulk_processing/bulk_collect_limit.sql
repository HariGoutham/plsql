/*
FORALL is used to perform bulk DML operations (INSERT, UPDATE, DELETE) on collections, which minimizes context switching.
*/

CREATE OR REPLACE PROCEDURE BULK_COLLECT_LIMIT_EXAMPLE AS
    CURSOR SALES_CURSOR IS SELECT ORDER_ID FROM SALES;
    TYPE ORDERID_TYPE IS TABLE OF SALES.ORDER_ID%TYPE;
    L_ORDER_IDS ORDERID_TYPE;
BEGIN
    OPEN SALES_CURSOR;

    LOOP
        FETCH SALES_CURSOR BULK COLLECT INTO L_ORDER_IDS LIMIT 100;
        EXIT WHEN L_ORDER_IDS.COUNT = 0;

        -- Process the collected ORDER_IDs
        FOR i IN 1 .. L_ORDER_IDS.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('Order ID: ' || L_ORDER_IDS(i));
        END LOOP;
    END LOOP;

    CLOSE SALES_CURSOR;
END;
/

/*
BEGIN
    BULK_COLLECT_LIMIT_EXAMPLE;
END;
/
*/