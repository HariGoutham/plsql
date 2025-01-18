DECLARE
    -- Define a record type for customer and sales information
    TYPE CustomerSalesRecord IS RECORD (
        CUSTOMER_ID      CUSTOMER.CUSTOMER_ID%TYPE,  -- Customer ID from CUSTOMER table
        FIRST_NAME       CUSTOMER.FIRST_NAME%TYPE,     -- First name from CUSTOMER table
        LAST_NAME        CUSTOMER.LAST_NAME%TYPE,      -- Last name from CUSTOMER table
        SALES_DATE       SALES.SALES_DATE%TYPE,        -- Sales date from SALES table
        ORDER_ID         SALES.ORDER_ID%TYPE,          -- Order ID from SALES table
        PRODUCT_ID       SALES.PRODUCT_ID%TYPE,        -- Product ID from SALES table
        QUANTITY         SALES.QUANTITY%TYPE,          -- Quantity sold from SALES table
        UNIT_PRICE       SALES.UNIT_PRICE%TYPE,        -- Unit price from SALES table
        TOTAL_AMOUNT     SALES.TOTAL_AMOUNT%TYPE        -- Total amount from SALES table
    );

    -- Define a cursor to fetch customer and sales data
    CURSOR c_CustomerSales IS
        SELECT c.CUSTOMER_ID, c.FIRST_NAME, c.LAST_NAME,
               s.SALES_DATE, s.ORDER_ID, s.PRODUCT_ID,
               s.QUANTITY, s.UNIT_PRICE, s.TOTAL_AMOUNT
        FROM CUSTOMER c
        JOIN SALES s ON c.CUSTOMER_ID = s.CUSTOMER_ID;  -- Join CUSTOMER and SALES tables

    -- Variable to hold the record
    v_CustomerSales CustomerSalesRecord;  -- Declare a variable of the record type

BEGIN
    -- Open the cursor to start fetching data
    OPEN c_CustomerSales;
    LOOP
        -- Fetch the next record into the variable
        FETCH c_CustomerSales INTO v_CustomerSales;
        DBMS_OUTPUT.PUT_LINE('STARTED');
        -- Exit the loop if there are no more records to fetch
        EXIT WHEN c_CustomerSales%NOTFOUND;

        -- Output the data to the console
        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_CustomerSales.CUSTOMER_ID ||
                             ', Name: ' || v_CustomerSales.FIRST_NAME || ' ' || v_CustomerSales.LAST_NAME ||
                             ', Sales Date: ' || TO_CHAR(v_CustomerSales.SALES_DATE, 'YYYY-MM-DD') ||
                             ', Order ID: ' || v_CustomerSales.ORDER_ID ||
                             ', Product ID: ' || v_CustomerSales.PRODUCT_ID ||
                             ', Quantity: ' || v_CustomerSales.QUANTITY ||
                             ', Unit Price: ' || v_CustomerSales.UNIT_PRICE ||
                             ', Total Amount: ' || v_CustomerSales.TOTAL_AMOUNT);
    END LOOP;

    -- Close the cursor after processing all records
    CLOSE c_CustomerSales;
END;
/