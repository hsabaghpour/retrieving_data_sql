SELECT first_name,last_name,actor.actor_id,film_actor.film_id,title FROM actor
INNER JOIN film_actor
ON
actor.actor_id = film_actor.actor_id
INNER JOIN film
ON
film_actor.film_id = film.film_id
WHERE first_name = 'Nick' AND Last_name = 'Wahlberg'

;
