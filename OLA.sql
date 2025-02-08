create database ola;
use ola;
select count(booking_id) from ola_bookings;
-- ALTER TABLE ola_bookings CHANGE COLUMN `ï»¿Date` `Date` DATETIME;

select * from ola_bookings;
-- SET SQL_SAFE_UPDATES = 0;

-- 1. Retrieve all successful bookings:
SELECT * FROM ola_bookings WHERE Booking_Status = 'Success';

-- 2. Find the average ride distance for each vehicle type:
SELECT Vehicle_Type, Round(AVG(Ride_Distance),2) as avg_distance FROM ola_bookings GROUP BY Vehicle_Type;

-- 3. Get the total number of cancelled rides by customers:
SELECT COUNT(*) FROM ola_bookings WHERE Booking_Status = 'Canceled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides:
SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM ola_bookings GROUP BY
Customer_ID ORDER BY total_rides DESC LIMIT 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT COUNT(*) FROM ola_bookings WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM
ola_bookings WHERE Vehicle_Type = 'Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI:
SELECT * FROM ola_bookings WHERE Payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type:
SELECT Vehicle_Type, ROUND(AVG(Customer_Rating), 2) as avg_customer_rating FROM ola_bookings
GROUP BY Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:
SELECT SUM(Booking_Value) as total_successful_value FROM ola_bookings WHERE Booking_Status = 'Success';

-- 10. List all incomplete rides along with the reason:
SELECT Booking_ID, Incomplete_Rides_Reason FROM ola_bookings WHERE Incomplete_Rides ='Yes';