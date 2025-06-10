#  Partition Performance Report

##  Objective
Partition the `Booking` table based on **start_date** to improve query performance.


##  Step 1: Initial Query Performance  
Before partitioning, running:
```sql
EXPLAIN ANALYZE 
SELECT * FROM Booking 
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

**Observations:**
- **High row scans** due to full-table access.

- **Slower execution time** when querying by date range.

## Step 2: Implement Partitioning
Partitioning the table using **RANGE on YEAR(start_date):**

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
```
✅ **This reduces query overhead by limiting searches to specific partitions.**

## Step 3: Post-Optimization Performance Testing
Running the **same query** on the partitioned table:

```sql
EXPLAIN ANALYZE 
SELECT * FROM Booking_Partitioned 
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
```

**Observations:**
✅ **Reduced row scans**, as MySQL accesses only the relevant partition.

✅ **Faster execution** due to improved filtering efficiency.

✅ **Better scalability** as large datasets won't slow down queries.

## Conclusion
1️⃣ **Before Partitioning:** Full-table scans slowed down queries. 
2️⃣ **After Partitioning:** Query execution is faster & more efficient, scanning only relevant partitions. 
3️⃣ **Indexes** on `start_date` further reduce query time.

🚀 **Partitioning significantly improves performance when handling large datasets!**