-- Exercicio 07: Total de vendas por mês.

SELECT TO_CHAR(pedido.data_pedido, 'YYYY-MM') AS mes_ano, SUM(pedido.valor_total)
FROM pedidos pedido
GROUP BY mes_ano ORDER BY mes_ano