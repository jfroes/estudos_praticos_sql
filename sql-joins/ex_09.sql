-- Exercicio 9: Mostre o total de pedidos por cliente.

SELECT c.nome, COUNT(p.id) as total_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.nome

