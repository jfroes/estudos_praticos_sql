-- Exercicio 11: Quantos pedidos cada vendedor tem.

SELECT vendedor.nome, SUM(pedido.id) total_de_vendas
FROM vendedores vendedor
JOIN pedidos pedido ON vendedor.id = pedido.vendedor_id
GROUP BY  vendedor.id