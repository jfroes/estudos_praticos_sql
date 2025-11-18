-- Exercicio 09: Soma de estoque por categoria.

SELECT categoria.nome, SUM(produto.estoque)
FROM categorias categoria
JOIN produtos produto ON categoria.id = produto.categoria_id
GROUP BY categoria.id