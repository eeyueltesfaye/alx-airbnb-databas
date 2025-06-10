-- Query 1: Retrieve all bookings and the respective users who made those bookings  by using an INNER JOIN.

SELECT 
    b.booking_id, b.start_date, b.end_date, b.total_price,
    u.user_id, u.first_name, u.last_name
FROM Booking AS b
INNER JOIN User AS u ON b.user_id = u.user_id
ORDER BY b.start_date ASC;   -- Order by start date


-- Query 2: Retrieve all properties and their reviews, including properties that have no reviews by using LEFT JOIN.

SELECT 
    p.property_id, p.name, p.description,
    r.review_id, r.rating, r.comment
FROM Property AS p
LEFT JOIN Review AS r ON p.property_id = r.property_id
ORDER BY p.name ASC;    -- Order by property name


-- Query 3: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user by using FULL OUTER JOIN.

SELECT 
    u.user_id, u.first_name, u.last_name,
    b.booking_id, b.start_date, b.end_date, b.total_price
FROM User AS u
FULL OUTER JOIN  Booking AS b 
ON u.user_id = b.user_id
ORDER BY 
    User.last_name ASC, Booking.start_date ASC;  -- Order by user last name and booking start date   

    