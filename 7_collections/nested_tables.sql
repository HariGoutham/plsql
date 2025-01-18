DECLARE
    -- Define a nested table type named customer_type
    TYPE customer_type IS TABLE OF VARCHAR2(100);
    
    -- Declare a variable of the nested table type
    customer_table customer_type := customer_type(); -- Initialize the nested table

    -- Variable to hold the index while traversing the collection
    v_idx NUMBER;

BEGIN
    -- Extend the nested table to hold 4 elements
    customer_table.EXTEND(4); -- You must extend before using the table

    -- Populate the nested table with customer names
    customer_table(1) := 'MIKE';
    customer_table(2) := 'JEFF';
    customer_table(3) := 'JOHN';
    customer_table(4) := 'KING'; -- Note: You cannot skip indices; they must be sequential

    -- Delete the third item of the collection (which is 'JOHN')
    customer_table.DELETE(3);

    -- Output the first and last customer names
    DBMS_OUTPUT.PUT_LINE('First Customer Name: ' || customer_table(customer_table.FIRST));
    DBMS_OUTPUT.PUT_LINE('Last Customer Name: ' || customer_table(customer_table.LAST));

    -- Traverse the dense collection
    v_idx := customer_table.FIRST; -- Get the first index of the nested table

    -- Loop through the collection until there are no more elements
    WHILE v_idx IS NOT NULL LOOP
        -- Output the customer name at the current index
        DBMS_OUTPUT.PUT_LINE('Customer Name: ' || customer_table(v_idx));
        
        -- Move to the next index in the nested table
        v_idx := customer_table.NEXT(v_idx);
    END LOOP display_loop;

END;
/

/*

Explanation of Concepts:

Nested Table Declaration:
TYPE customer_type IS TABLE OF VARCHAR2(100);
This line defines a new type called customer_type, which is a nested table that can hold VARCHAR2 values of up to 100 characters.

Variable Declaration:
customer_table customer_type := customer_type();
This line declares a variable customer_table of the type customer_type and initializes it as an empty nested table.

Index Variable:
v_idx NUMBER;
This variable is used to hold the current index while traversing the nested table.

Extending the Nested Table:
customer_table.EXTEND(4);
This line extends the nested table to hold 4 elements. You must extend the nested table before assigning values to its indices.

Populating the Nested Table:
The lines customer_table(1) := 'MIKE';, etc., populate the nested table with customer names. Note that all indices must be sequential; 
if you try to assign a value to an index that is not the next in sequence, it will throw an error.

Deleting an Element:
customer_table.DELETE(3);
This line deletes the entry at index 3 (which is 'JOHN') from the nested table.

Outputting First and Last Elements:
DBMS_OUTPUT.PUT_LINE('First Customer Name: ' || customer_table(customer_table.FIRST));
This line outputs the first customer name in the nested table.
DBMS_OUTPUT.PUT_LINE('Last Customer Name: ' || customer_table(customer_table.LAST));
This line outputs the last customer name in the nested table.

Traversing the Nested Table:
v_idx := customer_table.FIRST;
This retrieves the first index of the nested table.
The WHILE loop continues as long as v_idx is not NULL. Inside the loop:
DBMS_OUTPUT.PUT_LINE('Customer Name: ' || customer_table(v_idx));
This line outputs the customer name corresponding to the current index.
v_idx := customer_table.NEXT(v_idx);
This retrieves the next index in the nested table.

*/