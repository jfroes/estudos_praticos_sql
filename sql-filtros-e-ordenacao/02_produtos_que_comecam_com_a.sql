-- 2. Mostre produtos com nome começando por “A”.

SELECT * FROM products WHERE LOWER(nome) LIKE LOWER('A%');