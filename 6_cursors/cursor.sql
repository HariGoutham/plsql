-- PL/SQL Block to demonstrate various cursor concepts

DECLARE
    -- Implicit Cursor Example
    v_total_sales NUMBER;

    -- Explicit Cursor Declaration
    CURSOR c_sales IS
        SELECT SUM(SALES_AMOUNT) AS total_sales
        FROM SALES;

    -- Cursor Variable Declaration
    TYPE sales_cursor_type IS REF CURSOR;
    v_sales_cursor sales_cursor_type;

    -- Record type for cursor
    TYPE sales_record_type IS RECORD (
        total_sales NUMBER
    );
    v_sales_record sales_record_type;

    -- Exception for handling cursor errors
    no_data_found_exception EXCEPTION;

BEGIN
    -- Implicit Cursor Example
    SELECT SUM(SALES_AMOUNT) INTO v_total_sales FROM SALES;
    DBMS_OUTPUT.PUT_LINE('Total Sales (Implicit Cursor): ' || v_total_sales);

    -- Explicit Cursor Example
    OPEN c_sales; -- Open the cursor
    FETCH c_sales INTO v_total_sales; -- Fetch the result into variable
    DBMS_OUTPUT.PUT_LINE('Total Sales (Explicit Cursor): ' || v_total_sales);
    CLOSE c_sales; -- Close the cursor

    -- Cursor FOR Loop Example
    FOR rec IN c_sales LOOP
        DBMS_OUTPUT.PUT_LINE('Total Sales (Cursor FOR Loop): ' || rec.total_sales);
    END LOOP;

    -- Cursor Variable Example
    OPEN v_sales_cursor FOR
        SELECT SUM(SALES_AMOUNT) AS total_sales
        FROM SALES;
    
    -- Fetching from cursor variable
    LOOP
        FETCH v_sales_cursor INTO v_sales_record;
        EXIT WHEN v_sales_cursor%NOTFOUND; -- Exit when no more rows
        DBMS_OUTPUT.PUT_LINE('Total Sales (Cursor Variable): ' || v_sales_record.total_sales);
    END LOOP;
    CLOSE v_sales_cursor; -- Close the cursor variable

    -- Exception Handling Example
    BEGIN
        -- Attempting to fetch from an empty cursor
        OPEN c_sales; -- Open the cursor
        FETCH c_sales INTO v_total_sales; -- Fetch the result into variable
        CLOSE c_sales; -- Close the cursor
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No data found in the cursor.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
    END;

END;
/

/*
Explanation of Concepts:
Implicit Cursor:
Automatically created by Oracle when a SQL statement is executed. In the example, we use an implicit cursor to calculate the 
total sales directly with a SELECT INTO statement.

Explicit Cursor:
Defined by the programmer for a specific SQL query. In the example, we declare an explicit cursor c_sales to fetch the total sales amount.

Cursor FOR Loop:
A simplified way to fetch rows from a cursor. In the example, we use a cursor FOR loop to iterate through the results of the c_sales cursor.

Cursor Variables:
Allow for dynamic SQL and can be passed as parameters. In the example, we declare a cursor variable v_sales_cursor and use it to fetch total sales.

Reference Cursor:
A type of cursor variable that can point to different SQL queries at runtime. In the example, sales_cursor_type is defined as a reference cursor type.

Exception Handling:
PL/SQL provides a way to handle exceptions that may occur during cursor operations. In the example, we handle the NO_DATA_FOUND 
exception when trying to fetch from an empty cursor.
*/