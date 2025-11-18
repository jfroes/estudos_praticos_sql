-- Exercicio 19: Mostre nome do cliente e total gasto.

SELECT c.nome AS cliente, SUM(p.valor) AS total
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.nome
