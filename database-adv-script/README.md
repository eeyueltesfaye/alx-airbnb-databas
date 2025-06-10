# SQL Query Documentation

## Overview
This repository contains SQL queries that cover key relational database concepts, including **joins**, **subqueries**, and **aggregations with window functions**.

## Files Included
- [joins_queries.sql](./joins_queries.sql)  
- [subqueries.sql](./subqueries.sql)  
- [aggregations_and_window_functions.sql](./aggregations_and_window_functions.sql)  
## joins_queries.sql
- Contains SQL statements demonstrating INNER JOIN, LEFT JOIN, RIGHT JOIN, and simulated FULL OUTER JOIN using UNION.
- Joins are structured to retrieve users with bookings, properties with reviews, and other linked records efficiently.
- Optimized indexing is recommended for foreign keys to improve performance.

## subqueries.sql
- Implements correlated and non-correlated subqueries for filtering and data retrieval.
- Examples include finding users with more than three bookings and identifying properties with an average rating above 4.0.
- Subqueries allow dynamic filtering without excessive joins, improving query readability and execution time.

## aggregations_and_window_functions.sql
- Uses COUNT, SUM, AVG, and window functions such as ROW_NUMBER and RANK.
- Queries rank properties by the number of bookings and calculate total bookings per user.
- Window functions provide ordered calculations without grouping the entire dataset.

## Usage Instructions
- Execute queries in a MySQL or PostgreSQL-compatible environment.
- Ensure indexes are applied on frequently used columns (JOIN conditions and WHERE filters).
- Use EXPLAIN ANALYZE to monitor performance and refine indexing strategies.

## Notes
- Queries are designed for Airbnb-Clone database optimization.
- Adapt queries based on schema requirements and indexing strategies.

