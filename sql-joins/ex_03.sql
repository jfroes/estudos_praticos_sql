-- Exercicio 03: Mostre clientes que não têm pedidos

SELECT c.nome, p.id AS id_pedido
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
WHERE p.cliente_id IS NULL