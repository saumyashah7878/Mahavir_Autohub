
CREATE TABLE SHOWROOM (
 showroom_id INT PRIMARY KEY ,
 showroom_name VARCHAR(100) NOT NULL,
 address VARCHAR(200), city VARCHAR(50),
 state VARCHAR(50), pincode VARCHAR(10),
 phone VARCHAR(15), email VARCHAR(100),
 established_date DATE, rc_book VARCHAR(50),
 status VARCHAR(20) DEFAULT 'Active'
);

CREATE TABLE EMPLOYEE (
 employee_id INT PRIMARY KEY ,
 showroom_id INT NOT NULL,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50), designation VARCHAR(50),
 salary DECIMAL(10,2), phone VARCHAR(15),
 email VARCHAR(100), hire_date DATE,
 status VARCHAR(20) DEFAULT 'Active'
);

CREATE TABLE SUPPLIER (
 supplier_id INT PRIMARY KEY ,
 supplier_name VARCHAR(100) NOT NULL,
 contact_person VARCHAR(100), phone VARCHAR(15),
 email VARCHAR(100), address VARCHAR(200),
 gst_no VARCHAR(20), status VARCHAR(20) DEFAULT 'Active'
);

CREATE TABLE CAR (
 car_id INT PRIMARY KEY ,
 showroom_id INT NOT NULL, supplier_id INT NOT NULL,
 brand VARCHAR(50) NOT NULL, model VARCHAR(100) NOT NULL,
 variant VARCHAR(100), fuel_type VARCHAR(30),
 price DECIMAL(12,2) NOT NULL,
 status VARCHAR(20) DEFAULT 'Available'
);

CREATE TABLE CUSTOMER (
 customer_id INT PRIMARY KEY ,
 first_name VARCHAR(50) NOT NULL, last_name VARCHAR(50),
 phone VARCHAR(15) NOT NULL, email VARCHAR(100),
 address VARCHAR(200), aadhaar_no VARCHAR(12) UNIQUE,
 pan_no VARCHAR(10) UNIQUE
);

CREATE TABLE SALES (
 sale_id INT PRIMARY KEY ,
 customer_id INT NOT NULL, employee_id INT NOT NULL,
 car_id INT NOT NULL, sale_date DATE NOT NULL,
 discount DECIMAL(12,2) DEFAULT 0,
 tax DECIMAL(12,2) DEFAULT 0,
 total_amount DECIMAL(12,2) NOT NULL,
 payment_status VARCHAR(30) DEFAULT 'Pending',
 UNIQUE (car_id)
);

CREATE TABLE SERVICE (
 jobcard_no INT PRIMARY KEY ,
 customer_id INT NOT NULL, car_id INT NOT NULL,
 service_date DATE NOT NULL, service_type VARCHAR(100),
 service_cost DECIMAL(12,2) DEFAULT 0,
 next_service_date DATE, status VARCHAR(30) DEFAULT 'Pending'
);

CREATE TABLE PAYMENT (
 payment_id INT PRIMARY KEY ,
 sale_id INT NOT NULL, payment_date DATE NOT NULL,
 amount DECIMAL(12,2) NOT NULL, payment_mode VARCHAR(30),
 transaction_no VARCHAR(100), status VARCHAR(30) DEFAULT 'Pending'
 );

-- 1. SHOWROOM
INSERT INTO SHOWROOM
(showroom_id,showroom_name,address,city,state,pincode,phone,email,established_date,rc_book,status)
VALUES
(1,'Prime Motors','MG Road','Ahmedabad','Gujarat','380001','9876500001','prime@gmail.com','2018-01-15','RC101','Active'),
(2,'City Cars','SG Highway','Ahmedabad','Gujarat','380054','9876500002','city@gmail.com','2019-03-20','RC102','Active'),
(3,'Royal Automobiles','Ring Road','Surat','Gujarat','395002','9876500003','royal@gmail.com','2020-06-10','RC103','Active'),
(4,'Speed Motors','Alkapuri','Vadodara','Gujarat','390007','9876500004','speed@gmail.com','2017-09-12','RC104','Active'),
(5,'Dream Cars','Kalawad Road','Rajkot','Gujarat','360001','9876500005','dream@gmail.com','2021-02-25','RC105','Active');

-- 2. EMPLOYEE
INSERT INTO EMPLOYEE
(employee_id,showroom_id,first_name,last_name,designation,salary,phone,email,hire_date,status)
VALUES
(1,1,'Amit','Patel','Manager',55000,'9811100001','amit@gmail.com','2020-01-10','Active'),
(2,2,'Riya','Shah','Sales Executive',30000,'9811100002','riya@gmail.com','2021-04-15','Active'),
(3,3,'Rahul','Mehta','Accountant',35000,'9811100003','rahul@gmail.com','2022-02-20','Active'),
(4,4,'Neha','Joshi','Sales Executive',32000,'9811100004','neha@gmail.com','2023-06-01','Active'),
(5,5,'Karan','Desai','Service Advisor',28000,'9811100005','karan@gmail.com','2022-11-12','Active');

-- 3. SUPPLIER
INSERT INTO SUPPLIER
(supplier_id,supplier_name,contact_person,phone,email,address,gst_no,status)
VALUES
(1,'Auto Supply Ltd','Vijay Shah','9822200001','auto@gmail.com','Ahmedabad','GSTSUP001','Active'),
(2,'Motor India','Rakesh Patel','9822200002','motor@gmail.com','Surat','GSTSUP002','Active'),
(3,'Car World Ltd','Sanjay Mehta','9822200003','carworld@gmail.com','Vadodara','GSTSUP003','Active'),
(4,'Speed Auto Ltd','Amit Joshi','9822200004','speedauto@gmail.com','Rajkot','GSTSUP004','Active'),
(5,'National Motors','Manish Desai','9822200005','national@gmail.com','Gandhinagar','GSTSUP005','Active');

-- 4. CAR
INSERT INTO CAR
(car_id,showroom_id,supplier_id,brand,model,variant,fuel_type,price,status)
VALUES
(1,1,1,'Hyundai','Creta','SX','Petrol',1200000,'Sold'),
(2,2,2,'Maruti Suzuki','Swift','VXI','Petrol',750000,'Sold'),
(3,3,3,'Tata','Nexon','XZ+','Diesel',1100000,'Sold'),
(4,4,4,'Mahindra','Thar','LX','Diesel',1500000,'Sold'),
(5,5,5,'Honda','City','ZX','Petrol',1400000,'Sold');

-- 5. CUSTOMER
INSERT INTO CUSTOMER
(customer_id,first_name,last_name,phone,email,address,aadhaar_no,pan_no)
VALUES
(1,'Raj','Sharma','9833300001','raj@gmail.com','Ahmedabad','123456789001','ABCDE1234F'),
(2,'Priya','Verma','9833300002','priya@gmail.com','Surat','123456789002','BCDEF2345G'),
(3,'Arjun','Singh','9833300003','arjun@gmail.com','Vadodara','123456789003','CDEFG3456H'),
(4,'Sneha','Rao','9833300004','sneha@gmail.com','Rajkot','123456789004','DEFGH4567J'),
(5,'Vikram','Joshi','9833300005','vikram@gmail.com','Gandhinagar','123456789005','EFGHI5678K');

-- 6. SALES
INSERT INTO SALES
(sale_id,customer_id,employee_id,car_id,sale_date,discount,tax,total_amount,payment_status)
VALUES
(1,1,1,1,'2026-01-10',20000,180000,1360000,'Paid'),
(2,2,2,2,'2026-02-15',10000,100000,840000,'Paid'),
(3,3,3,3,'2026-03-05',15000,150000,1235000,'Paid'),
(4,4,4,4,'2026-04-12',25000,200000,1675000,'Pending'),
(5,5,5,5,'2026-05-20',30000,180000,1550000,'Pending');

-- 7. SERVICE
INSERT INTO SERVICE
(jobcard_no,customer_id,car_id,service_date,service_type,service_cost,next_service_date,status)
VALUES
(1,1,1,'2026-02-10','Oil Change',3000,'2026-08-10','Completed'),
(2,2,2,'2026-03-15','General Service',2500,'2026-09-15','Completed'),
(3,3,3,'2026-04-05','Engine Check',5000,'2026-10-05','Pending'),
(4,4,4,'2026-05-12','Brake Service',4500,'2026-11-12','Completed'),
(5,5,5,'2026-06-20','AC Service',3500,'2026-12-20','Pending');

-- 8. PAYMENT
INSERT INTO PAYMENT
(payment_id,sale_id,payment_date,amount,payment_mode,transaction_no,status)
VALUES
(1,1,'2026-01-10',1360000,'UPI','TXN1001','Completed'),
(2,2,'2026-02-15',840000,'Card','TXN1002','Completed'),
(3,3,'2026-03-05',1235000,'Bank Transfer','TXN1003','Completed'),
(4,4,'2026-04-12',500000,'UPI','TXN1004','Completed'),
(5,5,'2026-05-20',700000,'Cash','TXN1005','Completed');

-- DISPLAY ALL TABLES
SELECT * FROM SHOWROOM;
SELECT * FROM EMPLOYEE;
SELECT * FROM SUPPLIER;
SELECT * FROM CAR;
SELECT * FROM CUSTOMER;
SELECT * FROM SALES;
SELECT * FROM SERVICE;
SELECT * FROM PAYMENT;

-- 1. Display available cars, sorted by price
SELECT * FROM CAR
WHERE status = 'Sold'
ORDER BY car_id ASC;

-- 2. Employees with showroom names, sorted by showroom
SELECT E.first_name, E.last_name, E.designation, S.showroom_name
FROM EMPLOYEE E
JOIN SHOWROOM S ON E.showroom_id = S.showroom_id
ORDER BY S.showroom_name ASC;

-- 3. Customers with purchased car details, sorted by amount
SELECT C.first_name, C.last_name, CA.brand, CA.model, SA.total_amount
FROM CUSTOMER C
JOIN SALES SA ON C.customer_id = SA.customer_id
JOIN CAR CA ON SA.car_id = CA.car_id
ORDER BY SA.total_amount DESC;

-- 4. Total sales revenue by payment status
SELECT payment_status, SUM(total_amount) AS total_revenue
FROM SALES
GROUP BY payment_status
ORDER BY total_revenue DESC;

-- 5. Cars sorted from most expensive to cheapest
SELECT brand, model, price
FROM CAR
ORDER BY price DESC;

-- 6. Employees in each showroom, highest count first
SELECT S.showroom_name, COUNT(E.employee_id) AS total_employees
FROM SHOWROOM S
LEFT JOIN EMPLOYEE E ON S.showroom_id = E.showroom_id
GROUP BY S.showroom_id, S.showroom_name
ORDER BY total_employees DESC, S.showroom_name ASC;

-- 7. Pending sales, newest first
SELECT sale_id, customer_id, total_amount, payment_status, sale_date
FROM SALES
WHERE payment_status = 'Pending'
ORDER BY sale_date ASC;

-- 8. Car service history, newest first
SELECT C.first_name, C.last_name, CA.brand, CA.model,
SE.service_type, SE.service_cost, SE.status, SE.service_date
FROM SERVICE SE
JOIN CUSTOMER C ON SE.customer_id = C.customer_id
JOIN CAR CA ON SE.car_id = CA.car_id
ORDER BY SE.service_date DESC;

-- 9. Completed payments, highest amount first
SELECT payment_id, sale_id, amount, payment_mode, status
FROM PAYMENT
WHERE status = 'Completed'
ORDER BY payment_id DESC;

-- 10. Suppliers with their cars, sorted by supplier name
SELECT S.supplier_name, S.contact_person, CA.brand, CA.model, CA.price
FROM SUPPLIER S
JOIN CAR CA ON S.supplier_id = CA.supplier_id
ORDER BY S.supplier_name ASC;

-----
CREATE OR REPLACE FUNCTION get_car_price(p_id INT)
RETURNS NUMERIC AS $$
DECLARE
    f_price NUMERIC;
BEGIN
    SELECT price INTO f_price
    FROM CAR
    WHERE car_id = p_id;

    RETURN f_price;
END;
$$ LANGUAGE plpgsql;

SELECT get_car_price(1)
as car_price;
----
CREATE OR REPLACE FUNCTION count_cars()
RETURNS INT AS $$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(*) INTO total
    FROM CAR;

    RETURN total;
END;
$$ LANGUAGE plpgsql;

SELECT count_cars()
as car_count;

CREATE OR REPLACE PROCEDURE update_car_price(
    p_id INT,
    p_price NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE CAR
    SET price = p_price
    WHERE car_id = p_id;

    RAISE NOTICE 'Car price updated successfully';
END;
$$;

CALL update_car_price(1, 750000);

CREATE OR REPLACE PROCEDURE insert_car(
    p_car_id INT,
    p_showroom_id INT,
    p_supplier_id INT,
    p_brand VARCHAR,
    p_model VARCHAR,
    p_variant VARCHAR,
    p_fuel_type VARCHAR,
    p_price NUMERIC,
    p_status VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO CAR (
        car_id, showroom_id, supplier_id, brand,
        model, variant, fuel_type, price, status
    )
    VALUES (
        p_car_id, p_showroom_id, p_supplier_id, p_brand,
        p_model, p_variant, p_fuel_type, p_price, p_status
    );

    RAISE NOTICE 'Car inserted successfully';
END;
$$;

CALL insert_car(
    101, 1, 1, 'Toyota', 'Innova',
    'ZX', 'Diesel', 2500000, 'Available'
);

CREATE OR REPLACE FUNCTION trg_mark_car_sold_func()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE CAR
    SET status = 'Sold'
    WHERE car_id = NEW.car_id;

    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_mark_car_sold
AFTER INSERT ON SALES
FOR EACH ROW
EXECUTE FUNCTION trg_mark_car_sold_func();

INSERT INTO SALES (
    sale_id, customer_id, employee_id, car_id,
    sale_date, discount, tax, total_amount,
    payment_status
)
VALUES (
    501, 101, 301, 201,
    CURRENT_DATE, 5000, 18000, 513000,
    'Pending'
);

CREATE OR REPLACE FUNCTION set_service_status()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    NEW.status := 'Pending';
    RETURN NEW;
END;
$$;

CREATE TRIGGER service_status_trigger
BEFORE INSERT ON SERVICE
FOR EACH ROW
EXECUTE FUNCTION set_service_status();

INSERT INTO SERVICE
(jobcard_no, customer_id, car_id, service_date,
 service_type, service_cost, next_service_date, status)
VALUES
(1001, 101, 201, CURRENT_DATE,
 'General Service', 2500, CURRENT_DATE + 90, 'Pending');
----

DO $$
DECLARE

    car_cursor CURSOR FOR
        SELECT car_id, brand, model, price
        FROM CAR;
    
    c_id car.car_id%type;
    c_brand car.brand%type;
    c_model car.model%type;
    c_price car.price%type;

BEGIN
    OPEN car_cursor;

    LOOP
        FETCH car_cursor INTO c_id,c_brand,c_model,c_price;
        EXIT WHEN NOT FOUND;

        RAISE NOTICE 'Car ID: %, Brand: %, Model: %, Price: %',
        c_id,c_brand,c_model,c_price;
    END LOOP;

    CLOSE car_cursor;
END;
$$;
-----

DO $$
DECLARE

    cust_cursor CURSOR FOR
        SELECT customer_id, first_name, last_name
        FROM CUSTOMER;
    
    cu_id Customer.customer_id%type;
    cu_fname Customer.first_name%type;
    cu_lname Customer.last_name%type;

BEGIN
    OPEN cust_cursor;

    LOOP
        FETCH cust_cursor INTO cu_id,cu_fname,cu_lname;
        EXIT WHEN NOT FOUND;

        RAISE NOTICE 'Customer ID: %, Name: % %',
        cu_id,cu_fname,cu_lname;
    END LOOP;

    CLOSE cust_cursor;
END;
$$;