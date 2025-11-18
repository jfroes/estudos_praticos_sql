-- Exercicio 10: Agrupe produtos com HAVING preço médio > 100.

SELECT produto.nome, ROUND(AVG(produto.preco),2) AS preco_medio
FROM produtos produto
GROUP BY produto.id
HAVING  ROUND(AVG(produto.preco),2) > 100
