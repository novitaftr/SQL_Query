-- Membuat database 'dibimbing'
CREATE DATABASE dibimbing;

-- Membuat tabel 'siswa' di schema 'public'
CREATE TABLE public.siswa (
 id int PRIMARY KEY,
 nama varchar,
 berat_badan float);

-- Menambahkan 5 data ke dalam tabel 'siswa'
INSERT INTO
	public.siswa (id, nama, berat_badan)
VALUES
    (1,'Novita Fitriani', 46.6),
    (2,'Rasyid Sulaeman', 55.4),
    (3,'Aulia Martha', 53.2),
    (4,'Aprilia Wilona', 57.4),
    (5,'Yolanda Raintina', 45.9);
   
SELECT *
FROM siswa

-- DATABASE DVDRENTAL
-- Menunjukan first_name dan last_name actor yang memiliki first_name Nick, Ed, dan Jennifer
SELECT
	first_name, last_name
FROM
	actor
WHERE
	first_name IN ('Nick', 'Ed', 'Jennifer');

--Menghitung Total Amount untuk setiap payment_id yang Total Amount-nya lebih dari 5.99
SELECT
	payment_id,
	SUM(amount) Total_Amount
FROM
	payment
GROUP BY
	payment_id
HAVING
	SUM(amount) > 5.99;

-- Menunjukan film.id, film.title, film.description and film_length. Kelompokkan ke dalam 4 categories
SELECT
  film_id,
  title,
  description,
  length,
  CASE
    WHEN length > 100
    	THEN 'Long'
    WHEN length BETWEEN 87 AND 100
    	THEN 'Medium'
    WHEN length BETWEEN 72 AND 86
    	THEN 'Moderate'
    WHEN length <= 72
    	THEN 'Short'
  END AS length_category
FROM
	film
ORDER BY
	film_id ASC;

-- Tunjukkan 10 baris rental_id, rental_date, payment_id, dan amount, ordered by amount descending order
SELECT
	r.rental_id,
	r.rental_date,
	p.payment_id,
	p.amount
FROM
	rental r
JOIN
	payment p
ON
	r.rental_id = p.rental_id
ORDER BY
	p.amount DESC
LIMIT
	10;

-- Menggabungkan data address dengan city_id = 42 dan city_id = 300
SELECT *
FROM
	address
WHERE
	city_id = 42
UNION
SELECT *
FROM
	address
WHERE
	city_id = 300
ORDER BY
	city_id DESC;



