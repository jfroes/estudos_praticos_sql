-- Exercicio 18: Agrupe pedidos por ano.

SELECT TO_CHAR(pedidos.data_pedido, 'YYYY') AS ano, COUNT(pedidos.id)
FROM pedidos
GROUP BY TO_CHAR(pedidos.data_pedido, 'YYYY')
ORDER BY TO_CHAR(pedidos.data_pedido, 'YYYY') ASC