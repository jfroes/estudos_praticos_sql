-- Exercicio 12: Agrupe e ordene resultados.

SELECT vendedor.nome, SUM(pedido.id) total_de_vendas
FROM vendedores vendedor
JOIN pedidos pedido ON vendedor.id = pedido.vendedor_id
GROUP BY  vendedor.id ORDER BY vendedor.nome ASC