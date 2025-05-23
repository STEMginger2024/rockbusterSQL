-- Selecting the top ten countries based on count of customer IDs existing in each country.
SELECT D.country,
COUNT(customer_id)
FROM customer A
/* The customer table contains only address information, so we must perform joins to the city and country tables
to find the data we need.*/
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
/*We want only the top ten countries, so we will group by country, place the data in descending order,
and limit it to 10.*/
GROUP BY country
ORDER BY COUNT(customer_id) DESC
LIMIT 10

--Selecting the top ten cities from these top ten countries, based on count of customer IDs.
SELECT C.city,
D.country,
COUNT(customer_id) AS unique_customers
FROM customer A
/* Performing same joins as before, and adding WHERE to select only those countries we found in the previous query. */
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
WHERE country IN ('India','China','United States','Japan',
'Mexico','Brazil','Russian Federation','Philippines','Turkey',
'Indonesia')
/* Ordering and limiting data as above, but adding the city variable to GROUP BY as well. */
GROUP BY city, country
ORDER BY COUNT(customer_id) DESC
LIMIT 10

--Selecting the top 5 customers from these top ten cities, but this time we are selecting them by total amount spent at Rockbuster.
SELECT SUM(amount) AS total_amount_paid,
B.customer_id,
B.first_name AS customer_first_name,
B.last_name AS customer_last_name,
D.city,
E.country
FROM payment A
/* Again, same joins as above, but this time using WHERE to limit cities instead of countries. */
INNER JOIN customer B ON A.customer_id = B.customer_id
INNER JOIN address C ON B.address_id = C.address_id
INNER JOIN city D ON C.city_id = D.city_id
INNER JOIN country E ON D.country_id = E.country_id
WHERE city IN ('Aurora','Atlixco','Xintai','Adoni',
'Dhule (Dhulia)','Kurashiki','Pingxiang','Sivas',
'Celaya','So Leopoldo')
/* Again ordering and limiting data as above, but this time limiting it to five, and adding the customer ID to GROUP BY as well. */
GROUP BY B.customer_id, D.city, E.country
ORDER BY total_amount_paid DESC
LIMIT 5
