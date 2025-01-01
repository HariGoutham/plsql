/*
Variable declaration and different syntax
*/
DECLARE

--ordernumber constant number:=1001;
/*
multi line comment
one
two
three
*/
ordernumber number:=1001;
orderid number default 1002;
customername VARCHAR2(20):='Hari';
BEGIN
ordernumber:=234;
  dbms_output.put_line('Welcome to course');
  dbms_output.put_line(ordernumber);
  dbms_output.put_line(orderid);
  dbms_output.put_line(customername);
END;
/
/*
Global Local Variables
*/

DECLARE
     v_global NUMBER := 200; -- Global variable
BEGIN
     dbms_output.put_line('Global variable :' || v_global);
     DECLARE
        v_local NUMBER := 185; -- Global variable
     BEGIN
        dbms_output.put_line('Global variable :' || v_local);
     END;
END;
/
/*
Syntax
IF condition1 THEN
   -- Code if condition1 is TRUE
ELSIF condition2 THEN
   -- Code if condition1 is FALSE and condition2 is TRUE
ELSIF condition3 THEN
   -- Code if both condition1 and condition2 are FALSE, and condition3 is TRUE
ELSE
   -- Code if none of the above conditions are TRUE
END IF;
*/

DECLARE
  v_grade NUMBER := 10;
BEGIN
  IF v_grade >= 90 THEN
    DBMS_OUTPUT.PUT_LINE('Grade: A');
  ELSIF v_grade >= 75 THEN
    DBMS_OUTPUT.PUT_LINE('Grade: B');
  ELSIF v_grade >= 50 THEN
    DBMS_OUTPUT.PUT_LINE('Grade: C');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Grade: F');
  END IF;
END;
/

/*
CASE 
  WHEN condition1 THEN result1
  WHEN condition2 THEN result2
  ...
  ELSE resultN
END;
*/

DECLARE
  v_grade NUMBER := 85;
  v_result VARCHAR2(10);
BEGIN
  -- Using CASE to determine the grade
  v_result := CASE 
                WHEN v_grade >= 90 THEN 'A'
                WHEN v_grade >= 75 THEN 'B'
                WHEN v_grade >= 50 THEN 'C'
                ELSE 'F'
              END;

  DBMS_OUTPUT.PUT_LINE('Grade: ' || v_result);
END;
/
/*
WHILE condition LOOP
   -- Statements to execute
END LOOP;
*/

DECLARE
  v_counter NUMBER := 1; -- Initialize a counter variable
BEGIN
  WHILE v_counter <= 5 LOOP
    DBMS_OUTPUT.PUT_LINE('Counter: ' || v_counter); -- Print the current counter value
    v_counter := v_counter + 1; -- Increment the counter
  END LOOP;
END;
/

/*

Forward loop:
FOR counter_variable IN start_value..end_value LOOP
   -- Statements to execute
END LOOP;

Reverse loop:
FOR counter_variable IN REVERSE start_value..end_value LOOP
   -- Statements to execute
END LOOP;

*/

BEGIN
  FOR v_counter IN 1..5 LOOP
    DBMS_OUTPUT.PUT_LINE('Counter: ' || v_counter);
  END LOOP;
END;
/

BEGIN
  FOR v_counter IN REVERSE 1..5 LOOP
    DBMS_OUTPUT.PUT_LINE('Counter: ' || v_counter);
  END LOOP;
END;
/