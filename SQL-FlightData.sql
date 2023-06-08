---------------------Challenges-01----------------------
/*You need to find out how many ticketscompany has sold in the following category
	1. Low price ticket : total_amount<20000
    2. Mid price ticket: total_amount between 20000 and 150000
    3. High price ticket: total_amount>=150000*/
	
SELECT * FROM Bookings;


SELECT
COUNT(*) AS tickets,
CASE 
WHEN total_amount < 20000 THEN 'low price ticket'
WHEN total_amount > 150000 THEN 'Midium price ticket'
ELSE 'high price ticket'
END as ticket_price
FROM bookings
GROUP BY ticket_price






/*how many flight have departed in the following seasons
	Winter - December,January,february
	Spring - March,April,May
	Summer - June,July,August
	Fall   - Sep,Oct,Nov*/
	
SELECT 
COUNT(*) as flights,
CASE
WHEN EXTRACT(month from scheduled_departure) IN (12,1,2) THEN 'Winter'
WHEN EXTRACT (month from scheduled_departure) <= 5 THEN 'Spring'
WHEN EXTRACT (month from scheduled_departure) <= 8 THEN 'Summer'
ELSE 'Fall' 
END as season
FROM flights
GROUP BY season
	
	
	
		
/*    1. How many people choose seats in the category
			-Business
			-Economy
			-Comfort
			*/
			
	SELECT * FROM boarding_passes;
	SELECT * FROM seats;
	
	
	SELECT 
	s.fare_conditions,
	COUNT(*) AS no_of_people
	FROM boarding_passes b
	INNER JOIN seats s
	ON b.seat_no = s.seat_no
	GROUP BY s.fare_conditions;
	
/* FInd out which seat has been chosen most frequently.*/
	
	SELECT 
	RIGHT(s.seat_no,1) ,
	COUNT(*) 
	FROM seats s
	LEFT JOIN boarding_passes b
	ON s.seat_no = b.seat_no
	GROUP BY RIGHT(s.seat_no,1)
	ORDER BY COUNT(*) DESC;

/* Find out which line(A,B,....H) has been chosen most frequently*/


	