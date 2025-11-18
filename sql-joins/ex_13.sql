-- Exercicio 13: Use alias (AS) para simplificar.

SELECT p.nome AS produto, c.nome AS categoria
FROM produtos p
JOIN categorias c ON p.categoria_id = c.id;