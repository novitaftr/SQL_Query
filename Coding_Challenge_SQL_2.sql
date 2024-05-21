-- Menampilkan nama customers dan waktu pengembalian > 7 hari 
SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    r.rental_date,
    r.return_date,
	(r.return_date - r.rental_date) AS days_rental
FROM
    customer c
JOIN
    rental r ON c.customer_id = r.customer_id
WHERE
    r.return_date > r.rental_date + INTERVAL '7' DAY;

-- Menampilkan nama pelanggan yang melakukan transaksi peminjaman > 1 pada hari senin
WITH MondayRentals AS (
SELECT
	customer_id,
	COUNT (customer_id) rental_count
FROM
	rental r
WHERE
	EXTRACT(DOW FROM r.rental_date) = 1
GROUP BY
	r.customer_id
HAVING
    COUNT (customer_id) > 1
)

SELECT
	m.customer_id,
	CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    m.rental_count
FROM
    MondayRentals m
INNER JOIN
    customer c
    ON m.customer_id = c.customer_id
ORDER BY
    m.customer_id ASC;

-- Menampilkan nama aktor dan jumlah film, serta peringkat aktor berdasarkan jumlah film, asc
WITH ActorFilmCount AS (
SELECT
	actor_id,
	COUNT (film_id) jumlah_film
FROM
	film_actor
GROUP BY
	actor_id
)

SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS actor_name,
    a.jumlah_film,
    RANK() OVER (ORDER BY jumlah_film DESC) AS actor_rank
FROM
    ActorFilmCount a
INNER JOIN
    actor c
    ON a.actor_id = c.actor_id
ORDER BY
    actor_rank ASC;
