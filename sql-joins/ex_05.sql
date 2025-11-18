-- Exercicio 5: Faça JOIN entre produtos e categorias.

SELECT p.id, p.nome, c.nome
FROM produtos p
INNER JOIN categorias c ON p.categoria_id = c.id