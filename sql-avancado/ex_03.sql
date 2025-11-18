-- Exercicio 03: Use ROW_NUMBER() para numerar resultados.

SELECT p.nome_produto, p.preco,
ROW_NUMBER() OVER (ORDER BY p.preco) AS preco
FROM produtos p