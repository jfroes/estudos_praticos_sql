-- Exercicio 05: Máximo e mínimo preço por categoria.

SELECT categoria.nome, MAX(produto.preco) AS preco_max, MIN(produto.preco) AS preco_min
FROM categorias categoria
JOIN produtos produto ON categoria.id = produto.fornecedor_id
GROUP BY categoria.id