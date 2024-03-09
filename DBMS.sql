-- Create a table named 'customer' with columns for user ID (primary key), customer name, email (unique), and date of birth.
CREATE TABLE customer(
    user_id NUMBER NOT NULL PRIMARY KEY,
    customer_name VARCHAR(20),
    email VARCHAR(30) UNIQUE,
    date_of_birth DATE
);

-- Create a table named 'advertisement' with columns for advertisement ID (primary key) and company name.
CREATE TABLE advertisement(
    advertisement_id NUMBER PRIMARY KEY,
    company VARCHAR(15)
);

-- Create a table named 'payment_info' with columns for card number (primary key), name on card, CCV, cost, and expiration date.
CREATE TABLE payment_info(
    card_number NUMBER NOT NULL PRIMARY KEY,
    name_on_card VARCHAR(20),
    ccv NUMBER(3),
    cost NUMBER,
    exp_date DATE
);

-- Alter the 'payment_info' table to remove the 'cost' column.
ALTER TABLE payment_info DROP COLUMN cost;

-- Create a table named 'driver' with columns for driver ID (primary key), driver name, rating (unique), and availability.
CREATE TABLE driver(
    driver_id NUMBER NOT NULL PRIMARY KEY,
    driver_name VARCHAR(20),
    rating NUMBER(3) UNIQUE,
    availlability VARCHAR(3)
);

-- Create a table named 'ride' with columns for ride ID (foreign key referencing driver ID), license plate, make, model, and year. Ride ID is also the primary key.
CREATE TABLE ride(
    ride_id REFERENCES driver(driver_id) PRIMARY KEY,
    license_plate VARCHAR(8) NOT NULL,
    make VARCHAR(10),
    model VARCHAR(20),
    years NUMBER
);

-- Create a table named 'trip' with multiple foreign keys and constraints, including a composite primary key.
CREATE TABLE trip(
    trip_id NUMBER NOT NULL,
    mem_id REFERENCES customer(user_id),
    driv_id REFERENCES driver(driver_id),
    CONSTRAINT t_pk PRIMARY KEY(mem_id, driv_id, trip_id),
    CONSTRAINT customer_fk FOREIGN KEY(mem_id) REFERENCES customer(user_id) ON DELETE CASCADE,
    CONSTRAINT driver_fk FOREIGN KEY(driv_id) REFERENCES driver(driver_id) ON DELETE CASCADE,
    current_location VARCHAR(30),
    destination VARCHAR(30) UNIQUE,
    cost NUMBER NOT NULL
);

-- Create a 'reviews' table with a composite primary key and foreign keys referencing customer and driver tables.
CREATE TABLE reviews(
    mem_id REFERENCES customer(user_id),
    driv_id REFERENCES driver(driver_id),
    CONSTRAINT review_id PRIMARY KEY(mem_id, driv_id),
    CONSTRAINT customer_fk2 FOREIGN KEY(mem_id) REFERENCES customer(user_id) ON DELETE CASCADE,
    CONSTRAINT driver_fk2 FOREIGN KEY(driv_id) REFERENCES driver(driver_id) ON DELETE CASCADE,
    review VARCHAR(100),
    rating NUMBER
);

-- Create a 'trip_history' table with a composite primary key and a foreign key referencing the 'trip' table.
CREATE TABLE trip_history(
    mem_id NUMBER,
    driv_id NUMBER,
    trip_id NUMBER,
    CONSTRAINT triphistory_fk FOREIGN KEY(mem_id, driv_id, trip_id) REFERENCES trip(mem_id, driv_id, trip_id),
    CONSTRAINT trip_history_pk PRIMARY KEY(mem_id, driv_id, trip_id),
    dateandtime DATE,
    current_location VARCHAR(30),
    destination VARCHAR(30)
);

-- Insert statements to populate the 'customer', 'driver', 'payment_info', 'ride', 'trip', 'reviews', and 'trip_history' tables with initial data.

-- 'SELECT' statements are used to query the database, including retrieving table names, specific columns from tables, and creating views.

-- 'ALTER' and 'DROP' statements are used to modify the structure of tables and remove them.

-- 'CREATE VIEW' statements are used to create virtual tables (views) based on the result-set of an SQL statement.

-- The final part includes 'SELECT' statements that perform joins between tables to fetch related data.
