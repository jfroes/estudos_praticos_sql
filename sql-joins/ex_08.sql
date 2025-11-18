-- Exercicio 8: Liste apenas clientes com mais de 1 pedido.

SELECT c.nome, COUNT(p.id)
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.nome
HAVING COUNT(p.id) >1
