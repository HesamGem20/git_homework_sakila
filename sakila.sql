-- Task 1 - Show all actors' first and last names
-- revision 1
SELECT first_name, last_name
FROM actor;

-- Task 2 - Display the full names of all the actors in all capital letters in a single column. the column name should be "Actor Name".
SELECT CONCAT(UPPER(first_name), ' ', UPPER(last_name)) AS "Actor Name"
FROM actor;

-- Display the values of the first name, last name, and last name of the actor whose first name is Joe
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Joe';

-- Find all actors whose surname contains the word 'gen'!
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE '%gen%';

-- Search for all actors whose last name contains the word `li` and sort the results by first and last name.
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE '%li%'
ORDER BY first_name, last_name;

-- Task 3 - How many actors have different surnames?
SELECT COUNT(DISTINCT last_name) AS different_surnames
FROM actor;

-- Task 4 - Which surname appears more than once?
SELECT last_name, COUNT(*) AS count
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1
ORDER BY count DESC
LIMIT 1;

-- Task 5 - Show all country IDs and country names, which are China, Afghanistan, or Israel!
SELECT country_id, country
FROM country
WHERE country IN ('China', 'Afghanistan', 'Israel');

-- Task 6 - What is the average length of a film?
SELECT AVG(length) AS average_length
FROM film;

-- Task 7 - Display the names and addresses of all staff.
SELECT CONCAT(first_name, ' ', last_name) AS name, address
FROM staff;

-- Task 8 - Display the names of all customers and the corresponding amounts they have paid (payment amount).
-- ⚠️ To make the query not too slow, you only need to scan the first 10 results (limit 10;)
SELECT CONCAT(first_name, ' ', last_name) AS name, SUM(amount) AS payment_amount
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
LIMIT 10;

-- Task 9 - Display the titles of all the films and the names of the actors in them.
-- ⚠️ To make the query not too slow, you only need to scan the first 20 results (limit 20;)
SELECT film.title, GROUP_CONCAT(CONCAT(actor.first_name, ' ', actor.last_name) SEPARATOR ', ') AS actors
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
GROUP BY film.film_id
LIMIT 20;


