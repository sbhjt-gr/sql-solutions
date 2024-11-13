/* 
1. Write a pl/sql code block that will accept an account number from the user and debit an ammount of rs. 2000 from the accpount if the account has a minimum balance of 500 after the amount is debited. The process is fired on Accounts table
          
ACCOUNT_ID	NAME	BALANCE
AC001	           ANUJ       5000
AC002	           MITA        2400
*/

DECLARE
    acc_id varchar2(20);
    acc_bal number;
    acc_new_bal number;
BEGIN
    acc_id := '&acc_id';

    SELECT BALANCE into acc_bal from Accounts where ACCOUNT_ID = acc_id;

    acc_new_bal := acc_bal - 2000;

    IF acc_new_bal >= 500 THEN
        UPDATE Accounts
        SET balance = acc_new_bal
        where ACCOUNT_ID = acc_id;

        DBMS_OUTPUT.PUT_LINE('Rs. 2000 debited from account' || acc_id || ' . 'New balance: ' ||  acc_new_bal');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('NO ACCOUNT FOUND');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('AN ERROR OCCURRED');
END;

/* Write a Pl/SQL code block to calculate the area of a circle  for a value of radius varying from 3 to 7. Store the radius and the corresponding values of calculated area in a table AREAS */

DECLARE
    area NUMBER;
BEGIN
    FOR radius in 3..7 LOOP
        area := 3.14159 * radius * radius;
        INSERT into Areas(radius, area) values(radius, area);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Area and radius stored successfully');
END;

/* Write a PL/SQL code to calculate the factorial of a number entered by the user */

DECLARE
    fact_of NUMBER;
    factorial NUMBER := 1;
BEGIN
    fact_of := '&fact_of';
    IF fact_of < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Factorial is not defined for negative numbers.');
    ELSIF fact_of = 0 THEN
        DBMS_OUTPUT.PUT_LINE('1');
    ELSE
        FOR i in 1..fact_of LOOP
            factorial := factorial * i;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(factorial);
    END IF;
END;

/* Write a PL/SQL block of code that first inserts a record in an Emp table. Update the salaries of Blake and Clark by Rs 2000 and Rs 1500. Then check to see that the total salary does not exceed 20000. If the total salary is greater than 20000 then undo the updates made to the salaries of Blake and Clark. */

DECLARE
    csal NUMBER :=  0;

BEGIN

    UPDATE Emp set sal = sal + 2000 where name = 'Blake';
    UPDATE Emp set sal = sal + 1500 where name = 'Clark';

    SELECT sum(salary) INTO csal from emp;

    IF csal > 20000 THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Updates undone. Total salary exceeded 20000.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Updates committed successfully.');
    END IF;

END;