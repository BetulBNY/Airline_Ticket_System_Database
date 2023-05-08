--1) Details of passenegers who have booked a ticket to Atlanta with a departure time of 17.00

/*
SELECT First_Name, Last_Name, Ticket_No, Destination
FROM Ticket
WHERE Destination= 'Atlanta' AND Departure_Time= 17.00
*/

--2) Which airline’s plane is not currently in the ariplane table
/*
SELECT AirlineID FROM Airline
EXCEPT 
SELECT AirlineID FROM Airplane
*/

--3) Print the prices of seats 5000 to 10000 and the classes of seats in ascending order./*SELECT Seat_Class, Price FROM Seat
WHERE Price BETWEEN 5000 and 10000
ORDER BY Price
*/

--4) Show top 5 destinations with the highest number of tickets bought for for departures between 08.00 and 18.00.
/*
SELECT TOP 5 Destination, COUNT(*) AS num_of_tickets_bought 
FROM Ticket
WHERE Departure_Time > '08.00' AND Departure_Time < '18.00' 
GROUP BY Destination 
ORDER BY num_of_tickets_bought DESC;
*/

--5) How many different airplane crews do we have? 
/*
SELECT DISTINCT CrewNo FROM Crew
*/

--6) Show all Flight informations where the arrival airport code is either ATL or BCN.
/*
SELECT* FROM Flight WHERE ArrAir_Code IN('ATL','BCN')
*/

--7) Show all Seat table informations where the price of the seat is equal to the highest price for the Business Class
/*
SELECT * FROM Seat 
WHERE Price = (SELECT TOP 1 Price FROM Seat WHERE Seat_Class = 'BC' ORDER BY Price DESC)
*/

--8) Find out which customer preferred which airline company how many times. (We can use this for personal recommendation systems or advertising.)
/*
SELECT Client.ClientID, Airline.AirlineID, COUNT(Booking.PNR) AS Number
FROM Client
JOIN Booking ON Booking.ClientID = Client.ClientID
JOIN Flight ON Flight.FlightID = Booking.FlightID
JOIN Airplane ON Airplane.AirplaneID = Flight.AirplaneID
JOIN Airline ON Airline.AirlineID = Airplane.AirlineID
GROUP BY Client.ClientID, Airline.AirlineID
*/
--9) How many flights took place between 2023-01-01 and 2023-10-10 from which airline companies?
/*
SELECT Airline.Airline_Name, COUNT(Movement.Departure_date) AS number_of_flights FROM Movement
JOIN Airplane ON Airplane.AirplaneId = Movement.AirplaneId
JOIN Airline ON Airline.AirlineId = Airplane.AirlineId
WHERE Departure_date > '2023-01-01' AND Departure_date < '2023-10-10'
GROUP BY Airline.Airline_Name ORDER BY number_of_flights DESC
*/

--10) Airplane codes with the highest number of seats in our database.
/*
SELECT TOP 3 Airplane.AirplaneId,  COUNT(*) AS Number_Of_Seats 
FROM Seat
JOIN Flight ON Flight.FlightId = Seat.FlightId 
JOIN Airplane ON Airplane.AirplaneId = Flight.AirplaneId 
GROUP BY Airplane.AirplaneId
ORDER BY COUNT(*) DESC;
*/

--Without Join
/*
SELECT TOP 3 Airplane.AirplaneId,  COUNT(*) AS Number_Of_Seats 
FROM Seat, Flight, Airplane
WHERE Flight.FlightId = Seat.FlightId  AND Airplane.AirplaneId = Flight.AirplaneId 
GROUP BY Airplane.AirplaneId
ORDER BY COUNT(*) DESC;
*/


--11) List the bookings with a total price greater than all seats whose seat number starts with ‘A’.
/*
SELECT *
FROM Booking
WHERE Total_Price > ALL(
  SELECT Price
  FROM Seat
  WHERE SeatNumber LIKE 'A%');
 */
