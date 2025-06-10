-- performance test before Partitioning
-- Run EXPLAIN ANALYZE on a regular Booking table query:

EXPLAIN ANALYZE 
SELECT * FROM Booking 
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

-- Partitioning the Booking table by the start_date column:

CREATE TABLE Booking_Partitioned (
    booking_id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    total_price DECIMAL(10,2),
    status VARCHAR(50),
    INDEX idx_start_date (start_date)
) PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p_before_2020 VALUES LESS THAN (2020),
    PARTITION p_2020 VALUES LESS THAN (2021),
    PARTITION p_2021 VALUES LESS THAN (2022),
    PARTITION p_2022 VALUES LESS THAN (2023),
    PARTITION p_2023 VALUES LESS THAN (2024),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);

-- performance test after Partitioning 

EXPLAIN ANALYZE 
SELECT * FROM Booking_Partitioned 
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
