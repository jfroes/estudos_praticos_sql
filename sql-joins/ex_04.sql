-- Exercicio 4: Liste todos os pedidos, mesmo sem cliente

SELECT c.nome, p.id AS id_pedido
FROM clientes c
RIGHT JOIN pedidos p ON c.id = p.cliente_id
