-- 09. Mostre produtos cujo nome termina com “X”.

SELECT * FROM products WHERE LOWER(nome) LIKE LOWER('%x');