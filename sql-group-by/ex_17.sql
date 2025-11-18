-- Exercicio 17: Calcule o faturamento total e por cidade.

SELECT cidade.nome AS cidade, ROUND(SUM(pedido.valor_total), 2) as faturamento_total
FROM clientes cliente
JOIN pedidos pedido ON cliente.id = pedido.cliente_id
JOIN cidades cidade ON cliente.cidade_id = cidade.id 
GROUP BY cidade.nome
ORDER BY cidade.nome ASC
