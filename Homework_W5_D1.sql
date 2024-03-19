--Week 5 - Monday Questions

--1. How many actors are there with the last name ‘Wahlberg’? 

SELECT count(last_name)
FROM actor a 
WHERE last_name = 'Wahlberg'; -- Answer = 2.

--2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount)
FROM payment p
WHERE amount BETWEEN 3.99 AND 5.99; --Answer = 5607.

--3. What films have exactly 7 copies? (search in inventory)
SELECT * 
FROM 
	(SELECT f.film_id, f.title, count(i.film_id) AS film_id_count
	FROM film f 
	JOIN inventory i ON f.film_id = i.film_id
	GROUP BY f.film_id) x
WHERE x.film_id_count = 7; --Answer: We have 116 titles that have 7 film copies.

--4. How many customers have the first name ‘Willie’?
SELECT first_name, count(first_name) 
FROM customer c 
GROUP BY first_name 
HAVING first_name = 'Willie'; -- Answer: 2.

-- 5. What store employee (get the id) sold the most rentals (use the rental table)?
SELECT staff_id, count(staff_id) 
FROM rental r 
GROUP BY staff_id; --Answer: Staff_id sold 8040 rentals.

--6. How many unique district names are there?
SELECT COUNT(DISTINCT district) AS unique_district_count
FROM address; --Answer: 378.

--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, count(actor_id) AS count
FROM film_actor
GROUP BY film_id 
ORDER BY count DESC
LIMIT 5; --Answer: Film_ID = 508, count = 15.



--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT *
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es'; --Answer: 13.

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)

SELECT amount, COUNT(rental_id) AS rental_count
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental_id) > 250;
--Answer:
--Amount - rental_count 
--2.99	290
--4.99	281
--0.99	269

-- 10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
SELECT rating, count(film_id) AS Film_ID_Count
FROM film
GROUP BY rating
ORDER BY Film_ID_Count DESC; --Answer: Rating categories = 5. Rating with most movies = PG-13 223




