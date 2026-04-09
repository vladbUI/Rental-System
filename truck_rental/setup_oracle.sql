-- Setup tables for Truck Rental System (Oracle 21c XE)
-- Run as: sqlplus system/oraclenigabo@localhost/XE @setup_oracle.sql

-- Drop tables if they exist
BEGIN EXECUTE IMMEDIATE 'DROP TABLE assets'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE customers'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- Create CUSTOMERS table
CREATE TABLE customers (
    customer_id     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username        VARCHAR2(50) NOT NULL UNIQUE,
    password        VARCHAR2(100) NOT NULL,
    role            VARCHAR2(20) DEFAULT 'customer',
    first_name      VARCHAR2(50),
    middle_name     VARCHAR2(50),
    last_name       VARCHAR2(50),
    address         VARCHAR2(200),
    contact_number  VARCHAR2(20),
    customer_type   VARCHAR2(30)
);

-- Create ASSETS table
CREATE TABLE assets (
    asset_id        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    brand           VARCHAR2(100),
    model           VARCHAR2(100),
    asset_type      VARCHAR2(50),
    operator_name   VARCHAR2(100),
    status          VARCHAR2(20) DEFAULT 'available'
);

-- Insert default admin account
INSERT INTO customers (username, password, role, first_name, last_name)
VALUES ('admin', 'admin', 'admin', 'System', 'Administrator');

-- Insert sample assets
INSERT INTO assets (brand, model, asset_type, operator_name, status)
VALUES ('Caterpillar', '320 GC', 'Excavator', 'Juan Dela Cruz', 'available');

INSERT INTO assets (brand, model, asset_type, operator_name, status)
VALUES ('Komatsu', 'PC200', 'Excavator', 'Pedro Santos', 'available');

INSERT INTO assets (brand, model, asset_type, operator_name, status)
VALUES ('Isuzu', 'NQR', 'Dump Truck', 'Marco Reyes', 'available');

COMMIT;

SELECT 'SETUP COMPLETE!' AS status FROM dual;
SELECT table_name FROM user_tables WHERE table_name IN ('CUSTOMERS','ASSETS') ORDER BY table_name;
SELECT COUNT(*) AS customer_count FROM customers;
SELECT COUNT(*) AS asset_count FROM assets;

EXIT;
