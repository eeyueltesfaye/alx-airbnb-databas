#  Airbnb Clone - Entity Relationship Diagram (ERD)


## 🎯 Purpose

This document outlines the **Entity-Relationship Diagram (ERD)** for the Airbnb Clone project. The ERD visually represents the structure of the database, the entities involved, their attributes, and how they relate to each other.


## 🧩 Entities and Key Attributes

### 🧑‍💼 **User**
- `user_id` (PK, UUID)
- `first_name`, `last_name` (VARCHAR, NOT NULL)
- `email` (VARCHAR, UNIQUE, NOT NULL)
- `password_hash` (VARCHAR, NOT NULL)
- `phone_number` (VARCHAR, NULL)
- `role` (ENUM: guest, host, admin, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT)

### 🏡 **Property**
- `property_id` (PK, UUID)
- `host_id` (FK → User)
- `name`, `description`, `location` (NOT NULL)
- `price_per_night` (DECIMAL, NOT NULL)
- `created_at`, `updated_at` (TIMESTAMP)

### 📆 **Booking**
- `booking_id` (PK, UUID)
- `property_id` (FK → Property)
- `user_id` (FK → User)
- `start_date`, `end_date` (DATE, NOT NULL)
- `total_price` (DECIMAL)
- `status` (ENUM: pending, confirmed, canceled)
- `created_at` (TIMESTAMP)

### 💳 **Payment**
- `payment_id` (PK, UUID)
- `booking_id` (FK → Booking)
- `amount` (DECIMAL, NOT NULL)
- `payment_date` (TIMESTAMP)
- `payment_method` (ENUM: credit_card, paypal, stripe)

### ⭐ **Review**
- `review_id` (PK, UUID)
- `property_id` (FK → Property)
- `user_id` (FK → User)
- `rating` (INTEGER, CHECK: 1–5)
- `comment` (TEXT, NOT NULL)
- `created_at` (TIMESTAMP)

### 💬 **Message**
- `message_id` (PK, UUID)
- `sender_id` (FK → User)
- `recipient_id` (FK → User)
- `message_body` (TEXT, NOT NULL)
- `sent_at` (TIMESTAMP)


## 🔗 Entity Relationships

- **User–Property**: 1-to-Many (Host can list many Properties)
- **User–Booking**: 1-to-Many (Guest can make many Bookings)
- **Property–Booking**: 1-to-Many (Each Property can be booked many times)
- **Booking–Payment**: 1-to-1 (Each Booking has one Payment)
- **Property–Review**: 1-to-Many (Each Property has multiple Reviews)
- **User–Review**: 1-to-Many (Each User can write multiple Reviews)
- **User–Message**: Self-referencing 1-to-Many (User sends/receives many Messages)


##  ER Diagram 


![Alt Text](Airbnb%20ER_Diagram.png)


### 📌 Design Notes
- Primary Keys (PK) and Foreign Keys (FK) are clearly labeled.

- ENUM values (e.g., role, status, payment_method) are noted near their attributes.

- Indexes and constraints like UNIQUE and NOT NULL are applied as per entity requirements.

- Relationships are drawn using Crow’s Foot Notation for clarity.
---
#### ✅ Summary
This ERD serves as the blueprint for implementing the relational schema of the Airbnb Clone application. It defines the structure, relationships, and constraints necessary to support key features such as property listing, booking, payment, user roles, reviews, and messaging.