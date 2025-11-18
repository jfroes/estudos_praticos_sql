-- Exercicio 15: Faça JOIN filtrando por data.

SELECT c.nome , p.valor, p.data_pedido
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
ORDER BY p.data_pedido DESC;