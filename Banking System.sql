CREATE DATABASE bankdb;
USE bankdb;

-- Creating Customer table
CREATE TABLE Customer(
	CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(80) NOT NULL,
    Address VARCHAR(255),
    Phone VARCHAR(20),
    EmailID VARCHAR(100)
    );
    
-- Creating Branch table
CREATE TABLE Branch(
	BranchID INT AUTO_INCREMENT PRIMARY KEY,
    BranchName VARCHAR(100) NOT NULL,
    BranchAddress VARCHAR(255),
    MobileNumber VARCHAR(20)
    );

-- Creating Account table
CREATE TABLE Account(
	AccountNumber INT AUTO_INCREMENT PRIMARY KEY,
    AccountType VARCHAR(50) NOT NULL,
    Balance DECIMAL(10,2) DEFAULT 0.00,
    CustomerID INT NOT NULL,
    BranchID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

-- Creating Transaction table
CREATE TABLE Transaction(
	TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    AccountNumber INT NOT NULL,
    Date DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (AccountNumber) REFERENCES Account(AccountNumber)
    );
    
-- Creating Loan table
CREATE TABLE Loan(
	LoanID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    LoanAmount DECIMAL(12,2) NOT NULL,
    LoanType VARCHAR(50),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Creating Employee table
CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Position VARCHAR(50),
    BranchID INT NOT NULL,
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);







    
