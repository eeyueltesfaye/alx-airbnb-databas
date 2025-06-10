-- Analyze performance before creating indexes

EXPLAIN ANALYZE 
SELECT * FROM User WHERE email = 'abel.t@example.com';  

EXPLAIN ANALYZE 
SELECT * FROM Booking WHERE user_id = 1;  

EXPLAIN ANALYZE 
SELECT * FROM Property WHERE location = '789 Mountain Road';  


-- Create indexes for the User table

CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_id ON User(user_id);

-- Create indexes for the Booking table

CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_end_date ON Booking(end_date);

-- Create indexes for the Property table

CREATE INDEX idx_property_id ON Property(property_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_name ON Property(name);

-- Analyze performance after creating indexes

EXPLAIN ANALYZE 
SELECT * FROM User WHERE email = 'abel.t@example.com';  

EXPLAIN ANALYZE 
SELECT * FROM Booking WHERE user_id = 1; 

EXPLAIN ANALYZE 
SELECT * FROM Property WHERE location = '789 Mountain Road'; 

-- compare the query execution time before and after adding the index  