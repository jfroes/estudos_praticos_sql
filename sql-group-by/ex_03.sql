-- Exercicio 03: Média de preço por categoria.

SELECT categoria.nome, ROUND(AVG(produto.preco), 2)
FROM categorias categoria
JOIN produtos produto ON categoria.id = produto.categoria_id
GROUP BY categoria.id