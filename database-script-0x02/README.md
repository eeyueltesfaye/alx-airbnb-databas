# Airbnb Database Sample Data

This directory contains the SQL script used to populate the Airbnb clone database with sample data for testing and development purposes.

## Files

- `seed.sql`: SQL script with `INSERT` statements to populate the tables with sample data.
- `README.md`: Documentation about the sample data and how to apply it to your database.

## Usage

To insert the sample data into your already created and initialized schema:

### PostgreSQL
```bash
psql -U your_username -d airbnb_db -f seed.sql
```
### MySQL
```bash
mysql -u your_username -p airbnb_db < seed.sql
```
**Nb**:Make sure your schema is already created before running this seed script.

## Data Overview
- The sample data includes:

- Multiple users (guests and hosts)

- Several properties hosted by different users

- Sample bookings with various statuses

- Corresponding payments

- Reviews for different properties

- Messages exchanged between users

✅This data simulates real-world Airbnb usage and allows for proper testing of queries, joins, and constraints.