Create Database Uber;
Use Uber;
 

 Create View Successful_Bookings As
 select * from bookings
 Where Booking_Status = 'Success';

 # data of all Successful bookings  
 Select * From Successful_Bookings;
 
 
 Create View Avg_Distance_For_Each_Vehicle AS
 Select Vehicle_Type, AVG(Ride_Distance)
 as avg_distance From bookings
 Group By Vehicle_Type;
 # Avg Distance by each vehicle type 
 Select * from Avg_Distance_For_Each_Vehicle;
 
 
 Create View Canceled_Rides_by_Customers AS
 SELECT COUNT(*) From bookings
 Where Booking_Status = 'Canceled by Customer'
 # Total Number of Canceled Rides by Customers
 Select * from Canceled_Rides_by_Customers;
 
 
 Create View Top_Customer As 
 Select Customer_ID, Count(Booking_ID) as total_rides 
 From bookings
 Group By Customer_ID
 Order By total_rides DESC LIMIT 5;
 # Top 5 customers who. booked the highest number of rides 
 Select * from Top_Customer;
 
Create View Rides_canceled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM bookings
WHERE canceled_Rides_by_Driver = 'Personal & Car related issue';
# Get the number of rides cancelled by drivers due to personal and car-related issues
SELECT * From Rides_canceled_by_Drivers_P_C_Issues;
 
 
Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';
# Find the maximum and minimum driver ratings for Prime Sedan bookings
 Select * from Max_Min_Driver_Rating;
 

Create View UPI_Payment As
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';
# Retrieve all rides where payment was made using UPI
Select * from UPI_Payment;
 

Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;
# Find the average customer rating per vehicle type
Select * from AVG_Cust_Rating;



Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';
# Calculate the total booking value of rides completed successfully
Select * from total_successful_ride_value;


Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';
# List all incomplete rides along with the reason
Select * from Incomplete_Rides_Reason;