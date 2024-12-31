CREATE DATABASE insurance_policy;

USE insurance_policy;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address VARCHAR(255),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    occupation VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Policies (
    policy_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    policy_type VARCHAR(50), 
    coverage_amount INT,
    premium_amount INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50),  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

CREATE TABLE Claims (
    claim_id INT PRIMARY KEY AUTO_INCREMENT,
    policy_id INT,
    claim_date DATE,
    claim_amount INT,
    claim_status VARCHAR(50), 
    FOREIGN KEY (policy_id) REFERENCES Policies(policy_id) ON DELETE CASCADE
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    policy_id INT,
    payment_date DATE,
    payment_amount INT,
    payment_method VARCHAR(50), 
    transaction_id VARCHAR(50),
    FOREIGN KEY (policy_id) REFERENCES Policies(policy_id) ON DELETE CASCADE
);

CREATE TABLE Accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,                    
    balance INT,  
    last_transaction_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);




INSERT INTO Customers (first_name, last_name, address, phone_number, email, occupation)
VALUES
('Hari', 'Shrestha', 'Kathmandu, Nepal', '9851234567', 'hari.shrestha@email.com', 'Engineer'),
('Sita', 'Rai', 'Lalitpur, Nepal', '9847654321', 'sita.rai@email.com', 'Teacher'),
('Ram', 'Khanal', 'Pokhara, Nepal', '9841243567', 'ram.khanal@email.com', 'Doctor'),
('Pooja', 'Bhandari', 'Biratnagar, Nepal', '9837654321', 'pooja.bhandari@email.com', 'Nurse'),
('Sanjay', 'Adhikari', 'Chitwan, Nepal', '9812345678', 'sanjay.adhikari@email.com', 'Businessman'),
('Anita', 'Gurung', 'Bhaktapur, Nepal', '9867554332', 'anita.gurung@email.com', 'Engineer'),
('Ravi', 'Shrestha', 'Kathmandu, Nepal', '9812345679', 'ravi.shrestha@email.com', 'Teacher'),
('Mina', 'Thapa', 'Lalitpur, Nepal', '9811234568', 'mina.thapa@email.com', 'Nurse'),
('Pradeep', 'Koirala', 'Pokhara, Nepal', '9856789123', 'pradeep.koirala@email.com', 'Doctor'),
('Jaya', 'Nepali', 'Biratnagar, Nepal', '9801234567', 'jaya.nepali@email.com', 'Businesswoman');


INSERT INTO Policies (customer_id, policy_type, coverage_amount, premium_amount, start_date, end_date, status)
VALUES
(1, 'Life', 1000000, 12000, '2023-01-01', '2028-01-01', 'active'),
(2, 'Health', 500000, 8000, '2023-02-01', '2028-02-01', 'active'),
(3, 'Auto', 5000000, 15000, '2023-03-01', '2025-03-01', 'expired'),
(4, 'Health', 300000, 6000, '2023-04-01', '2028-04-01', 'active'),
(5, 'Life', 2000000, 15000, '2023-05-01', '2028-05-01', 'active'),
(6, 'Life', 1200000, 11000, '2023-06-01', '2028-06-01', 'active'),
(7, 'Health', 800000, 9000, '2023-07-01', '2028-07-01', 'active'),
(8, 'Auto', 3500000, 10000, '2023-08-01', '2025-08-01', 'expired'),
(9, 'Health', 700000, 9500, '2023-09-01', '2028-09-01', 'active'),
(10, 'Life', 1500000, 13000, '2023-10-01', '2028-10-01', 'active');


INSERT INTO Claims (policy_id, claim_date, claim_amount, claim_status)
VALUES
(1, '2024-06-15', 500000, 'approved'),
(2, '2024-07-20', 200000, 'pending'),
(3, '2023-12-05', 1000000, 'approved'),
(4, '2024-08-01', 150000, 'denied'),
(5, '2024-09-10', 1000000, 'approved'),
(6, '2024-06-25', 400000, 'approved'),
(7, '2024-07-30', 300000, 'pending'),
(8, '2024-09-01', 500000, 'approved'),
(9, '2024-10-15', 200000, 'approved'),
(10, '2024-11-01', 800000, 'denied');


INSERT INTO Payments (policy_id, payment_date, payment_amount, payment_method, transaction_id)
VALUES
(1, '2023-01-10', 12000, 'Bank Transfer', 'TXN12345'),
(2, '2023-02-05', 8000, 'Cash', 'TXN12346'),
(3, '2023-03-10', 15000, 'Credit Card', 'TXN12347'),
(4, '2023-04-20', 6000, 'Bank Transfer', 'TXN12348'),
(5, '2023-05-25', 15000, 'Credit Card', 'TXN12349'),
(6, '2023-06-15', 11000, 'Bank Transfer', 'TXN12350'),
(7, '2023-07-25', 9000, 'Cash', 'TXN12351'),
(8, '2023-08-10', 10000, 'Credit Card', 'TXN12352'),
(9, '2023-09-05', 9500, 'Bank Transfer', 'TXN12353'),
(10, '2023-10-15', 13000, 'Credit Card', 'TXN12354'),
(1, '2024-01-10', 12000, 'Bank Transfer', 'TXN12355'),
(2, '2024-02-05', 8000, 'Cash', 'TXN12356'),
(3, '2024-03-10', 15000, 'Credit Card', 'TXN12357'),
(4, '2024-04-20', 6000, 'Bank Transfer', 'TXN12358'),
(5, '2024-05-25', 15000, 'Credit Card', 'TXN12359');


SELECT * FROM Policies 
JOIN Customers ON Policies.customer_id = Customers.customer_id
WHERE Policies.policy_type = 'Life' AND Policies.status = 'active';


SELECT first_name, email FROM Customers;


SELECT * FROM Policies 
WHERE policy_type = 'Life'
UNION
SELECT * FROM Policies 
WHERE policy_type = 'Health';

SELECT * FROM Policies 
WHERE policy_type = 'Life'
AND policy_id NOT IN (SELECT policy_id FROM Policies WHERE policy_type = 'Health');

SELECT * FROM Policies
JOIN Claims ON Policies.policy_id = Claims.policy_id
WHERE Policies.status = 'active' AND Policies.policy_type = 'Life';

SELECT * FROM Customers
LEFT JOIN Claims ON Customers.customer_id = Claims.policy_id;

SELECT * FROM Claims
RIGHT JOIN Customers ON Claims.policy_id = Customers.customer_id;

SELECT * FROM Customers
LEFT JOIN Claims ON Customers.customer_id = Claims.policy_id
UNION
SELECT * FROM Customers
RIGHT JOIN Claims ON Customers.customer_id = Claims.policy_id;

SELECT * FROM Customers, Policies;

DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `transaction_error_case`()
	START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE customer_id = 1;
UPDATE accounts SET balance = balance - 100 WHERE customer_id = 222;
	COMMIT;
DELIMITER ;


DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `transaction_success`()
	START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE customer_id = 1;
UPDATE accounts SET balance = balance + 100 WHERE customer_id = 2;
	COMMIT;
DELIMITER ;

DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `transaction_with_error_handling`()
ROLLBACK;
	SELECT 'Transaction failed, rollback executed' AS message;
	START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE customer_id = 1;
UPDATE accounts SET balance = balance - 100 WHERE customer_id = 90;
	COMMIT;
SELECT 'Transaction successful, Changes commited' AS message;
DELIMITER ;