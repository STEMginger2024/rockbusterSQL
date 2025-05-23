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
