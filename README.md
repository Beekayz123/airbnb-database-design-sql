# Airbnb Database Design with SQL (MySQL)

## Overview
The **Airbnb Database System** is designed to efficiently manage property listings, user profiles, bookings, and financial transactions for an Airbnb-like platform.  
Built using **MySQL**, the system follows best database practices to ensure **data integrity**, **security**, and **performance**. It provides a structured way to store, retrieve, and update critical platform data, enabling smooth operations for both hosts and guests.

This database plays a crucial role in supporting core platform functions:
- **User Management**: Stores user profiles with details such as names, contact information, and email addresses. Supports both hosts and guests.
- **Property Listings**: Hosts can create, update, and manage property listings with details such as prices, property types, amenities, and availability.
- **Search Functionality**: Guests can filter properties by location, price, availability dates, and other attributes.
- **Bookings**: Enables guests to reserve properties and allows hosts to confirm or cancel requests.
- **Payments**: Securely processes transactions between guests and hosts.
- **Reviews and Ratings**: Guests can leave reviews after verified stays; hosts can view and respond.

---

## Database Details
- **Tables**: 20 (including `Users`, `Properties`, `Bookings`, `Payments`, `Reviews`, `Hosts`, `Guests`, `Property_Availability`, etc.)  
- **Records**: At least 20 records per table, totaling **400+ entries**  
- **Database Size**: 0.63 MB  
- **Design**: Optimized for performance while ensuring data integrity and minimizing redundancy

---

## Project Files
- **[Airbnb_Database_Project.sql](Airbnb_Database_Project.sql)** — MySQL script for creating tables, relationships, constraints, and inserting sample data.  
- **[Project Presentation Slides.pdf](Project%20Presentation%20Slides.pdf)** — Includes screenshots of SQL queries and results, plus an overview of the system.  
- **[Installation Manual.pdf](Installation%20Manual.pdf)** — Step-by-step guide for setting up and running the project.

---

## Quick Start
1. Install **MySQL** and a SQL client (e.g., MySQL Workbench).
2. Open your MySQL client and connect to your local or remote server.
3. Run the `Airbnb_Database_Project.sql` script to create and populate the database.
4. Refer to the **[Installation Manual](Installation%20Manual.pdf)** for detailed setup instructions.

---

## License
This project is provided for educational purposes.

## Author
**Tawakalt Akolade**  
LinkedIn: https://www.linkedin.com/in/akolade-tawakalt
