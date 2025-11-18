-- Exercicio 04: Conte produtos por fornecedor.

SELECT fornecedor.nome, COUNT(produto.id)
FROM fornecedores fornecedor
JOIN produtos produto ON fornecedor.id = produto.fornecedor_id
GROUP BY fornecedor.id