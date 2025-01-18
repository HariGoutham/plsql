DECLARE
    -- Define a VARRAY type named customer_type with an upper bound of 4
    TYPE customer_type IS VARRAY(4) OF VARCHAR2(100);
    
    -- Declare a variable of the VARRAY type and initialize it
    customer_table customer_type := customer_type(); 

    -- Variable to hold the index while traversing the collection
    v_idx NUMBER;

BEGIN
    -- Extend the VARRAY to hold 4 elements
    customer_table.EXTEND(4); -- You must extend before using the VARRAY

    -- Populate the VARRAY with customer names
    customer_table(1) := 'MIKE';
    customer_table(2) := 'JEFF';
    customer_table(3) := 'JOHN';
    customer_table(4) := 'KING'; -- All indices must be sequential

    -- Note: You cannot delete an item from a VARRAY
    -- customer_table.DELETE(3); -- This line would throw an error if uncommented

    -- Traverse the dense collection
    v_idx := customer_table.FIRST; -- Get the first index of the VARRAY

    -- Loop through the collection until there are no more elements
    WHILE v_idx IS NOT NULL LOOP
        -- Output the customer name at the current index
        DBMS_OUTPUT.PUT_LINE('Customer Name: ' || customer_table(v_idx));
        
        -- Move to the next index in the VARRAY
        v_idx := customer_table.NEXT(v_idx);
    END LOOP display_loop;

END;
/


/*
Explanation of Concepts:

VARRAY Declaration:
TYPE customer_type IS VARRAY(4) OF VARCHAR2(100);
This line defines a new type called customer_type, which is a VARRAY that can hold up to 4 VARCHAR2 values of up to 100 characters each. 
The upper bound (4) specifies the maximum number of elements that the VARRAY can hold.

Variable Declaration:
customer_table customer_type := customer_type();
This line declares a variable customer_table of the type customer_type and initializes it as an empty VARRAY.

Index Variable:
v_idx NUMBER;
This variable is used to hold the current index while traversing the VARRAY.

Extending the VARRAY:
customer_table.EXTEND(4);
This line extends the VARRAY to hold 4 elements. You must extend the VARRAY before assigning values to its indices.

Populating the VARRAY:
The lines customer_table(1) := 'MIKE';, etc., populate the VARRAY with customer names. All indices must be sequential, and you cannot skip indices.

Deleting an Element:
Important Note: Unlike nested tables, you cannot delete individual elements from a VARRAY. If you try to do so (e.g., customer_table.DELETE(3);), it will throw an error.
The elements remain dense, meaning that all indices must be filled.

Traversing the VARRAY:
v_idx := customer_table.FIRST;
This retrieves the first index of the VARRAY.
The WHILE loop continues as long as v_idx is not NULL. Inside the loop:
DBMS_OUTPUT.PUT_LINE('Customer Name: ' || customer_table(v_idx));
This line outputs the customer name corresponding to the current index.
v_idx := customer_table.NEXT(v_idx);
This retrieves the next index in the VARRAY.

*/