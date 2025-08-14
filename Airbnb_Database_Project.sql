use airbnb_db;
--- CREATING TABLE 1 USER

CREATE TABLE user (
	user_id INT  PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(100) NOT NULL,
    role ENUM('HOST', 'Guest') NOT NULL); 
   
    SELECT * from user;
    INSERT INTO User (user_id, name, email, phone, role) VALUES
(3, 'Michael Johnson', 'michael@email.com', '1122334455', 'Host'),
(4, 'Emily Brown', 'emily@email.com', '6677889900', 'Guest'),
(5, 'Daniel Wilson', 'daniel@email.com', '5566778899', 'Host'),
(6, 'Sophia Taylor', 'sophia@email.com', '4433221100', 'Guest'),
(7, 'David Anderson', 'david@email.com', '7788990011', 'Host'),
(8, 'Olivia Martinez', 'olivia@email.com', '9988776655', 'Guest'),
(9, 'James Thomas', 'james@email.com', '3344556677', 'Host'),
(10, 'Isabella Hernandez', 'isabella@email.com', '1122446688', 'Guest'),
(11, 'Ethan White', 'ethan@email.com', '2233445566', 'Host'),
(12, 'Mia Robinson', 'mia@email.com', '4455667788', 'Guest'),
(13, 'Benjamin Clark', 'benjamin@email.com', '7788445566', 'Host'),
(14, 'Charlotte Rodriguez', 'charlotte@email.com', '5566889900', 'Guest'),
(15, 'Alexander Lewis', 'alexander@email.com', '6677998800', 'Host'),
(16, 'Amelia Walker', 'amelia@email.com', '7788665544', 'Guest'),
(17, 'Matthew Hall', 'matthew@email.com', '3344558899', 'Host'),
(18, 'Harper Allen', 'harper@email.com', '2233669900', 'Guest'),
(19, 'Christopher Young', 'chris@email.com', '9988774433', 'Host'),
(20, 'Evelyn King', 'evelyn@email.com', '6655778899', 'Guest');
INSERT INTO User (user_id, name, email, phone, role) VALUES
(21, 'Liam Carter', 'liam.carter@email.com', '2223334441', 'Guest'),
(22, 'Emma Johnson', 'emma.johnson@email.com', '3334445552', 'Guest'),
(33, 'Noah Williams', 'noah.williams@email.com', '4445556663', 'Guest'),
(24, 'Ava Brown', 'ava.brown@email.com', '5556667774', 'Guest'),
(25, 'Oliver Davis', 'oliver.davis@email.com', '6667778885', 'Guest'),
(26, 'Sophia Wilson', 'sophia.wilson@email.com', '7778889996', 'Guest'),
(27, 'Mason Thomas', 'mason.thomas@email.com', '8889990007', 'Guest'),
(28, 'Isabella Martinez', 'isabella.martinez@email.com', '9990001118', 'Guest'),
(29, 'Lucas White', 'lucas.white@email.com', '0001112229', 'Guest'),
(30, 'Mia Anderson', 'mia.anderson@email.com', '1112223330', 'Guest');
INSERT INTO User (user_id, name, email, phone, role) VALUES
(31, 'Ethan Brown', 'ethan.brown@email.com', '2112233445', 'Host'),
(32, 'Chloe Wilson', 'chloe.wilson@email.com', '3223344556', 'Host'),
(33, 'Henry Thomas', 'henry.thomas@email.com', '4334455667', 'Host'),
(34, 'Ella Martinez', 'ella.martinez@email.com', '5445566778', 'Host'),
(35, 'Jack Anderson', 'jack.anderson@email.com', '6556677889', 'Host'),
(36, 'Grace Lewis', 'grace.lewis@email.com', '7667788990', 'Host'),
(37, 'Leo Walker', 'leo.walker@email.com', '8778899001', 'Host'),
(38, 'Aria Young', 'aria.young@email.com', '9889900112', 'Host'),
(39, 'Daniel Hall', 'daniel.hall@email.com', '0991011123', 'Host'),
(40, 'Lily Scott', 'lily.scott@email.com', '1112123145', 'Host');


--- CREATING TABLE 2 HOST 

    CREATE TABLE host (
		host_id INT PRIMARY KEY,
		user_id INT UNIQUE,
		total_listings INT DEFAULT 0,
		FOREIGN KEY (user_id) REFERENCES user(user_id)
    );
--- POPULATING THE HOST TABLE
INSERT INTO Host (host_id, user_id, total_listings) VALUES
(1, 1, 5),
(2, 3, 3),
(3, 5, 4),
(4, 7, 2),
(5, 9, 6),
(6, 11, 3),
(7, 13, 2),
(8, 15, 5),
(9, 17, 4),
(10, 19, 1),
(11, 31, 3),
(12, 32, 2),
(13, 33, 4),
(14, 34, 1),
(15, 35, 6),
(16, 36, 5),
(17, 37, 3),
(18, 38, 2),
(19, 39, 4),
(20, 40, 1);

SELECT * FROM Guest ORDER BY guest_id; -- Test Query

--- CREATING TABLE 3 GUEST    
    CREATE TABLE guest (
		guest_id INT PRIMARY KEY,
        user_id INT UNIQUE,
        total_bookings INT DEFAULT 0,
        FOREIGN KEY (user_id) REFERENCES User(user_id) 
        );

-- POPULATING THE GUESTS TABBLE
INSERT INTO Guest (guest_id, user_id, total_bookings) VALUES
(1, 2, 3),
(2, 4, 5),
(3, 6, 2),
(4, 8, 4),
(5, 10, 1),
(6, 12, 6),
(7, 14, 3),
(8, 16, 2),
(9, 18, 5),
(10, 20, 4),
(11, 21, 2),
(12, 22, 5),
(13, 23, 3),
(14, 24, 4),
(15, 25, 1),
(16, 26, 6),
(17, 27, 2),
(18, 28, 3),
(19, 29, 5),
(20, 30, 4);

SELECT * FROM Guest ORDER BY guest_id; --- Test Query


--- CREATING TABLE 4 PROPERTY        
        CREATE TABLE property (
			property_id INT PRIMARY KEY,
            host_id INT,
            title VARCHAR(200),
            description TEXT,
            location VARCHAR(255),
            price_per_night DECIMAL(10,2),
            FOREIGN KEY (host_id) REFERENCES HOST(host_id)
            );

INSERT INTO property (property_id, host_id, title, description, location, price_per_night) VALUES
(1, 1, 'Beachfront Villa', 'A luxurious villa by the beach with ocean views.', 'Miami, FL', 250.00),
(2, 2, 'Modern Apartment', 'A stylish apartment in the city center.', 'New York, NY', 180.00),
(3, 3, 'Cozy Cabin', 'A warm, wood-finished cabin in the mountains.', 'Denver, CO', 150.00),
(4, 4, 'Luxury Penthouse', 'A top-floor penthouse with skyline views.', 'Los Angeles, CA', 400.00),
(5, 5, 'Rustic Farmhouse', 'A peaceful countryside retreat.', 'Austin, TX', 130.00),
(6, 6, 'Lake House', 'A relaxing home by the lake, great for fishing.', 'Orlando, FL', 200.00),
(7, 7, 'Downtown Loft', 'A stylish loft with modern amenities.', 'Chicago, IL', 175.00),
(8, 8, 'Studio Apartment', 'A compact and affordable stay.', 'San Francisco, CA', 120.00),
(9, 9, 'Mountain Lodge', 'A scenic lodge with hiking trails nearby.', 'Salt Lake City, UT', 220.00),
(10, 10, 'Private Bungalow', 'A tropical bungalow with a private pool.', 'Honolulu, HI', 300.00),
(11, 1, 'Seaside Cottage', 'A quiet cottage with a beautiful ocean breeze.', 'San Diego, CA', 190.00),
(12, 2, 'Historic Townhouse', 'A renovated townhouse with historic charm.', 'Boston, MA', 210.00),
(13, 3, 'Desert Retreat', 'A peaceful stay in the heart of the desert.', 'Phoenix, AZ', 140.00),
(14, 4, 'Treehouse Stay', 'A unique treehouse experience in nature.', 'Portland, OR', 160.00),
(15, 5, 'Ski Chalet', 'A cozy lodge near the ski slopes.', 'Aspen, CO', 280.00),
(16, 6, 'Countryside Barn', 'A converted barn with modern amenities.', 'Nashville, TN', 135.00),
(17, 7, 'Beach Bungalow', 'A small bungalow steps away from the sand.', 'Myrtle Beach, SC', 170.00),
(18, 8, 'Tiny Home', 'A minimalistic tiny home with all essentials.', 'Seattle, WA', 110.00),
(19, 9, 'Riverfront Cabin', 'A relaxing escape near the river.', 'New Orleans, LA', 185.00),
(20, 10, 'Urban Condo', 'A high-rise condo with city views.', 'Washington, DC', 195.00);

 SELECT * FROM Property WHERE host_id =3; -- Test Query

---- CREATING TABLE 5 PROPERTY PHOTOS            
		CREATE TABLE property_photos (
		photo_id INT NOT NULL,  
		property_id INT PRIMARY KEY AUTO_INCREMENT,
        photo_url VARCHAR(255) NOT NULL,
        FOREIGN KEY (property_id) REFERENCES PROPERTY(property_id) ON DELETE CASCADE);        
         
        INSERT INTO Property_Photos (photo_id, property_id, photo_url) VALUES
(1, 1, 'https://example.com/photos/property1_1.jpg'),
(2, 2, 'https://example.com/photos/property1_2.jpg'),
(3, 3, 'https://example.com/photos/property2_1.jpg'),
(4, 4, 'https://example.com/photos/property2_2.jpg'),
(5, 5, 'https://example.com/photos/property3_1.jpg'),
(6, 6, 'https://example.com/photos/property3_2.jpg'),
(7, 7, 'https://example.com/photos/property4_1.jpg'),
(8, 8, 'https://example.com/photos/property4_2.jpg'),
(9, 9, 'https://example.com/photos/property5_1.jpg'),
(10, 10, 'https://example.com/photos/property5_2.jpg'),
(11, 11, 'https://example.com/photos/property6_1.jpg'),
(12, 12, 'https://example.com/photos/property6_2.jpg'),
(13, 13, 'https://example.com/photos/property7_1.jpg'),
(14, 14, 'https://example.com/photos/property7_2.jpg'),
(15, 15, 'https://example.com/photos/property8_1.jpg'),
(16, 16, 'https://example.com/photos/property8_2.jpg'),
(17, 17, 'https://example.com/photos/property9_1.jpg'),
(18, 18, 'https://example.com/photos/property9_2.jpg'),
(19, 19, 'https://example.com/photos/property10_1.jpg'),
(20, 20, 'https://example.com/photos/property10_2.jpg');

        select * from property_photos;
        SELECT * FROM Property_Photos ORDER BY photo_id; --- Test Query

 --- CREATING TABLE 6 PROPERTY  AVAILABILTY 
  
  CREATE TABLE property_availabilty (
  availability_id INT PRIMARY KEY AUTO_INCREMENT,
  property_id INT NOT NULL,
  available_date DATE NOT NULL,
  FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE);
 rename table property_availabilty to property_availability;
	
INSERT INTO Property_Availability (property_id, available_date) VALUES
(1, '2024-07-01'),
(1, '2024-07-10'),
(2, '2024-07-02'),
(2, '2024-07-12'),
(3, '2024-07-03'),
(3, '2024-07-14'),
(4, '2024-07-04'),
(4, '2024-07-16'),
(5, '2024-07-05'),
(5, '2024-07-18'),
(6, '2024-07-06'),
(6, '2024-07-20'),
(7, '2024-07-07'),
(7, '2024-07-22'),
(8, '2024-07-08'),
(8, '2024-07-24'),
(9, '2024-07-09'),
(9, '2024-07-26'),
(10, '2024-07-10'),
(10, '2024-07-28'),
(11, '2024-07-11'),
(11, '2024-07-30'),
(12, '2024-07-12'),
(12, '2024-08-01'),
(13, '2024-07-13'),
(13, '2024-08-03'),
(14, '2024-07-14'),
(14, '2024-08-05'),
(15, '2024-07-15'),
(15, '2024-08-07'),
(16, '2024-07-16'),
(16, '2024-08-09'),
(17, '2024-07-17'),
(17, '2024-08-11'),
(18, '2024-07-18'),
(18, '2024-08-13'),
(19, '2024-07-19'),
(19, '2024-08-15'),
(20, '2024-07-20'),
(20, '2024-08-17');

SELECT * FROM Property_Availability ORDER BY property_id; --- Test Query


--- CREATING TABLE 7 BOOKINGS

CREATE TABLE BOOKING (
booking_id INT PRIMARY KEY AUTO_INCREMENT,
guest_id INT NOT NULL,
property_id INT NOT NULL,
check_in DATE NOT NULL,
check_out DATE NOT NULL, 
total_cost DECIMAL(10,2) NOT NULL,
FOREIGN KEY (guest_id) REFERENCES Guest(guest_id) ON DELETE CASCADE,
FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE);

INSERT INTO Booking (guest_id, property_id, check_in, check_out, total_cost) VALUES
(1, 5, '2024-07-01', '2024-07-05', 520.00),
(2, 10, '2024-07-03', '2024-07-07', 640.00),
(3, 15, '2024-07-05', '2024-07-10', 750.00),
(4, 20, '2024-07-07', '2024-07-12', 820.00),
(5, 3, '2024-07-09', '2024-07-14', 600.00),
(6, 8, '2024-07-11', '2024-07-16', 480.00),
(7, 13, '2024-07-13', '2024-07-18', 720.00),
(8, 18, '2024-07-15', '2024-07-20', 890.00),
(9, 2, '2024-07-17', '2024-07-21', 550.00),
(10, 7, '2024-07-19', '2024-07-23', 600.00),
(11, 12, '2024-07-21', '2024-07-26', 780.00),
(12, 17, '2024-07-23', '2024-07-28', 940.00),
(13, 1, '2024-07-25', '2024-07-30', 500.00),
(14, 6, '2024-07-27', '2024-08-01', 660.00),
(15, 11, '2024-07-29', '2024-08-03', 700.00),
(16, 16, '2024-08-01', '2024-08-06', 880.00),
(17, 4, '2024-08-03', '2024-08-08', 720.00),
(18, 9, '2024-08-05', '2024-08-10', 850.00),
(19, 14, '2024-08-07', '2024-08-12', 910.00),
(20, 19, '2024-08-09', '2024-08-14', 990.00);

SELECT COUNT(*) AS total_bookings FROM Booking; --- Test Query
SELECT * FROM Booking WHERE guest_id = 1; 



--- CREATING TABLE 8 PAYMENT
CREATE TABLE Payment (
payment_ID INT PRIMARY KEY AUTO_INCREMENT,
booking_id INT NOT NULL,
payment_date DATE NOT NULL,
amount DECIMAL(10,2) NOT NULL,
method ENUM( 'Credit Card', 'Paypal', 'Cash', 'Bank Transfer') NOT NULL, 
status ENUM('failed', 'pending', 'successful') NOT NULL,
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE);

INSERT INTO Payment (booking_id, payment_date, amount, method, status) VALUES
(1, '2024-07-02', 520.00, 'Credit Card', 'Successful'),
(2, '2024-07-04', 640.00, 'PayPal', 'Successful'),
(3, '2024-07-06', 750.00, 'Bank Transfer', 'Successful'),
(4, '2024-07-08', 820.00, 'Credit Card', 'Pending'),
(5, '2024-07-10', 600.00, 'PayPal', 'Failed'),
(6, '2024-07-12', 480.00, 'Credit Card', 'Successful'),
(7, '2024-07-14', 720.00, 'Bank Transfer', 'Successful'),
(8, '2024-07-16', 890.00, 'Credit Card', 'Successful'),
(9, '2024-07-18', 550.00, 'PayPal', 'Pending'),
(10, '2024-07-20', 600.00, 'Bank Transfer', 'Successful'),
(11, '2024-07-22', 780.00, 'Credit Card', 'Successful'),
(12, '2024-07-24', 940.00, 'PayPal', 'Failed'),
(13, '2024-07-26', 500.00, 'Credit Card', 'Successful'),
(14, '2024-07-28', 660.00, 'Bank Transfer', 'Successful'),
(15, '2024-07-30', 700.00, 'Credit Card', 'Pending'),
(16, '2024-08-02', 880.00, 'PayPal', 'Successful'),
(17, '2024-08-04', 720.00, 'Credit Card', 'Successful'),
(18, '2024-08-06', 850.00, 'Bank Transfer', 'Failed'),
(19, '2024-08-08', 910.00, 'PayPal', 'Successful'),
(20, '2024-08-10', 990.00, 'Credit Card', 'Successful');

SELECT * FROM Payment WHERE method = 'Credit Card' AND status = 'Successful'; --- Test Query

--- CREATING TABLE 9 REVIEW
CREATE TABLE Review (
review_id INT PRIMARY KEY AUTO_INCREMENT,
booking_id INT NOT NULL,
reviewer_id INT NOT NULL,
review_text TEXT NOT NULL,
rating ENUM('1', '2', '3', '4', '5'),
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE,
FOREIGN KEY (reviewer_id) REFERENCES User(user_id) ON DELETE CASCADE);

INSERT INTO Review (booking_id, reviewer_id, review_text, rating) VALUES
(1, 2, 'Amazing place! Very clean and cozy.', 5),
(2, 4, 'Great stay, but the Wi-Fi was slow.', 4),
(3, 6, 'Good value for money. Will visit again.', 5),
(4, 8, 'The property was not as described.', 2),
(5, 10, 'Host was very friendly and helpful.', 5),
(6, 12, 'Decent place, but noisy neighborhood.', 3),
(7, 14, 'Very comfortable and close to the city center.', 5),
(8, 16, 'Had issues with the AC, but resolved quickly.', 4),
(9, 18, 'Perfect stay! Highly recommended.', 5),
(10, 20, 'Average experience, but clean rooms.', 3),
(11, 21, 'Loved the view! Worth every penny.', 5),
(12, 22, 'Okay stay, but could be better.', 3),
(13, 23, 'Would definitely book again!', 5),
(14, 24, 'Nice place, but a bit expensive.', 4),
(15, 25, 'Not very clean, but good location.', 2),
(16, 26, 'The host was amazing! 10/10.', 5),
(17, 27, 'Spacious and modern apartment.', 5),
(18, 28, 'The bathroom was not well maintained.', 2),
(19, 29, 'Great experience overall.', 4),
(20, 30, 'Would not recommend. Bad service.', 1);

SELECT * FROM Review WHERE reviewer_id IN  (2, 4, 6); --- Test Query

--- CREATING TABLE 10 PLATFORM FEE
CREATE TABLE platform_fee (
fee_id INT PRIMARY KEY AUTO_INCREMENT,
booking_id INT NOT NULL,
host_fee DECIMAL(10,2) NOT NULL,
guest_fee DECIMAL(10,2) NOT NULL,
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE);
 
 INSERT INTO Platform_Fee (booking_id, host_fee, guest_fee) VALUES
(1, 52.00, 26.00),
(2, 64.00, 32.00),
(3, 75.00, 37.50),
(4, 82.00, 41.00),
(5, 60.00, 30.00),
(6, 48.00, 24.00),
(7, 72.00, 36.00),
(8, 89.00, 44.50),
(9, 55.00, 27.50),
(10, 60.00, 30.00),
(11, 78.00, 39.00),
(12, 94.00, 47.00),
(13, 50.00, 25.00),
(14, 66.00, 33.00),
(15, 70.00, 35.00),
(16, 88.00, 44.00),
(17, 72.00, 36.00),
(18, 85.00, 42.50),
(19, 91.00, 45.50),
(20, 99.00, 49.50);

DESC Platform_Fee; 
SELECT SUM(host_fee) AS total_host_fees, SUM(guest_fee) AS total_guest_fees 
FROM Platform_Fee; ---- Test Query

--- CREATING SUPPORT TICKET TABLE --- table 11
CREATE TABLE support_ticket (
ticket_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT NOT NULL,
issue_date DATE NOT NULL,
issue_description TEXT NOT NULL,
status ENUM('Open', 'In Progress', 'Resolved', 'Closed') NOT NULL,
FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE);

INSERT INTO Support_Ticket (user_id, issue_date, issue_description, status) VALUES
(2, '2024-07-01', 'Payment was deducted twice.', 'Resolved'),
(4, '2024-07-02', 'Host did not respond to my messages.', 'In Progress'),
(6, '2024-07-03', 'Property was not as described.', 'Open'),
(8, '2024-07-04', 'I want to cancel my booking but cannot find the option.', 'Closed'),
(10, '2024-07-05', 'Wi-Fi was not working at the property.', 'Resolved'),
(12, '2024-07-06', 'The host was rude and uncooperative.', 'Open'),
(14, '2024-07-07', 'I was overcharged on my booking.', 'In Progress'),
(16, '2024-07-08', 'My refund request has not been processed.', 'Resolved'),
(18, '2024-07-09', 'There was a security issue at the property.', 'Closed'),
(20, '2024-07-10', 'Booking confirmation email was not received.', 'Open'),
(21, '2024-07-11', 'My account was locked for no reason.', 'Resolved'),
(22, '2024-07-12', 'The check-in process was very complicated.', 'In Progress'),
(23, '2024-07-13', 'Support team is not responding to my emails.', 'Open'),
(24, '2024-07-14', 'Host canceled my booking without explanation.', 'Closed'),
(25, '2024-07-15', 'I want to change my payment method.', 'Resolved'),
(26, '2024-07-16', 'I need an invoice for my booking.', 'Open'),
(27, '2024-07-17', 'The location on the map was incorrect.', 'In Progress'),
(28, '2024-07-18', 'I was not given the access code for self-check-in.', 'Closed'),
(29, '2024-07-19', 'My booking was not reflected in my account.', 'Resolved'),
(30, '2024-07-20', 'The air conditioning was broken.', 'Open');

SELECT status, COUNT(*) AS ticket_count FROM Support_Ticket GROUP BY status; --- Test Query


--- CREATING TABLE 12 HOST RATING
CREATE TABLE host_rating (
rating_id INT PRIMARY KEY AUTO_INCREMENT,
host_id INT NOT NULL,
rating_score ENUM ('1', '2', '3', '4', '5') NOT NULL,
review_count INT NOT NULL,
FOREIGN KEY (host_id) REFERENCES Host(host_id) ON DELETE CASCADE);

INSERT INTO host_rating (host_id, rating_score, review_count) VALUES
(1, '5', 12),
(2, '4', 9),
(3, '5', 15),
(4, '3', 8),
(5, '4', 11),
(6, '2', 5),
(7, '5', 20),
(8, '3', 7),
(9, '4', 10),
(10, '1', 3),
(11, '5', 14),
(12, '4', 9),
(13, '2', 6),
(14, '5', 17),
(15, '4', 12),
(16, '3', 8),
(17, '5', 19),
(18, '2', 4),
(19, '4', 11),
(20, '1', 2);

SELECT * FROM Host_Rating WHERE host_id IN (1, 3, 5);



--- creating table 13 GUEST RATING
CREATE TABLE guest_rating (
rating_id INT PRIMARY KEY AUTO_INCREMENT,
guest_id INT NOT NULL,
rating_score ENUM ('1', '2', '3', '4', '5') NOT NULL,
review_count INT NOT NULL,
FOREIGN KEY (guest_id) REFERENCES Guest(guest_id) ON DELETE CASCADE);

INSERT INTO guest_rating (guest_id, rating_score, review_count) VALUES
(1, '5', 12),
(2, '4', 9),
(3, '5', 15),
(4, '3', 8),
(5, '4', 11),
(6, '2', 5),
(7, '5', 20),
(8, '3', 7),
(9, '4', 10),
(10, '1', 3),
(11, '5', 14),
(12, '4', 9),
(13, '2', 6),
(14, '5', 17),
(15, '4', 12),
(16, '3', 8),
(17, '5', 19),
(18, '2', 4),
(19, '4', 11),
(20, '1', 2);

SELECT * FROM Guest_Rating WHERE review_count >= 10; --- test Query  


INSERT INTO guest_rating (guest_id, rating_score, review_count) VALUES
(1, '5', 12),
(2, '4', 9),
(3, '5', 15),
(4, '3', 8),
(5, '4', 11),
(6, '2', 5),
(7, '5', 20),
(8, '3', 7),
(9, '4', 10),
(10, '1', 3),
(11, '5', 14),
(12, '4', 9),
(13, '2', 6),
(14, '5', 17),
(15, '4', 12),
(16, '3', 8),
(17, '5', 19),
(18, '2', 4),
(19, '4', 11),
(20, '1', 2);

--- CREATIG TABLE 14 REGION
create table region (
region_id INT PRIMARY KEY AUTO_INCREMENT,
region_name VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL);

INSERT INTO region (region_name, country) VALUES
('California', 'USA'),
('Texas', 'USA'),
('New York', 'USA'),
('Ontario', 'Canada'),
('Quebec', 'Canada'),
('British Columbia', 'Canada'),
('Bavaria', 'Germany'),
('Berlin', 'Germany'),
('Hamburg', 'Germany'),
('Ile-de-France', 'France'),
('Provence-Alpes-Côte d\'Azur', 'France'),
('Normandy', 'France'),
('Lagos', 'Nigeria'),
('Abuja', 'Nigeria'),
('Kano', 'Nigeria'),
('Gauteng', 'South Africa'),
('Western Cape', 'South Africa'),
('KwaZulu-Natal', 'South Africa'),
('Victoria', 'Australia'),
('New South Wales', 'Australia');

SELECT * FROM Region ORDER BY region_name ASC; --- TEST QUERY

--- CREATING TABLE 15 CITY
CREATE TABLE city (
    city_id INT PRIMARY KEY AUTO_INCREMENT,
    region_id INT NOT NULL,
    city_name VARCHAR(50) NOT NULL, 
    FOREIGN KEY (region_id) REFERENCES region(region_id) ON DELETE CASCADE
);

INSERT INTO city (region_id, city_name) VALUES
(1, 'Los Angeles'),
(1, 'San Francisco'),
(2, 'Houston'),
(2, 'Dallas'),
(3, 'New York City'),
(3, 'Buffalo'),
(4, 'Toronto'),
(4, 'Ottawa'),
(5, 'Montreal'),
(5, 'Quebec City'),
(6, 'Vancouver'),
(6, 'Victoria'),
(7, 'Munich'),
(7, 'Nuremberg'),
(8, 'Berlin'),
(9, 'Hamburg'),
(10, 'Paris'),
(11, 'Marseille'),
(12, 'Rouen'),
(13, 'Lagos'),
(14, 'Abuja');

SELECT * FROM Region WHERE region_name = 'California'; --- TEST QUERY 


--- CREATING TABLE 16 DISCOUNT

 CREATE TABLE Discount (
    discount_id INT PRIMARY KEY AUTO_INCREMENT,
    property_id INT NOT NULL,
    discount_rate DECIMAL(5,2) NOT NULL,  
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE
);
INSERT INTO Discount (property_id, discount_rate, start_date, end_date) VALUES
(1, 10.00, '2024-07-01', '2024-07-15'),
(2, 15.00, '2024-07-05', '2024-07-20'),
(3, 5.00, '2024-07-10', '2024-07-25'),
(4, 20.00, '2024-07-15', '2024-07-30'),
(5, 12.50, '2024-07-20', '2024-08-05'),
(6, 8.00, '2024-07-25', '2024-08-10'),
(7, 25.00, '2024-08-01', '2024-08-15'),
(8, 30.00, '2024-08-05', '2024-08-20'),
(9, 18.00, '2024-08-10', '2024-08-25'),
(10, 10.00, '2024-08-15', '2024-08-30'),
(11, 22.00, '2024-08-20', '2024-09-05'),
(12, 15.00, '2024-08-25', '2024-09-10'),
(13, 35.00, '2024-09-01', '2024-09-15'),
(14, 40.00, '2024-09-05', '2024-09-20'),
(15, 10.00, '2024-09-10', '2024-09-25'),
(16, 5.00, '2024-09-15', '2024-09-30'),
(17, 50.00, '2024-09-20', '2024-10-05'),
(18, 12.00, '2024-09-25', '2024-10-10'),
(19, 20.00, '2024-10-01', '2024-10-15'),
(20, 25.00, '2024-10-05', '2024-10-20');

SELECT * FROM Discount ORDER BY discount_rate DESC LIMIT 5; ------ Test Query 


 --- CREATING TABLE 17 PROPERTY AMENITIES
 CREATE TABLE Property_Amenities (
    amenity_id INT PRIMARY KEY AUTO_INCREMENT,
    property_id INT NOT NULL,
    amenity_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE
);

 INSERT INTO Property_Amenities (property_id, amenity_name) VALUES
(1, 'Free WiFi'),
(2, 'Swimming Pool'),
(3, 'Air Conditioning'),
(4, 'Parking Space'),
(5, 'Gym Access'),
(6, 'Pet Friendly'),
(7, 'Balcony View'),
(8, 'Fully Equipped Kitchen'),
(9, '24/7 Security'),
(10, 'Smart TV'),
(11, 'Garden Area'),
(12, 'Hot Tub'),
(13, 'BBQ Grill'),
(14, 'Private Entrance'),
(15, 'Netflix Subscription'),
(16, 'Work Desk'),
(17, 'Washing Machine'),
(18, 'Fireplace'),
(19, 'Breakfast Included'),
(20, 'Airport Pickup Service');

SELECT * FROM Property_Amenities 
WHERE amenity_name IN ('Swimming Pool', 'Parking Space', 'Gym Access'); ---- Test Query

 --- CREATING TABLE 18 EVENT
 CREATE TABLE Event (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    city_id INT NOT NULL,
    event_name VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    popularity INT NOT NULL, 
    FOREIGN KEY (city_id) REFERENCES City(city_id) ON DELETE CASCADE
);

 INSERT INTO Event (city_id, event_name, event_date, popularity) VALUES
(1, 'Music Festival', '2024-07-10', 85), (2, 'Food & Wine Expo', '2024-07-15', 78),
(3, 'Tech Conference', '2024-07-20', 90), (4, 'Marathon Race', '2024-07-25', 82),
(5, 'Cultural Parade', '2024-07-30', 88), (6, 'Fashion Week', '2024-08-05', 91),
(7, 'Film Premiere', '2024-08-10', 95), (8, 'New Year Countdown', '2024-12-31', 99),
(9, 'Sports Championship', '2024-09-15', 87), (10, 'Carnival Festival', '2024-10-01', 92),
(11, 'Book Fair', '2024-10-10', 80), (12, 'Gaming Expo', '2024-10-20', 85),
(13, 'Comedy Show', '2024-11-05', 78), (14, 'Car Show', '2024-11-15', 89),
(15, 'Dance Competition', '2024-11-25', 76), (16, 'Art Exhibition', '2024-12-05', 83),
(17, 'Yoga Retreat', '2024-12-15', 72), (18, 'Startup Pitch Night', '2024-12-20', 88),
(19, 'Winter Wonderland', '2024-12-25', 95), (20, 'Music Awards', '2025-01-01', 98);

SELECT * FROM Event 
WHERE event_date BETWEEN '2024-07-01' AND '2024-07-31'; --- Test Query


  --- CREATING TABLE 19 IN FRIEND_CONNECTION
CREATE TABLE Friend_Connection (
    connection_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id1 INT NOT NULL,
    user_id2 INT NOT NULL,
    connection_date DATE NOT NULL,
    FOREIGN KEY (user_id1) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id2) REFERENCES User(user_id) ON DELETE CASCADE
);
INSERT INTO Friend_Connection (user_id1, user_id2, connection_date) VALUES
(1, 2, '2024-06-01'), (3, 4, '2024-06-05'),
(5, 6, '2024-06-10'), (7, 8, '2024-06-15'),
(9, 10, '2024-06-20'), (11, 12, '2024-06-25'),
(13, 14, '2024-07-01'), (15, 16, '2024-07-05'),
(17, 18, '2024-07-10'), (19, 20, '2024-07-15'),
(21, 22, '2024-07-20'), (23, 24, '2024-07-25'),
(25, 26, '2024-08-01'), (27, 28, '2024-08-05'),
(29, 30, '2024-08-10'), (31, 32, '2024-08-15'),
(33, 34, '2024-08-20'), (35, 36, '2024-08-25'),
(37, 38, '2024-09-01'), (39, 40, '2024-09-05');

SELECT COUNT(*) AS total_connections FROM Friend_Connection; ---- test QUERY

--- CREATING TABLE 20 INCOME CALCULATOR
CREATE TABLE Income_Calculator (
    calculator_id INT PRIMARY KEY AUTO_INCREMENT,
    host_id INT NOT NULL,
    total_income_estimated DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (host_id) REFERENCES Host(host_id) ON DELETE CASCADE
);

INSERT INTO Income_Calculator (host_id, total_income_estimated) VALUES
(1, 5000.00), (2, 7500.00),
(3, 3200.00), (4, 9100.00),
(5, 6700.00), (6, 12000.00),
(7, 8500.00), (8, 4300.00),
(9, 7700.00), (10, 6200.00),
(11, 8900.00), (12, 5600.00),
(13, 13400.00), (14, 9800.00),
(15, 7200.00), (16, 8100.00),
(17, 5200.00), (18, 10200.00),
(19, 15000.00), (20, 6600.00);

DESC income_calculator; ---- test query

SELECT table_name, table_rows
FROM information_schema.tables
WHERE table_schema = 'airbnb_db';

SELECT table_schema AS "Database",
       ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS "Size (MB)"
FROM information_schema.tables
WHERE table_schema = 'airbnb_db';

show tables from airbnb_db;

SELECT TABLE_NAME, INDEX_NAME, COLUMN_NAME, NON_UNIQUE, SEQ_IN_INDEX 
FROM INFORMATION_SCHEMA.STATISTICS 
WHERE TABLE_SCHEMA = 'airbnb_db';

SELECT TABLE_SCHEMA AS "Database", 
       ROUND(SUM(INDEX_LENGTH) / 1024 / 1024, 2) AS "Total Index Size (MB)" 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'airbnb' 
GROUP BY TABLE_SCHEMA;

SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'airbnb_db' AND REFERENCED_TABLE_NAME IS NOT NULL;

