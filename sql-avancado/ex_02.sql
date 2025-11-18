-- Exercicio 02: Use RANK() para ranquear produtos por preço.

SELECT p.nome_produto, p.preco, 
DENSE_RANK() OVER (ORDER BY p.preco DESC) AS rank_preco
FROM produtos p;