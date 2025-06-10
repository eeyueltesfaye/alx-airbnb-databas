-- Non-correlated subquery: Find all properties where the average rating is greater than 4.0

SELECT property_id, name, description, location
FROM Property
WHERE property_id IN (
    SELECT property_id 
    FROM Review
    GROUP BY property_id
    HAVING AVG(rating) > 3.0
);

-- Correlated subquery: Find users who have made more than 3 bookings


SELECT user_id, first_name, last_name
FROM User AS u
WHERE (SELECT COUNT(*) FROM Booking AS b WHERE b.user_id = u.user_id) > 3;