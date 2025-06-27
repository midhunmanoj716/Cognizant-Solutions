-- Table: ACCOUNT_DETAILS
CREATE TABLE ACCOUNT_DETAILS (
  Account_ID   NUMBER PRIMARY KEY,
  Type         VARCHAR2(20),
  Balance      NUMBER(10,2)
);

-- Table: STAFF
CREATE TABLE STAFF (
  Emp_ID       NUMBER PRIMARY KEY,
  Dept_ID      NUMBER,
  Salary       NUMBER(10,2)
);

-- Insert records into ACCOUNT_DETAILS
INSERT INTO ACCOUNT_DETAILS VALUES (1001, 'SAVINGS', 1000);
INSERT INTO ACCOUNT_DETAILS VALUES (1002, 'SAVINGS', 2000);
INSERT INTO ACCOUNT_DETAILS VALUES (1003, 'CURRENT', 1500);

-- Insert records into STAFF
INSERT INTO STAFF VALUES (1, 101, 5000);
INSERT INTO STAFF VALUES (2, 101, 6000);
INSERT INTO STAFF VALUES (3, 102, 7000);

COMMIT;

-- Enable output display
SET SERVEROUTPUT ON;

-- Procedure: Add Monthly Interest to Savings Accounts
CREATE OR REPLACE PROCEDURE ApplyMonthlyInterest IS
BEGIN
  UPDATE ACCOUNT_DETAILS
  SET Balance = Balance * 1.01
  WHERE Type = 'SAVINGS';

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Interest added: Savings accounts updated successfully.');
END;
/

-- Procedure: Provide Bonus to Department Employees
CREATE OR REPLACE PROCEDURE AllocateBonus(
  p_dept_id   IN NUMBER,
  p_bonus_pct IN NUMBER
) IS
BEGIN
  UPDATE STAFF
  SET Salary = Salary + (Salary * (p_bonus_pct / 100))
  WHERE Dept_ID = p_dept_id;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Bonus of ' || p_bonus_pct || '% granted to Dept ' || p_dept_id || '.');
END;
/

-- Procedure: Fund Transfer Between Accounts
CREATE OR REPLACE PROCEDURE MoveFunds(
  p_source_id IN NUMBER,
  p_target_id IN NUMBER,
  p_amt       IN NUMBER
) IS
  v_curr_balance NUMBER;
BEGIN
  SELECT Balance INTO v_curr_balance
  FROM ACCOUNT_DETAILS
  WHERE Account_ID = p_source_id
  FOR UPDATE;

  IF v_curr_balance < p_amt THEN
    RAISE_APPLICATION_ERROR(-20001, 'Transfer failed: Not enough balance in source account.');
  END IF;

  UPDATE ACCOUNT_DETAILS
  SET Balance = Balance - p_amt
  WHERE Account_ID = p_source_id;

  UPDATE ACCOUNT_DETAILS
  SET Balance = Balance + p_amt
  WHERE Account_ID = p_target_id;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Transferred ₹' || p_amt || ' from A/C ' || p_source_id || ' to A/C ' || p_target_id || '.');
END;
/

-- Procedure Calls
EXEC ApplyMonthlyInterest;
EXEC AllocateBonus(101, 10);
EXEC MoveFunds(1001, 1002, 500);
