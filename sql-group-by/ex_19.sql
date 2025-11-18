-- Exercicio 19: Mostre categorias com mais de 3 produtos.

SELECT categoria.nome, SUM(produto.id) AS total_produtos
FROM categorias categoria
JOIN produtos produto ON categoria.id = produto.categoria_id
GROUP BY categoria.id
HAVING SUM(produto.id) >3
ORDER BY SUM(produto.id) ASC