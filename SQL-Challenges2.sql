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









