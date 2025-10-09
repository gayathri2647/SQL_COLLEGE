CREATE DATABASE BankDB;
USE BankDB;

--Create Table
CREATE TABLE BankAccounts (
    AccountNo INT PRIMARY KEY,
    HolderName VARCHAR(100),
    Balance DECIMAL(10,2)
);

--Insert Sample Data
INSERT INTO BankAccounts VALUES (101, 'Ravi', 5000.00);
INSERT INTO BankAccounts VALUES (102, 'Priya', 3000.00);

-- Check data
SELECT * FROM BankAccounts;

--Perform Transaction (Money Transfer)
BEGIN TRANSACTION;

UPDATE BankAccounts
SET Balance = Balance - 1000
WHERE AccountNo = 101;  -- Debit from Ravi

--Check if sufficient balance
IF (SELECT Balance FROM BankAccounts WHERE AccountNo = 101) < 0
BEGIN
    PRINT 'Insufficient balance! Rolling back...';
    ROLLBACK TRANSACTION;
    RETURN;
END;

UPDATE BankAccounts
SET Balance = Balance + 1000
WHERE AccountNo = 102;  -- Credit to Priya

-- Check for errors and commit/rollback
IF @@ERROR = 0
BEGIN
    COMMIT TRANSACTION;
    PRINT 'Transaction Successful: Amount Transferred';
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Transaction Failed: Changes Reverted';
END;

--Check Result
SELECT * FROM BankAccounts;
