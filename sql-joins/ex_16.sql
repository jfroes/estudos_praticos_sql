-- Exercicio 16: Agrupe e conte pedidos por cidade.

SELECT c.cidade, COUNT(p.id) AS pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id