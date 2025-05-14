# Airbnb Database Schema (DDL)

This directory contains the SQL schema definition for the Airbnb database project.

## Files

- `schema.sql`: Defines all database tables and constraints based on the Airbnb system.
- `README.md`: Explains the schema and key design decisions.

## Tables

- `User`: Stores user information with roles (guest, host, admin).
- `Property`: Listings hosted by users.
- `Booking`: Tracks which user books which property.
- `Payment`: Stores payment details for bookings.
- `Review`: Contains ratings and comments by users on properties.
- `Message`: Handles communication between users.

## Constraints & Indexing

- All primary keys are UUIDs.
- Foreign key constraints ensure referential integrity.
- Indexes created on commonly queried fields (e.g., `email`, `property_id`, `booking_id`) for performance.
- ENUM and CHECK constraints enforce valid field values.

## Usage
To set up the database schema:

1. Make sure you have PostgreSQL or MySQL installed and a database created (e.g., `airbnb_db`).
2. Connect to your database using a terminal or GUI tool like pgAdmin or MySQL Workbench.
3. Run the schema script:

   ### PostgreSQL
   ```bash
   psql -U your_username -d airbnb_db -f schema.sql
   ```

   ### MySQL

```bash
mysql -u your_username -p airbnb_db < schema.sql 
```   
**Nb**:Replace your_username with your DB username and airbnb_db with your actual database name.
