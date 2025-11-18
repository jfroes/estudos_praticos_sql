-- 05. Mostre produtos de categoria específica.

SELECT * FROM products WHERE LOWER(categoria) = LOWER('Calçados');