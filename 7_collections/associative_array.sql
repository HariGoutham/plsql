DECLARE
    -- Define an associative array type named customer_type
    TYPE customer_type IS TABLE OF VARCHAR2(100) INDEX BY BINARY_INTEGER;

    -- Declare a variable of the associative array type
    customer_table customer_type;

    -- Variable to hold the index while traversing the collection
    v_idx BINARY_INTEGER;

BEGIN
    -- Populate the associative array with customer names
    customer_table(1) := 'MIKE';
    customer_table(2) := 'JEFF';
    customer_table(3) := 'JOHN';
    customer_table(6) := 'KING'; -- Note that index 4 and 5 are skipped, demonstrating a sparse collection

    -- Delete the third item of the collection (which is 'JOHN')
    customer_table.DELETE(3);

    -- Start traversing the sparse collection
    v_idx := customer_table.FIRST; -- Get the first index of the associative array

    -- Loop through the collection until there are no more elements
    WHILE v_idx IS NOT NULL LOOP
        -- Output the customer name at the current index
        DBMS_OUTPUT.PUT_LINE('Customer Name: ' || customer_table(v_idx));
        
        -- Move to the next index in the associative array
        v_idx := customer_table.NEXT(v_idx);
    END LOOP display_loop;

END;
/

/*
Explanation of Concepts:

Associative Array Declaration:
TYPE customer_type IS TABLE OF VARCHAR2(100) INDEX BY BINARY_INTEGER;
This line defines a new type called customer_type, which is an associative array (or index-by table) that can hold VARCHAR2 values of up to 100 characters. 
The array is indexed by BINARY_INTEGER, which means you can use integer values as keys.

Variable Declaration:
customer_table customer_type;
This line declares a variable customer_table of the type customer_type, which will hold the customer names.

Index Variable:
v_idx BINARY_INTEGER;
This variable is used to hold the current index while traversing the associative array.

Populating the Associative Array:
The lines customer_table(1) := 'MIKE';, etc., populate the associative array with customer names. Note that we skip indices 4 and 5, demonstrating that 
associative arrays can be sparse (i.e., not all indices need to be used).

Deleting an Element:
customer_table.DELETE(3);
This line deletes the entry at index 3 (which is 'JOHN') from the associative array.

Traversing the Associative Array:
v_idx := customer_table.FIRST;
This retrieves the first index of the associative array.
The WHILE loop continues as long as v_idx is not NULL. Inside the loop:
DBMS_OUTPUT.PUT_LINE('Customer Name: ' || customer_table(v_idx));
This line outputs the customer name corresponding to the current index.
v_idx := customer_table.NEXT(v_idx);
This retrieves the next index in the associative array.

Output:
The output will display the names of the customers stored in the associative array, skipping the deleted entry and any unused indices.
*/