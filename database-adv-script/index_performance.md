# 🚀 Indexing and Performance Testing 

## 📌 Objective
This guide explains **how to create indexes** to improve query performance in an Airbnb-Clone database.  
We also use `EXPLAIN ANALYZE` to measure query execution time **before and after indexing**.


##  Step 1: Identify High-Usage Columns
Indexes should be created on columns frequently used in:
- **WHERE clauses**
- **JOIN conditions**
- **ORDER BY sorting**

### **Recommended Indexes**
#### **User Table**
- `user_id` → Used in joins
- `email` → Used for authentication/searching

#### **Booking Table**
- `booking_id` → Primary Key
- `user_id`, `property_id` → Used in joins
- `start_date`, `end_date` → Used for filtering and sorting

#### **Property Table**
- `property_id` → Primary Key
- `name`, `location` → Used in search queries

---

##  Step 2: Create Indexes
Save this in `database_index.sql`:

```sql
-- Indexes for User table
CREATE INDEX idx_user_id ON User(user_id);
CREATE INDEX idx_user_email ON User(email);

-- Indexes for Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_end_date ON Booking(end_date);

-- Indexes for Property table
CREATE INDEX idx_property_name ON Property(name);
CREATE INDEX idx_property_location ON Property(location);
```

## Step 3: Monitor Performance
use Tools (**Solar Winds Database Performance Analyzer**, **NeW Relic**) or SQL Commands **EXPLAIN**, **SHOWPROFILE** to measure the performance improvement.

**Before indexing, test query speed:**
```sql
 EXPLAIN ANALYZE 
SELECT * FROM Booking 
WHERE end_date >= '2025-07-01';
```

**After creating indexes, run the same query again:**
```sql 
EXPLAIN ANALYZE 
SELECT * FROM Booking 
WHERE end_date >= '2025-07-01';
```

✅ Compare execution time and row scans to check improvements.

## 4. Balance Indexes

- Avoid over-indexing as it can slow down **INSERT**, **UPDATE**, and **DELETE** operations. 

**In our situation, over-indexing is not an issue.**

## Conclusion
Using indexes **optimizes database performance** by:

- **Reducing query execution time**

- **Improving efficiency of joins, sorting, and lookups**

- **Enhancing scalability for high-traffic applications**