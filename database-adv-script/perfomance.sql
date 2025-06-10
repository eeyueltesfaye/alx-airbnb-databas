-- Initial query to retrieve all bookings with user, property, and payment details

SELECT 
    b.booking_id, b.start_date, b.end_date, b.total_price, b.status,
    u.user_id, u.first_name, u.last_name, u.email,
    p.property_id, p.name, p.location,
    pay.payment_id, pay.amount, pay.payment_date 
FROM Booking AS b
JOIN User AS u ON b.user_id = u.user_id
JOIN Property AS p ON b.property_id = p.property_id
JOIN Payment AS pay ON b.booking_id = pay.booking_id;

-- Analyze Query Performance Using EXPLAIN

EXPLAIN ANALYZE 
SELECT 
    b.booking_id, b.start_date, b.end_date, b.total_price, b.status,
    u.user_id, u.first_name, u.last_name, u.email,
    p.property_id, p.name, p.location,
    pay.payment_id, pay.amount, pay.payment_date
FROM Booking AS b
JOIN User AS u ON b.user_id = u.user_id
JOIN Property AS p ON b.property_id = p.property_id
JOIN Payment AS pay ON b.booking_id = pay.booking_id;

-- Refactored Query (Optimized for Speed)

SELECT 
    b.booking_id, b.start_date, b.end_date, b.total_price, b.status,
    u.user_id, u.first_name, u.last_name, u.email,
    p.property_id, p.name, p.location,
    pay.payment_id, pay.amount, pay.payment_date
FROM Booking AS b
LEFT JOIN User AS u ON b.user_id = u.user_id
LEFT JOIN Property AS p ON b.property_id = p.property_id
LEFT JOIN Payment AS pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-01-01'
ORDER BY b.start_date ASC;
