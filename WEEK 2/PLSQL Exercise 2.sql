-- Table creation: BANK_ACCOUNTS
CREATE TABLE BANK_ACCOUNTS (
  Acc_ID       NUMBER PRIMARY KEY,
  Acc_Type     VARCHAR2(20),
  Acc_Balance  NUMBER
);

-- Table creation: COMPANY_EMPLOYEES
CREATE TABLE COMPANY_EMPLOYEES (
  Emp_ID       NUMBER PRIMARY KEY,
  Dept_ID      NUMBER,
  Emp_Salary   NUMBER
);

-- Inserting sample data into BANK_ACCOUNTS
INSERT INTO BANK_ACCOUNTS VALUES (1001, 'SAVINGS', 1000);
INSERT INTO BANK_ACCOUNTS VALUES (1002, 'SAVINGS', 2000);
INSERT INTO BANK_ACCOUNTS VALUES (1003, 'CURRENT', 1500);

-- Inserting sample data into COMPANY_EMPLOYEES
INSERT INTO COMPANY_EMPLOYEES VALUES (1, 101, 5000);
INSERT INTO COMPANY_EMPLOYEES VALUES (2, 101, 6000);
INSERT INTO COMPANY_EMPLOYEES VALUES (3, 102, 7000);

COMMIT;

-- Enable DBMS_OUTPUT
SET SERVEROUTPUT ON;

-- Procedure 1: Credit 1% Interest to Savings Accounts
CREATE OR REPLACE PROCEDURE CreditMonthlyInterest IS
BEGIN
  UPDATE BANK_ACCOUNTS
  SET Acc_Balance = Acc_Balance * 1.01
  WHERE Acc_Type = 'SAVINGS';

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Interest credited to all savings accounts successfully.');
END;
/

-- Procedure 2: Disburse Departmental Bonus
CREATE OR REPLACE PROCEDURE GrantBonusToDept(
  p_dept_id   IN NUMBER,
  p_bonus_pct IN NUMBER
) IS
BEGIN
  UPDATE COMPANY_EMPLOYEES
  SET Emp_Salary = Emp_Salary + (Emp_Salary * (p_bonus_pct / 100))
  WHERE Dept_ID = p_dept_id;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Bonus of ' || p_bonus_pct || '% added to salaries of department ' || p_dept_id || '.');
END;
/

-- Procedure 3: Account-to-Account Transfer
CREATE OR REPLACE PROCEDURE ExecuteFundTransfer(
  p_sender_id   IN NUMBER,
  p_receiver_id IN NUMBER,
  p_amount      IN NUMBER
) IS
  v_sender_balance NUMBER;
BEGIN
  SELECT Acc_Balance INTO v_sender_balance
  FROM BANK_ACCOUNTS
  WHERE Acc_ID = p_sender_id
  FOR UPDATE;

  IF v_sender_balance < p_amount THEN
    RAISE_APPLICATION_ERROR(-20001, 'Transfer failed: Insufficient funds.');
  END IF;

  UPDATE BANK_ACCOUNTS
  SET Acc_Balance = Acc_Balance - p_amount
  WHERE Acc_ID = p_sender_id;

  UPDATE BANK_ACCOUNTS
  SET Acc_Balance = Acc_Balance + p_amount
  WHERE Acc_ID = p_receiver_id;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('₹' || p_amount || ' successfully transferred from Account ' || p_sender_id || ' to Account ' || p_receiver_id || '.');
END;
/

-- Procedure Calls
EXEC CreditMonthlyInterest;
EXEC GrantBonusToDept(101, 10);
EXEC ExecuteFundTransfer(1001, 1002, 500);
