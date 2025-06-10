-- Query 1: Find the total number of bookings made by each user

SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    COUNT(Booking.booking_id) AS total_bookings
FROM 
    User
LEFT JOIN 
    Booking ON User.user_id = Booking.user_id
GROUP BY 
    User.user_id, User.first_name, User.last_name
ORDER BY 
    total_bookings DESC;  -- Optional: Order by total bookings

-- Query 2: Rank properties based on the total number of bookings they have received using RANK()

SELECT 
    p.property_id, p.name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank_position
FROM Property AS p
LEFT JOIN Booking AS b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY rank_position;

-- Query 3: Rank properties using ROW_NUMBER() based on the total number of bookings


SELECT 
    p.property_id, p.name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_row_number 
FROM Property AS p
LEFT JOIN Booking AS b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY  booking_row_number;

