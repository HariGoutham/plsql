SET SERVEROUTPUT ON;

DECLARE
    -- Define a nested table type
    TYPE t_tab IS TABLE OF NUMBER;

    -- Initialize two nested tables
    l_tabl1 t_tab := t_tab(1, 2, 3, 4, 5, 6);
    l_tabl2 t_tab := t_tab(5, 6, 7, 8, 9, 10);

    -- Variables to hold results
    l_union t_tab;
    l_union_distinct t_tab;
    l_except t_tab;
    l_intersect t_tab;
BEGIN
    -- MULTISET UNION
    l_union := l_tabl1 MULTISET UNION l_tabl2;
    DBMS_OUTPUT.PUT_LINE('MULTISET UNION:');
    FOR i IN 1 .. l_union.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(l_union(i));
    END LOOP;

    -- MULTISET UNION DISTINCT
    l_union_distinct := l_tabl1 MULTISET UNION DISTINCT l_tabl2;
    DBMS_OUTPUT.PUT_LINE('MULTISET UNION DISTINCT:');
    FOR i IN 1 .. l_union_distinct.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(l_union_distinct(i));
    END LOOP;

    -- MULTISET EXCEPT
    l_except := l_tabl1 MULTISET EXCEPT l_tabl2;
    DBMS_OUTPUT.PUT_LINE('MULTISET EXCEPT:');
    FOR i IN 1 .. l_except.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(l_except(i));
    END LOOP;

    -- MULTISET INTERSECT
    l_intersect := l_tabl1 MULTISET INTERSECT l_tabl2;
    DBMS_OUTPUT.PUT_LINE('MULTISET INTERSECT:');
    FOR i IN 1 .. l_intersect.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(l_intersect(i));
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/