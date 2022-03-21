create database customers;
\c customers;
CREATE TABLE customers (id INT PRIMARY KEY, name TEXT, age INT);
INSERT INTO customers (id, name, age) VALUES (1, 'fred', 34);
INSERT INTO customers (id, name, age) VALUES (2, 'sue', 25);
INSERT INTO customers (id, name, age) VALUES (3, 'bill', 51);