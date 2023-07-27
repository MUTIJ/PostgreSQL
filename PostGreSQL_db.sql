/*this is a Centralised Relational database.
Here centralized in the context of databases refers to a single, centralized server that stores and manages all the data.
now in this case database is running on a single PostgreSQL server, and all the data is stored and managed within that server, 
PostgreSQL is an open-source, object-relational database system that supports the SQL language and provides a powerful set of features for managing and querying data. 
It is known for its scalability, extensibility, and support for advanced data types 
making it suitable for various applications ranging from small projects to large enterprise-level systems. For example the Health App*/


--table for registered users.
CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    confirm_password VARCHAR(100) NOT NULL
);
--table for admin

CREATE TABLE Admin (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    confirm_password VARCHAR(100) NOT NULL
);

--table for test done
CREATE TABLE Test_done (
    id SERIAL PRIMARY KEY,
    test VARCHAR(100) NOT NULL,
    description TEXT
);


ALTER TABLE Test_done
ADD COLUMN user_id INTEGER REFERENCES Users(id);

select * from Test_done;

--table doctors
CREATE TABLE Doctors (
    id SERIAL PRIMARY KEY,
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    contact VARCHAR(20) NOT NULL
);

-- table for health_articles 
CREATE TABLE health_articles (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    published_date DATE NOT NULL
);

-- table for Medicine 
CREATE TABLE Medicine (
    id SERIAL PRIMARY KEY,
    medicine_name VARCHAR(100) NOT NULL,
    dosage VARCHAR(50),
    stock_quantity INTEGER NOT NULL
);

-- table for Order_details 
CREATE TABLE Order_details (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES Users(id), 
    medicine_id INTEGER REFERENCES Medicine(id), 
    quantity INTEGER NOT NULL,
    order_date DATE NOT NULL
);

--Queries
-- Inserting data into Users Table
INSERT INTO Users (username, email, password, confirm_password)
VALUES ('Hillary Maina', 'Maina@gmail.com', 'Maina123', 'Maina123'),
       ('Kelvin Waweru', 'Waweru@gmail.com', 'WaweruK23', 'WaweruK23'),
	   ('James Otieno', 'Jamesoti@gmail.com', 'james.1212', 'james.1212'),
	   ('Karen Mombo', 'Mombokare@gmail.com', 'Mombokare3', 'Mombokare3'),
	   ('Daniel mwema', 'Mwemadan@gmail.com', 'Mwemadan67', 'Mwemadan67');

SELECT * FROM  USERS;

-- Insert data into Admin Table
INSERT INTO Admin (username, email, password, confirm_password)
VALUES ('Jane Wangare', 'WangareJane@gmail.com', 'wanjane9090', 'wanjane9090'),
       ('Jimbo Healthcare', 'JimboHcare@gmail.com', 'JimboHcare2002', 'JimboHcare2002'),
	   ('Kwetu Hospital', 'KwetuHospital@gmail.com', 'KwetuHospital1960', 'KwetuHospital1960'),
	   ('Jatim Chemist', 'Jatim@gmail.com', 'Jatim.2356', 'Jatim.2356'),
	   ('Kenyatta Hospital', 'Kenyattahospital@gmail.com', 'kenyHospiatla.195', 'kenyHospiatla.195');

-- Inserting data into Test_done Table
INSERT INTO Test_done (test, description, user_id)
VALUES ('Malaria Test', 'Prompt malaria diagnosis either by microscopy or rapid diagnostic tests (RDTs)', 1),
       ('X-Ray', 'X-ray of the left arm to check for fractures', 5),
       ('ECG', 'Electrocardiogram for heart rhythm assessment', 2),
	   ('Blood Test', 'Complete blood count and cholesterol test', 1),
       ('Allergy Tests', 'Allergy tests identify specific allergens that trigger allergic reactions in patients, helping to develop appropriate treatment plans.', 4),
       ('Computed Tomography (CT) Scan', 'CT scan is a specialized X-ray that creates detailed cross-sectional images of body structures. 
		It helps diagnose internal injuries, tumors, and other conditions', 3),
	   ('Colonoscopy', 'Colonoscopy is a procedure used to examine the colon and rectum for abnormalities, such as polyps or signs of colorectal cancer.', 2),
       ('Blood Glucose Test', 'This test measures the level of glucose (sugar) in the blood and is used to diagnose and manage diabetes.', 3);

-- Insert data into Doctors Table
INSERT INTO Doctors (doctor_name, specialization, contact)
VALUES ('Dr. Wilfred Onyango', 'Cardiologist', '+254738569024'),
       ('Dr. James Murithi', 'Orthopedic Surgeon', '+254757869004'),
	   ('Dr. Henry Onyancha', 'Nephrologists', '+254778232176'),
       ('Dr. Daniel Mwaniki', 'Neurologists ', '+254742358670'),
	   ('Dr. Glorious Wambua', 'Pathologists', '+254724678990'),
       ('Dr. Wendy Kamene', 'Plastic Surgeons', '+254702357894');

-- Insert data into health_articles Table
INSERT INTO health_articles (title, content, published_date)
VALUES ('10 Tips for a Healthy Heart', 'Lorem ipsum dolor sit amet, consectetur...', '2023-07-15'),
       ('Managing Stress in Daily Life', 'Nulla consectetur varius mi ac cursus.', '2023-07-20'),
	   ('The Importance of Regular Exercise', 'Regular exercise has numerous health benefits...', '2023-07-25'),
       ('Understanding the Basics of Nutrition', 'Proper nutrition is essential for maintaining good health...', '2023-07-26'),
       ('Tips for a Sound Sleep and Improved Health', 'Getting enough quality sleep is crucial for overall well-being...', '2023-07-27'),
       ('Preventing the Spread of Common Illnesses', 'Simple hygiene practices can help prevent the spread of infections...', '2023-07-28'),
       ('Managing Stress for Better Mental Health', 'Stress management techniques can promote mental well-being...', '2023-07-29');

select * from health_articles;

-- Insert data into Medicine Table
INSERT INTO Medicine (medicine_name, dosage, stock_quantity)
VALUES ('Aspirin', '100mg', 500),
       ('Paracetamol', '500mg', 1000),
	   ('Ibuprofen', '200mg', 800),
	   ('Amoxicillin', '500mg', 600),
	   ('Loratadine', '10mg', 300),
       ('Omeprazole', '20mg', 400),
       ('Simvastatin', '40mg', 200),
       ('Metformin', '1000mg', 500),
       ('Propranolol', '40mg', 150),
       ('Sertraline', '50mg', 250),
       ('Albuterol', '2mg', 300),
       ('Losartan', '50mg', 350),
       ('Acetaminophen', '500mg', 1000);
    
    
	
	select * from Medicine;

-- Insert data into Order_details Table
INSERT INTO Order_details (user_id, medicine_id, quantity, order_date)
VALUES (1, 1, 2, '2023-07-21'),
       (1, 2, 3, '2023-07-22'),
       (2, 1, 1, '2023-07-22'),
	   (1, 2, 1, '2023-07-30'),
       (1, 4, 2, '2023-07-31'),
	   (2, 5, 1, '2023-07-29'),
	   (3, 6, 3, '2023-07-28'),
	   (4, 10, 1, '2023-07-27'),
       (4, 11, 3, '2023-07-28');
	   
	   select * from Order_details;
	   
--Queries.
--SELECT QUERY
SELECT * FROM Users;

--INSERT QUERY
INSERT INTO health_articles (title, content, published_date)
VALUES ('Benefits of Yoga', 'Yoga improves flexibility and reduces stress...', '2023-08-01');

--UPDATE QUERY
UPDATE Medicine
SET stock_quantity = 700
WHERE medicine_name = 'Dexa';

--DELETE QUERY
DELETE FROM health_articles
WHERE published_date < '2023-07-30';

--JOIN QUERY
SELECT Order_details.id, Users.username, Medicine.medicine_name
FROM Order_details
JOIN Users ON Order_details.user_id = Users.id
JOIN Medicine ON Order_details.medicine_id = Medicine.id;

--GROUP BY QUERY
SELECT medicine_id, SUM(quantity) AS total_quantity
FROM Order_details
GROUP BY medicine_id;

--HAVING QUERY
SELECT medicine_id, SUM(quantity) AS total_quantity
FROM Order_details
GROUP BY medicine_id
HAVING SUM(quantity) > 5;

--WE CAN ALSO HAVE LIMIT QUERY
SELECT * FROM Medicine
LIMIT 5;

--SUBQUERY
SELECT *
FROM Medicine
WHERE stock_quantity > (SELECT AVG(stock_quantity) FROM Medicine);

-- Create a view to show the total quantity of each medicine ordered
CREATE VIEW MedicineOrderSummary AS
SELECT medicine_id, SUM(quantity) AS total_quantity
FROM Order_details
GROUP BY medicine_id;

-- Select data from the MedicineOrderSummary view
SELECT * FROM MedicineOrderSummary;

--COMMIT
BEGIN;
INSERT INTO Users (username, email, password, confirm_password)
VALUES ('Alice Nderitu', 'alice@gmail.com', 'ANderitu53', 'ANderitu53');
INSERT INTO Medicine (medicine_name, dosage, stock_quantity)
VALUES ('Alogliptin', '100mg', 100);
COMMIT;

--ROLLBACK
BEGIN;
INSERT INTO Users (username, email, password, confirm_password)
VALUES ('Bob Diego', 'bobdig@gmail.com', 'bobkenya50', 'bobkenya50');

INSERT INTO Medicine (medicine_name, dosage, stock_quantity)
VALUES ('Alendronic acid', '50mg', 1000); 
-- rooback will undo both INSERT operations in the transaction.
ROLLBACK;

--SAVEPOINT
BEGIN;
INSERT INTO Users (username, email, password, confirm_password)
VALUES ('Eve Mwigai', 'eveMwigai@gmail.com', 'eve6060ke', 'eve6060ke');
SAVEPOINT medicine_savepoint;
INSERT INTO Medicine (medicine_name, dosage, stock_quantity)
VALUES ('Losartan ', '200mg', 500);
-- Rollback to the 'medicine_savepoint', undoing the second operation, but retaining the first.
ROLLBACK TO SAVEPOINT medicine_savepoint;
-- Saving changes except the second operation.
COMMIT;

--Inserting Trigger on Medicine Table
CREATE OR REPLACE FUNCTION update_stock_quantity()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Medicine
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE id = NEW.medicine_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_stock_trigger
AFTER INSERT ON Order_details
FOR EACH ROW
EXECUTE FUNCTION update_stock_quantity();


--Deleting trigger on Medicine Table
CREATE OR REPLACE FUNCTION prevent_medicine_deletion()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM Order_details WHERE medicine_id = OLD.id) THEN
        RAISE EXCEPTION 'Cannot delete medicine with ID %, as it is referenced in Order_details', OLD.id;
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER prevent_medicine_deletion_trigger
BEFORE DELETE ON Medicine
FOR EACH ROW
EXECUTE FUNCTION prevent_medicine_deletion();


--Stored procedure adding user
CREATE OR REPLACE PROCEDURE add_user(
    p_username VARCHAR,
    p_email VARCHAR,
    p_password VARCHAR,
    p_confirm_password VARCHAR
)
LANGUAGE SQL
AS $$
INSERT INTO Users (username, email, password, confirm_password)
VALUES (p_username, p_email, p_password, p_confirm_password);
$$;

---stored procedure geting users count.
CREATE OR REPLACE PROCEDURE get_users_count(OUT count INTEGER)
LANGUAGE SQL
AS $$
SELECT COUNT(*) INTO count FROM Users;
$$;

--function to geting medicine stock quantity. 
CREATE OR REPLACE FUNCTION get_medicine_stock_quantity(medicine_id INTEGER)
RETURNS INTEGER
LANGUAGE SQL
AS $$
SELECT stock_quantity FROM Medicine WHERE id = medicine_id;
$$;

--Funcrion for grtting order total quantity.
CREATE OR REPLACE FUNCTION get_order_total_quantity(user_id INTEGER)
RETURNS INTEGER
LANGUAGE SQL
AS $$
SELECT SUM(quantity) FROM Order_details WHERE user_id = user_id;
$$;





