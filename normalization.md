# Database Normalization: Airbnb Schema

## Objective
To ensure the Airbnb database schema is properly normalized up to **Third Normal Form (3NF)** by eliminating redundancy and ensuring data integrity.


## 1. First Normal Form (1NF)

**Rule**: Eliminate repeating groups; ensure atomic values in each column.

### ✅ Applied:
- All tables have unique primary keys.
- Every field contains atomic values (e.g., no lists or multiple values in a single field).
- No repeating columns or groups.

**Example**:
```text
User Table:
- phone_number is atomic.
- role is stored as a single ENUM value.
```
## 2. Second Normal Form (2NF)
**Rule**: Be in 1NF and eliminate partial dependencies (i.e., no non-key attribute should depend on part of a composite key).

### ✅ Applied:
- All tables use single-column primary keys (UUIDs), so partial dependency is not applicable.

- Every non-key attribute depends on the whole primary key (which is one column).

**Example**:
```text
Booking Table:
- booking_id (PK)
- property_id, user_id (FKs)
- start_date, end_date, total_price depend entirely on booking_id.
```
✅ Conclusion: All tables meet 2NF.
## ✅ 3.Third Normal Form (3NF)
**Rule**:
- Be in 2NF
- Eliminate transitive dependencies
(i.e., no non-key attribute should depend on another non-key attribute)

✅ Explanation:
Each non-key attribute depends only on the primary key and not on another non-key.

✅ Example:
```text
User Table:
- user_id is the primary key.
- first_name, last_name, email, phone_number, role, etc., all depend directly on user_id.
- email does not determine first_name, and so on.
```
✅ Conclusion: All tables follow 3NF — no transitive dependencies.

