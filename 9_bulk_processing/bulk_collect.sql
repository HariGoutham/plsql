/*
Context Switching refers to the overhead incurred when switching between SQL and PL/SQL engines. 
Using bulk processing techniques reduces the number of context switches, which can significantly improve performance.
BULK COLLECT
*/

CREATE OR REPLACE PROCEDURE BULK_COLLECT_EXAMPLE AS
    TYPE ORDERID_TYPE IS TABLE OF SALES.ORDER_ID%TYPE INDEX BY PLS_INTEGER;
    L_ORDER_IDS ORDERID_TYPE;
BEGIN
    -- Fetch distinct ORDER_IDs into the associative array
    SELECT DISTINCT ORDER_ID BULK COLLECT INTO L_ORDER_IDS FROM SALES;

    -- Process the collected ORDER_IDs
    FOR i IN 1 .. L_ORDER_IDS.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Order ID: ' || L_ORDER_IDS(i));
    END LOOP;
END;
/

/*
SET SERVEROUTPUT ON;

BEGIN
    BULK_COLLECT_EXAMPLE;
END;
/
*/