-- SELECT all descriptive statistics from numerical fields as min, max, and mean (average); select mode for nonnumerical variable
SELECT AVG(rental_duration) AS avg_rental_duration,
MIN(rental_duration) AS min_rental_duration,
MAX(rental_duration) AS max_rental_duration,
AVG(rental_rate) AS avg_rental_rate,
MIN(rental_rate) AS min_rental_rate,
MAX(rental_rate) AS max_rental_rate,
AVG(length) AS avg_movie_length,
MAX(length) AS max_movie_length,
MIN(length) AS min_movie_length,
AVG(replacement_cost) AS avg_replacement_cost,
MAX(replacement_cost) AS max_replacement_cost,
MIN(replacement_cost) AS min_replacement_cost,
MODE() WITHIN GROUP (ORDER BY rating) AS most_common_rating
FROM film
