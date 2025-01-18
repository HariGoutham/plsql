SET SERVEROUTPUT ON;

DECLARE
    -- Define a VARRAY type
    TYPE VArrayType IS VARRAY(5) OF NUMBER;
    my_varray VArrayType := VArrayType(1, 2, 3, 4, 5);

    -- Define a nested table type
    TYPE NestedTableType IS TABLE OF NUMBER;
    my_nested_table NestedTableType := NestedTableType(10, 20, 30, 40, 50);

    -- Variables to hold results
    v_exists BOOLEAN;
    v_count NUMBER;
    v_first_index NUMBER;
    v_last_index NUMBER;
BEGIN
    -- Demonstrate EXISTS
    v_exists := my_varray.EXISTS(3);  -- Check if index 3 exists
    DBMS_OUTPUT.PUT_LINE('Element at index 3 exists in VARRAY: ' || CASE WHEN v_exists THEN 'TRUE' ELSE 'FALSE' END);

    -- Demonstrate COUNT
    v_count := my_varray.COUNT;
    DBMS_OUTPUT.PUT_LINE('Count of elements in VARRAY: ' || v_count);

    -- Demonstrate LIMIT
    DBMS_OUTPUT.PUT_LINE('Limit of VARRAY: ' || my_varray.LIMIT);

    -- Demonstrate FIRST and LAST
    v_first_index := my_varray.FIRST;
    v_last_index := my_varray.LAST;
    DBMS_OUTPUT.PUT_LINE('First index of VARRAY: ' || v_first_index);
    DBMS_OUTPUT.PUT_LINE('Last index of VARRAY: ' || v_last_index);

    -- Demonstrate PRIOR and NEXT
    DBMS_OUTPUT.PUT_LINE('Prior to index 3: ' || my_varray.PRIOR(3));
    DBMS_OUTPUT.PUT_LINE('Next to index 3: ' || my_varray.NEXT(3));

    -- Demonstrate EXTEND
    my_varray.EXTEND; -- Appends a single null element
    DBMS_OUTPUT.PUT_LINE('After EXTEND, Count of elements in VARRAY: ' || my_varray.COUNT);

    my_varray.EXTEND(2); -- Appends 2 null elements
    DBMS_OUTPUT.PUT_LINE('After EXTEND(2), Count of elements in VARRAY: ' || my_varray.COUNT);

    -- Demonstrate TRIM
    my_varray.TRIM; -- Removes a single element from the end
    DBMS_OUTPUT.PUT_LINE('After TRIM, Count of elements in VARRAY: ' || my_varray.COUNT);

    my_varray.TRIM(2); -- Removes 2 elements from the end
    DBMS_OUTPUT.PUT_LINE('After TRIM(2), Count of elements in VARRAY: ' || my_varray.COUNT);

    -- Demonstrate DELETE
    my_varray.DELETE; -- Removes all elements
    DBMS_OUTPUT.PUT_LINE('After DELETE, Count of elements in VARRAY: ' || my_varray.COUNT);

    -- Demonstrate DELETE(n)
    my_nested_table.DELETE(2); -- Removes the element at index 2
    DBMS_OUTPUT.PUT_LINE('After DELETE(2), Count of elements in Nested Table: ' || my_nested_table.COUNT);

    -- Demonstrate DELETE(n1, n2)
    my_nested_table.DELETE(1, 3); -- Removes elements from index 1 to 3
    DBMS_OUTPUT.PUT_LINE('After DELETE(1, 3), Count of elements in Nested Table: ' || my_nested_table.COUNT);

    -- Display remaining elements in the nested table
    FOR i IN 1 .. my_nested_table.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Element at index ' || i || ': ' || my_nested_table(i));
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/