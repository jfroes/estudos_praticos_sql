-- Exercicio 13: Use funções COUNT, SUM, AVG juntas.

SELECT vendedor.nome, SUM(pedido.id) AS total_de_vendas
FROM vendedores vendedor
JOIN pedidos pedido ON vendedor.id = pedido.vendedor_id
GROUP BY  vendedor.id 
HAVING SUM(pedido.id) >= 100
ORDER BY vendedor.nome ASC;
