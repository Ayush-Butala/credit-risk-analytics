USE loan_default_analysis;

-- To import data

-- CREATE TABLE loan_defaults (
--     LoanID VARCHAR(50),
--     Age INT,
--     Income INT,
--     LoanAmount INT,
--     CreditScore INT,
--     MonthsEmployed INT,
--     NumCreditLines INT,
--     InterestRate DECIMAL(5,2),
--     LoanTerm INT,
--     DTIRatio DECIMAL(5,2),
--     Education VARCHAR(50),
--     EmploymentType VARCHAR(50),
--     MaritalStatus VARCHAR(50),
--     HasMortgage VARCHAR(10),
--     HasDependents VARCHAR(10),
--     LoanPurpose VARCHAR(50),
--     HasCoSigner VARCHAR(10),
--     DefaultStatus INT
-- );

-- SET GLOBAL local_infile = 1;

-- LOAD DATA LOCAL INFILE 'loan-default/versions/data/Loan_default.csv'
-- INTO TABLE loan_defaults
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- To view the whole table 
SELECT * FROM loan_defaults LIMIT 50;

-- Total number of loans
-- SELECT COUNT(*) AS Total_loan FROM loan_defaults; 

-- current default rate
-- SELECT AVG(DefaultStatus)*100 AS Default_rate FROM loan_defaults;

-- total number of defaulters
-- SELECT 
--     COUNT(*) AS TotalLoans,
--     SUM(DefaultStatus) AS TotalDefaultedCustomers,
--     AVG(DefaultStatus) * 100 AS OverallDefaultPercentage
-- FROM loan_defaults;

-- average income, loan amount, credit score
-- SELECT AVG(Income) AS avg_income,
-- AVG(LoanAmount) AS avg_loanAmount,
-- AVG(CreditScore) AS avg_creditScore
-- FROM loan_defaults;

-- For checking purpose
-- SELECT 
--     MIN(CreditScore),
--     MAX(CreditScore),
--     AVG(CreditScore)
-- FROM loan_defaults;

-- SELECT
-- 	CASE
-- 		WHEN CreditScore < 500 THEN 'Low'
-- 		WHEN CreditScore >= 500 AND CreditScore <= 650 THEN 'Medium'
-- 		ELSE 'High'
-- 	END AS CreditScoreCategory,
-- 	COUNT(*) AS TotalCustomers,
-- 	AVG(DefaultStatus) * 100 AS DefaultRate,
--  SUM(DefaultStatus) AS DefaultedCustomers
-- FROM loan_defaults
-- GROUP BY CreditScoreCategory
-- ORDER BY DefaultRate DESC;

-- SELECT
--     CASE
--         WHEN DTIRatio < 0.2 THEN 'LOW'
--         WHEN DTIRatio >= 0.2 AND DTIRatio <= 0.4 THEN 'MEDIUM'
--         ELSE 'HIGH'
--     END AS DTIRatioCategory,
--     COUNT(*) AS TotalCustomers,
--     AVG(DefaultStatus) * 100 AS DefaultRate,
-- 	   SUM(DefaultStatus) AS DefaultedCustomers
-- FROM loan_defaults
-- GROUP BY DTIRatioCategory
-- ORDER BY DefaultRate DESC;

-- SELECT 
--     MIN(InterestRate),
--     MAX(InterestRate),
--     AVG(InterestRate)
-- FROM loan_defaults;

-- SELECT
--     CASE
--         WHEN InterestRate < 10 THEN 'LOW'
--         WHEN InterestRate >= 10 AND InterestRate < 15 THEN 'MEDIUM'
--         WHEN InterestRate >= 15 AND InterestRate < 20 THEN 'HIGH'
--         ELSE 'VERY HIGH'
--     END AS InterestRateCategory,
--     COUNT(*) AS TotalCustomers,
--     AVG(DefaultStatus) * 100 AS DefaultRate,
-- 	SUM(DefaultStatus) AS DefaultedCustomers
-- FROM loan_defaults
-- GROUP BY InterestRateCategory
-- ORDER BY DefaultRate DESC;

-- SELECT 
--     CASE 
--         WHEN (LoanAmount / Income) < 1.0 THEN 'Low Leverage (Loan < 1x Income)'
--         WHEN (LoanAmount / Income) >= 1.0 AND (LoanAmount / Income) <= 2.5 THEN 'Medium Leverage (Loan is between (1x-2.5x))'
--         ELSE 'High Leverage (Loan > 2.5x Income)'
--     END AS LeverageCategory,
--     COUNT(*) AS TotalCustomers,
--     SUM(DefaultStatus) AS DefaultedCustomers,
--     AVG(DefaultStatus) * 100 AS DefaultRate
-- FROM loan_defaults
-- GROUP BY LeverageCategory
-- ORDER BY DefaultRate DESC;

-- To check number of employmenttype and how many are there in each of them
-- SELECT 
--     EmploymentType, 
--     COUNT(*) AS TotalCustomers
-- FROM loan_defaults
-- GROUP BY EmploymentType;

-- SELECT 
-- 	EmploymentType,
--     COUNT(*) AS TotalCustomers,
--     SUM(DefaultStatus) AS DefaultedCustomers,
--     AVG(DefaultStatus) * 100 AS DefaultRate
--     FROM loan_defaults
-- 	GROUP BY EmploymentType
-- 	ORDER BY DefaultRate DESC;

-- SELECT 
-- 	Education,
--     COUNT(*) AS TotalCustomers,
--     SUM(DefaultStatus) AS DefaultedCustomers,
--     AVG(DefaultStatus) * 100 AS DefaultRate
--     FROM loan_defaults
-- 	GROUP BY Education
-- 	ORDER BY DefaultRate DESC;

-- SELECT 
-- 	LoanPurpose,
--     COUNT(*) AS TotalCustomers,
--     SUM(DefaultStatus) AS DefaultedCustomers,
--     AVG(DefaultStatus) * 100 AS DefaultRate
--     FROM loan_defaults
-- 	GROUP BY LoanPurpose
-- 	ORDER BY DefaultRate DESC;

-- SELECT 
-- 	HasCoSigner,
--     COUNT(*) AS TotalCustomers,
--     SUM(DefaultStatus) AS DefaultedCustomers,
--     AVG(DefaultStatus) * 100 AS DefaultRate
--     FROM loan_defaults
-- 	GROUP BY HasCoSigner
-- 	ORDER BY DefaultRate DESC;

-- SELECT 
-- 	MaritalStatus,
--     COUNT(*) AS TotalCustomers,
--     SUM(DefaultStatus) AS DefaultedCustomers,
--     AVG(DefaultStatus) * 100 AS DefaultRate
--     FROM loan_defaults
-- 	GROUP BY MaritalStatus
-- 	ORDER BY DefaultRate DESC;

-- SELECT 
-- 	HasDependents,
--     COUNT(*) AS TotalCustomers,
--     SUM(DefaultStatus) AS DefaultedCustomers,
--     AVG(DefaultStatus) * 100 AS DefaultRate
--     FROM loan_defaults
-- 	GROUP BY HasDependents
-- 	ORDER BY DefaultRate DESC;