-- Users
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('7c9e6679-7425-40de-944b-e07fc1f90ae7', 'Abel', 'Tesfaye', 'abel.t@example.com', 'hash1', '0911234567', 'guest'),
('8fae56ac-b2f3-4f91-a889-34dbb6de1bd3', 'Liyu', 'Wondimu', 'liyuw@example.com', 'hash2', '0922345678', 'host'),
('4a8b6349-1254-43dd-a4cd-f05821904f12', 'Eden', 'Haile', 'eden.haile@example.com', 'hash3', NULL, 'admin');

-- Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
('5f379a3c-fda5-402d-87ab-e53726734b51', '8fae56ac-b2f3-4f91-a889-34dbb6de1bd3', 'Addis Garden House', 'Peaceful house with garden in Bole.', 'Addis Ababa', 150.00),
('2e72d3f1-709b-4a98-8b0c-bef3ed87e35c', '8fae56ac-b2f3-4f91-a889-34dbb6de1bd3', 'Lakeview Cottage', 'Traditional style home near Lake Tana.', 'Bahir Dar', 95.00);

-- Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('a4e3907d-7e0c-4f08-bc79-d5f8c27d340f', '5f379a3c-fda5-402d-87ab-e53726734b51', '7c9e6679-7425-40de-944b-e07fc1f90ae7', '2025-08-01', '2025-08-05', 600.00, 'confirmed'),
('68f2713a-3d32-4d0f-a3d4-f0bb1f5b9f52', '2e72d3f1-709b-4a98-8b0c-bef3ed87e35c', '7c9e6679-7425-40de-944b-e07fc1f90ae7', '2025-09-15', '2025-09-17', 190.00, 'pending');

-- Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('baf98dcb-0e61-4e01-8e1f-3692d396e972', 'a4e3907d-7e0c-4f08-bc79-d5f8c27d340f', 600.00, 'credit_card'),
('2f9bb9f8-91b9-4bd9-92d1-89d9e3beadd0', '68f2713a-3d32-4d0f-a3d4-f0bb1f5b9f52', 190.00, 'paypal');

-- Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('ef49b274-95c4-4560-a0bc-5d77f9f3c1d4', '5f379a3c-fda5-402d-87ab-e53726734b51', '7c9e6679-7425-40de-944b-e07fc1f90ae7', 5, 'Very clean and quiet. Loved the garden!'),
('10d9c824-774f-4907-86b0-6407e78ae0bb', '2e72d3f1-709b-4a98-8b0c-bef3ed87e35c', '7c9e6679-7425-40de-944b-e07fc1f90ae7', 4, 'Great view of the lake, but no WiFi.');

-- Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('f18ab5cb-2798-4fc3-98b3-305f68deefbb', '7c9e6679-7425-40de-944b-e07fc1f90ae7', '8fae56ac-b2f3-4f91-a889-34dbb6de1bd3', 'Hello Liyu, is the garden house available next month?'),
('d2503dd3-85f1-40b8-94a5-b771a90fa478', '8fae56ac-b2f3-4f91-a889-34dbb6de1bd3', '7c9e6679-7425-40de-944b-e07fc1f90ae7', 'Yes, it is available. Looking forward to hosting you!');
