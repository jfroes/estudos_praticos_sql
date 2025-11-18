-- Exercicio 17: Liste produtos com categoria nula (LEFT JOIN).

SELECT p.nome AS produto, c.nome AS categoria
FROM produtos  p
LEFT JOIN categorias c ON p.categoria_id = c.id
WHERE c IS NULL