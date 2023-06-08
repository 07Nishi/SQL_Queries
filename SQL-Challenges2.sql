----------------------Challenge-01----------------------------------

/*The marketing manager ask you for a list of all customers
with first name and last name and customer email*/

Select * from customer;

Select 
First_name , Last_name , email
From customer;


----------------------Challenge-02----------------------
/* The marketing manager ask you to order the customer list 
by the last_name
They want to start from 'Z' and work towards 'A' */

Select 
last_name From customer
Order by last_name Desc;


----------------------Challenge-03----------------------
/*A marketing team member ask you about the differnt prices that 
have been paid...
to make it easier for them order the prices from high to low*/

Select * from payment;

Select distinct
amount
from payment
order by amount desc;

----------------------Challenge-04------------------------

--------1. Create a list of all the distinct districts customers are from.
select * from address;

Select Distinct 
district 
From address;

--------2. What is the latest rental date?

Select * from rental;

Select rental_date
From rental
ORDER BY rental_date DESC
LIMIT 1;


---------3. How many films does the company have
SELECT * FROM film;
SELECT * FROM film_category;

SELECT COUNT(*)
FROM film;


----------4. How many distinct last name of the customer are there? 
SELECT * FROM CUSTOMER;

SELECT 
Count(*) Last_name
FROM customer;


----------------------Challenge-05----------------------

--------1.How many payment were made by the customer with customer id = 100
SELECT * FROM payment;

SELECT count(*)
From payment
WHERE Customer_id = 100;

--------2.What is the last name of our customer with first name 'ERICA'?

SELECT last_name
FROM customer
WHERE first_name = 'ERICA';



--------3.show only amount that are greater than $10.99 ?
SELECT * from payment;

SELECT DISTINCT
amount
FROM Payment
WHERE amount > 10.99;



----------------------Challenges-06----------------------


/*1.The inventory manager asks you how rentals have not been
returned yet(return_date is null)*/

SELECT * FROM RENTAL;

SELECT Count(*)
FROM rental
WHERE return_date is NULL;



/*2.The sales manager asks you how for a list of all the payment_id 
with an amount less than or equal to $2 include payment_id ANd the amount.*/

SELECT * FROM PAYMENT;

SELECT payment_id , Amount
FROM PAYMENT
WHERE amount < 2 
ORDER BY amount DESC;

----------------------Challenges-07----------------------
/*1.The support manager asks you about a list of all payment of the 
customer 332,346and 354 where the amount is either less than $2 or
greater than $10*/

SELECT * FROM PAYMENT;

SELECT * FROM PAYMENT WHERE customer_id IN(332,346,354)
AND (amount < 2 OR amount > 10);


/*2.It should be ordered by the customer first(ascending ) and then as 
second condition order by amount in a descending order.*/

SELECT customer_id,amount 
From payment
ORDER BY customer_id ASC,amount DESC;


----------------------Challenges-08----------------------

/*How many payemnts have been made on january 26th and 27th
2020 with an amount between 1.99 and 3.99*/

SELECT * FROM PAYMENT;

SELECT count(*)
FROM PAYMENT
WHERE payment_date BETWEEN '2020-01-26'AND'2020-01-27 23:59'
AND 
amount BETWEEN 1.99 AND 3.99;


----------------------Challenges-09----------------------
/*There have been 6 complaints of customer about their payments
customer_id : 12,25,67,93,124,234
The concerned payment are all the payments of these customer with amount 4.99,7.99
and 9.99 in january 2020;*/

SELECT * FROM PAYMENT;

SELECT customer_Id,amount,payment_date
From payment
WHERE customer_id IN(12,25,67,93,124,234)
AND amount IN (4.99,7.99,9.99)
AND payment_date BETWEEN '2020-01-01' AND '2020-01-31 23:59';

----------------------Challenges-09----------------------
/*1.How many customer are there with a first name that is 3 letter long and either an 
'X' or a 'Y'as the last letter in the last name?*/

SELECT * FROM customer
WHERE First_name LIKE '___'
AND (last_name LIKE '%X'
OR last_name LIKE '%Y');


SELECT count(*) FROM customer
WHERE First_name LIKE '___'
AND (last_name LIKE '%X'
OR last_name LIKE '%Y');



/*2. How many movies are there that contain the Documentary in the description*/

SELECT count(*)
FROM FILM
WHERE description LIKE '%Documentary%';


----------------------Challenges-10----------------------
/*1.How many movies are there contain 'Saga' in the description
and where the title starts either with 'A' or ends with 'R'
USe the alias 'no_of_movies'*/

SELECT * FROM Film;

SELECT 
COUNT(*) AS number_of_movies
FROM film
WHERE Description LIKE '%Saga%'
AND 
(Title LIKE 'A%' OR title LIKE '%R' );



/*2.Create a list of all customer where the first name contains 
'ER' and has an 'A ' as the second letter.
Order the results by the last name descendingly*/

SELECT * 
FROM customer
WHERE first_name LIKE '%ER'
AND first_name LIKE '_A%'
ORDER BY last_name DESC;

/*3. How many payments are there where the amount is either 0 or is
between 3.99 and 7.99 and in the same time has happened on 2020-05-01*/


SELECT 
Count(*)
FROM payment
WHERE (amount = 0 OR amount BETWEEN 3.99 AND 7.99)
AND payment_date BETWEEN '2020-05-01' AND '2020-05-02';


----------------------Challenges-10----------------------
/*1.Find the minimum,maximum average(rounded),sum of the replacement cost of film*/

SELECT * FROM film;

SELECT 
MIN(replacement_cost) AS Minimum_Cost
FROM film;

SELECT 
MAX(replacement_cost) AS maximum_cost
FROM film;

SELECT 
ROUND(AVG(replacement_cost), 2) AS Average_cost
FROM film;


SELECT 
SUM(replacement_cost)
FROM film;



----------------------Challenges-11----------------------

/*1.Your manager wants to which of the two emoloyees(staff_id)
is responsible for more payments?*/

SELECT * FROM payment;

SELECT 
staff_id,
SUM(amount)
From payment
GROUP BY staff_id;



Select * from payment
where staff_id = 2;





/*2.Which of the two is responsible for higher overall payment amount?*/
SELECT * FROM payment;

SELECT 
SUM(amount),
Staff_id
From payment
GROUP BY staff_id
ORDER BY SUM DESC;



/*3.How do these amaount chnage if we don't consider amounts equal to 0?*/


SELECT 

SUM(amount),
Count(*)
FROM payment
WHERE amount != 0
GROUP BY staff_id;


---------------------Challenges-12----------------------

---Which employee had the highest sales amount in a single day?


Select staff_id,
DATE(payment_date),
SUM(amount)
From payment
GROUP BY staff_id,DATE(payment_date)
ORDER BY SUM(amount) DESC;





---Which employee had the most sales in a single day(not counting payments with amount = 0)?

Select staff_id,
DATE(payment_date),
COUNT(*)
From payment
WHERE amount != 0
GROUP BY staff_id,DATE(payment_date)
ORDER BY COUNT(*) DESC;


---------------------Challenges-13----------------------

/* Find out what is the average payment amount grouped by customer
and day - consider only the days/customers with more than 1 payment
(per customer and day).
Order by the average amount in desc order */


SELECT 
customer_id,
DATE(payment_date),
ROUND(AVG(amount),2) AS avg_amount,
COUNT(*)
FROM payment
WHERE DATE(payment_date) IN ('2020-04-28','2020-04-29' , '2020-04-30')
GROUP BY customer_id,DATE(payment_date)
HAVING COUNT(*)>1
ORDER BY 3 DESC;


---------------------Challenges-14----------------------

/* In the email System there was a problem with names where either the first name or the last name
is more than 10 characters long.
Find these customer and output the list of these first and last
name in all lower case.*/

SELECT 
LOWER(first_name),
LOWER(last_name),
LOWER(email)
FROM customer
WHERE LENGTH(first_name) > 10
OR LENGTH(last_name) > 10;

---------------------Challenges-15----------------------
------Extract the last 5 character of the email address first
SELECT 
email,
RIGHT(email,5)
FROM customer;





------The email address always ends with '.org'.
SELECT 
email,
RIGHT(email,4)
FROM customer;



------How can you extract just the '.' from email address?
SELECT 
email,
LEFT(RIGHT(email,4),1)
FROM customer;


---------------------Challenges-16----------------------
/* You need to create an anonymized version of email address
   example : MARRY.SMITH@sakilacustomer.org
   M***@sakilacoustomer.org
   
   */
   
SELECT
LEFT(email,1) || '***' || RIGHT(email,19)AS anonymized_email
FROM customer;

---------------------Challenges-17----------------------

/* YOu need to extract the first name from the email address and concatenate
it with the last name . It should be in the form:
"Last Name,First name"
*/

SELECT
last_name||','|| LEFT(email,POSITION('.' IN email)-1) AS firstname_lastname,
last_name
FROM customer;

---------------------Challenges-18----------------------

/*You need to create an anonymized form of the email address in the following way
		M***,S***@sakilacustomer.org*/
		
SELECT 
LEFT(email,1) || '***'|| SUBSTRING(email from POSITION('.' in email) for 2 )
|| '***' || SUBSTRING(email from POSITION('@' in email))
FROM customer;
		
		
/*In a second query create an anonymized form of the email address in the following way
		***Y,S***@sakilacustomer.org*/
		
SELECT 
'***'
||SUBSTRING(email from POSITION('.' in email) -1 for 3)
||'***'
||SUBSTRING(email from POSITION('@' IN email))
From customer;


---------------------Challenges-18----------------------

----What is the month with the highest total payment amount?
SELECT * FROM payment;

SELECT 
EXTRACT(month from payment_date) AS month,
SUM(amount)
FROM payment
GROUP  BY month
ORDER BY SUM(amount) DESC;





----What is the day of week with the highest total payment amount?(0 is sunday)
SELECT * FROM payment;

SELECT 
EXTRACT(dow from payment_date) AS day_of_week,
SUM(amount) AS payment_amount
FROM payment
GROUP  BY day_of_week
ORDER BY payment_amount DESC;







----what is the highest amount one customer has spent in a week?

SELECT 
customer_id,
EXTRACT(week from payment_date) AS week,
SUM(amount) AS payment_amount
FROM payment
GROUP  BY week,customer_id
ORDER BY payment_amount DESC;

---------------------Challenges-19----------------------
---Different formats

SELECT
SUM(amount) as total_payment,
TO_CHAR(payment_date,'Dy, DD/MM/YYYY') AS day
FROM payment
GROUP BY day
ORDER BY total_payment DESC;



SELECT
SUM(amount) as total_payment,
TO_CHAR(payment_date,'Mon,YYYY') AS Month_Year
FROM payment
GROUP BY Month_Year
ORDER BY total_payment DESC;

SELECT
SUM(amount) as total_payment,
TO_CHAR(payment_date,'Dy,HH:MI') AS Day_time
FROM payment
GROUP BY Day_time
ORDER BY total_payment ASC;


---------------------Challenges-20----------------------

/*Need to create a list for the support team of all rental duration
of customer with customer_id 35.*/

SELECT * From rental;



SELECT 
customer_id,
return_date-rental_date AS rental_duration
FROM rental
WHERE customer_id=35;


/* Also need to find out for the support team which cutomer has the
longest average rental duration*/


SELECT 
customer_id,
AVG(return_date-rental_date) AS rental_duration
FROM rental
GROUP BY customer_id
ORDER BY rental_duration DESC;

---------------------Challenges-21----------------------
/*Create a list of that films_ids together with the percentage
rounded to 2 decimal places.For example 3.54=(3.54%)*/

SELECT * FROM film;

SELECT film_id,
ROUND(rental_rate/replacement_cost*100,2) AS percentage
FROM film
WHERE ROUND(rental_rate / replacement_cost*100,2)<4
ORDER BY 2 ASC;

---------------------Challenges-22----------------------

/*Create a tier list in following way
1. Rating id 'PG'or 'PG-13' or length is more than 210 min:
	'Great rating or long(tier 1)'.
2. Description contains 'Drama' and length is more than 90 min:
	'Long drama(tier 2)'
3. Description contains 'Drama' and length is not more than 90 min:
	'Short drama(tier 2)'
4. Rental_rate less than $1:
	'Very cheap (tier 4)'
	*/
	
	
SELECT
title,
CASE
WHEN rating IN ('PG','PG-13') OR length > 210 THEN 'Great rating or long (tier 1)'
WHEN description LIKE '%Drama%' AND length>90 THEN 'Long drama (tier 2)'
WHEN description LIKE '%Drama%' THEN 'Short drama (tier 3)'
WHEN rental_rate<1 THEN 'Very cheap (tier 4)'
END as tier_list
FROM film
WHERE 
CASE
WHEN rating IN ('PG','PG-13') OR length > 210 THEN 'Great rating or long (tier 1)'
WHEN description LIKE '%Drama%' AND length>90 THEN 'Long drama (tier 2)'
WHEN description LIKE '%Drama%' THEN 'Short drama (tier 3)'
WHEN rental_rate<1 THEN 'Very cheap (tier 4)'
END is not null;
	
	
---------------------Challenges-23----------------------
---------------------Coalesce and cast-------------------

SELECT * FROM film;

SELECT
rental_date,
COALESCE(CAST(return_date AS VARCHAR),'not returned') AS rental_status
FROM rental
ORDER BY rental_date DESC;

---------------------Challenges-24----------------------
					---	JOINS

-----1.What are the customers (first_name,last_name,phone number and their district) from texas

SELECT * FROM customer;
SELECT * FROM address;


SELECT first_name,last_name,phone,district
FROM customer c
LEFT JOIN address a
ON c.address_id = a.address_id
WHERE district = 'Texas';

-----2. Are there any(old) addresses that are not related to any customer?

SELECT *
FROM address a
LEFT JOIN customer c
ON c.address_id = a.address_id
WHERE c.customer_id IS null;

---------------------Challenges-25----------------------

/*   1. Which customers are from Brazil?
     2. Write a query to get first_name,last_name,email and the country from
        all customer from Brazil*/
SELECT * FROM country;
SELECT * FROM customer;
SELECT * FROM address;

SELECT first_name,last_name,email,co.country FROM customer c
LEFT JOIN address a
ON c.address_id = a.address_id
LEFT JOIN city ci
ON ci.city_id = a.city_id
LEFT JOIN country co
ON co.country_id = ci.country_id
WHERE country = 'Brazil';




----------------------------------Challenges-25-----------------------------------
               ---------------Union&Subqueries

---1. Select all of the films where the length is longer than the average of all films.

SELECT film_id , title,length
FROM film
WHERE length > (SELECT AVG(length) FROM film);

---2. Return all the films that are available in the inventory in store 2 more than 3 times.

SELECT * FROM film
WHERE film_id IN
(SELECT film_id FROM inventory
WHERE store_id = 2
GROUP BY film_id
HAVING COUNT(*) > 3);

/* 3. Return all customer firstname and lastname that have made a payment
on '2020-01-25'*/


SELECT first_name , last_name
FROM customer
WHERE customer_id  IN (SELECT customer_id FROM payment
					  WHERE DATE(payment_date)='2020-01-25')




/* 4. Return all customer firstname and email address taht have spent a 
more than $30.*/

SELECT first_name , email
FROM customer
WHERE customer_id  IN (SELECT customer_id 
					   FROM payment
					   GROUP BY customer_id
					   HAVING SUM(amount) > 30)





/* 5. Return all the customer firstname and lastname that are from California
and have spent more than 100 in total*/

SELECT first_name , last_name
FROM customer
WHERE customer_id  IN (SELECT customer_id 
					   FROM payment
					   GROUP BY customer_id
					   HAVING SUM(amount) > 100)
AND customer_id IN(SELECT customer_id 
				  FROM customer c
				  INNER JOIN address a
				  ON c.address_id = a.address_id
				  WHERE district =  'California')



/* 6. What is the average total amount spent per day(average daily revenue)?*/


SELECT 
ROUND(AVG(amount_per_day),2) AS daily_rev_avg
FROM
(SELECT 
SUM(amount) AS amount_per_day,
DATE(payment_date)
FROM payment
GROUP BY DATE(payment_date))A;


/* 7. show all the payments together with how much the payment amount
   is below the maximum payment amount */
 SELECT * FROM PAYMENT;  
   
SELECT 
* , (SELECT MAX(amount) FROM payment) - amount AS difference
FROM payment;


/* 8. SHow only those movies titles , their associated film_id and 
      replacement_cost with the lowest replacement_cost for in each 
	  rating category - also show the rating	  */

SELECT title,film_id,replacement_cost,rating
FROM film f1
WHERE replacement_cost = 
			(SELECT MIN(replacement_cost) FROM film f2
			 WHERE f1.rating = f2.rating)

/* 9 . Show only those movie titles,their associated film_id and the length
       that have the highest length in each rating category-also show in rating*/


SELECT title,film_id,length,rating
FROM film f1
WHERE length = 
			(SELECT MAX(length) FROM film f2
			 WHERE f1.rating = f2.rating)
			 
/*10 . Show all the payment plus the total amount for every customer
	   as well as the number of payment of each customer*/
	   
SELECT 
payment_id,
customer_id,
staff_id,amount,
(SELECT SUM(amount) AS sum_amount
  FROM payment p2
  WHERE p1.customer_id = p2.customer_id),
  (SELECT COUNT(amount) AS count_payments
  FROM payment p2
  WHERE p1.customer_id = p2.customer_id)
  FROM payment p1
  ORDER BY customer_id,amount DESC;
	   
/*11. SHow only those films with the highest replacement cost in their rating
      category plus show the average replacement cost in their rating category*/

SELECT title,replacement_cost,rating,
(SELECT AVG(replacement_cost) FROM film f2
			WHERE f1.rating = f2.rating)
FROm film f1
WHERE replacement_cost = (SELECT MAX(replacement_cost) FROM film f3
									WHERE f1.rating=f3.rating)



	  
/*12 . Show only those payment with the highest payment for each customer
       first name - including the payment_id of that payment*/
SELECT first_name,amount,payment_id
FROM payment p1
INNER JOIN customer c
ON p1.customer_id=c.customer_id
WHERE amount = (SELECT MAX(amount) FROM payment p2
			    WHERE p1.customer_id = p2.customer_id)
				
	------------If we not include payment_id			
SELECT first_name,MAX(amount)
FROM payment p1
INNER JOIN customer c
ON p1.customer_id=c.customer_id
GROUP BY first_name;




----------------------------------Challenges-26-----------------------------------
----1.What's the lowest replacement cost?

SELECT * FROM film;

SELECT MIN(replacement_cost)
FROM film;

/*  Write a query that gives an overview of how many films have replacements costs in the following cost ranges
	low: 9.99 - 19.99
	medium: 20.00 - 24.99
	high: 25.00 - 29.99
	2. How many films have a replacement cost in the "low" group?*/
SELECT 
CASE
WHEN replacement_cost BETWEEN 9.99 AND 19.99
THEN 'low'
WHEN replacement_cost BETWEEN 20.00 AND 24.99
THEN 'medium'	
WHEN replacement_cost BETWEEN 25.00 AND 29.99
THEN 'high'	
END AS cost_range,
COUNT(*)
FROM film
GROUP BY cost_range
ORDER BY COUNT(*) DESC;

/*  Create a list of the film titles including their title, length,
    and category name ordered descendingly by length. 
	Filter the results to only the movies in the category 'Drama' or 
	'Sports'.

   3. In which category is the longest film and how long is it?*/
   
 SELECT title,name,length
 FROM film f
 LEFT JOIN film_category fc
 ON f.film_id = fc.film_id
 LEFT JOIN category c
 ON c.category_id=fc.category_id
 WHERE name = 'Sports' OR name = 'Drama'
 ORDER BY length DESC;

/*  Create an overview of how many movies (titles) there are in each
    category (name).

   4. Which category (name) is the most common among the films?*/


SELECT * FROM film;

SELECT  
name,
COUNT(title)
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON c.category_id=fc.category_id
GROUP BY name
ORDER BY 2 desc




   
/*  Create an overview of the actors' first and last names and
    in how many movies they appear in.
   5.Which actor is part of most movies??*/
   
 /*  Create an overview of the addresses that are
     not associated to any customer.
   6.How many addresses are that?*/
	
/*  Create an overview of the cities and how much 
    sales (sum of amount) have occurred there.
   7.  Which city has the most sales?*/
   
/*  Create an overview of the revenue (sum of amount) 
    grouped by a column in the format "country, city".
   8. Which country, city has the least sales?*/
   
/*  Create a list with the average of the sales amount each
    staff_id has per customer. 
   9. Which staff_id makes on average more revenue per customer?*/
   
/*  Create a query that shows average daily revenue of all Sundays.
   10. What is the daily average revenue of all Sundays? */  
   
/*  Create a list of movies - with their length and their replacement cost
- that are longer than the average length in each replacement cost group.
   11. Which two movies are the shortest on that list and how long are they?*/
     
/*  Create a list that shows the "average customer lifetime value" 
grouped by the different districts.	 
    12. Which district has the highest average customer lifetime value?*/
	
/*  Create a list that shows all payments including the payment_id, amount, 
    and the film category (name) plus the total amount that was made in this category. 
	Order the results ascendingly by the category (name) and as second order criterion
	by the payment_id ascendingly.
    13.  What is the total revenue of the category 'Action' and what is the lowest
	payment_id in that category 'Action'?
*/
	
/*  Create a list with the top overall revenue of a film title (sum of amount per title) 
    for each category (name).
    14. Which is the top-performing film in the animation category?
*/	
	
	
	
--------------------------CREATE TABLE---------------------------------

CREATE TABLE director(
director_id SERIAL PRIMARY KEY,
director_account_name VARCHAR(20) UNIQUE,
first_name VARCHAR(50),
last_name VARCHAR(50) DEFAULT 'Not specified',
date_of_birth DATE,
address_id INT REFERENCES address(address_id))


----------ALTER TABLE---------------

ALTER TABLE director 
ALTER COLUMN director_account_name TYPE VARCHAR(30),
ALTER COLUMN last_name DROP DEFAULT,
ALTER COLUMN last_name SET NOT NULL,
ADD COLUMN email VARCHAR(40);

--------RENAME COMMAND-----------------------------------
ALTER TABLE director
RENAME director_account_name TO account_name;


ALTER TABLE director
RENAME TO directors;

SELECT * FROM directors;


-----------------------CHALLENGES--------------------------

----1. During creation add the DEFAULT 'Not defined' to the genre.
----2. Add the not null constraints to the song_name column.
----3. Add the constraint with default name to ensure the price is at least 1.99
----4. Add the constraints date_check to ensure the release date is between today and 01-01-1950.
----5. Insert song_id,song_name,genre,price,release_date.



CREATE TABLE songs (
song_id INT Primary Key,
song_name VARCHAR(30) ,
genre VARCHAR(30),
price numeric(4,2),
release_date DATE);

SELECT * FROM songs;

ALTER TABLE songs
ALTER COLUMN genre SET DEFAULT 'Not defined';

ALTER TABLE songs
ALTER COLUMN song_name SET NOT NULL;

ALTER TABLE songs
ADD CONSTRAINT price_check
CHECK (price >= 1.99);

ALTER TABLE songs
ADD CONSTRAINT date_check 
CHECK (release_date >= '1950-01-01'::date AND release_date <= CURRENT_DATE);


-----------------------Challenges-----------------------------
---Update all rental prices that are 0.99 to 1.99
----1. Add the column initiaSETls(data type varchar(10))

UPDATE film
SET rental_rate=1.99
WHERE rental_rate=0.99


---------------------Challenges-DELETE------------------------------
--Delete rows in the payment table with payment_id 17064 and 17067

Select * from payment 
WHERE payment_id IN(17064,17067);

DELETE FROM payment
WHERE payment_id = 17064 AND payment_id =17067
RETURNING *;

