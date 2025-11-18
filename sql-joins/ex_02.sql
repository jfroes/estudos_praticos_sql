-- Exercicio 02: Liste todos os pedidos e nomes de clientes (INNER JOIN).

SELECT clientes.nome, COUNT(pedidos) AS tota_pedidos
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.id
GROUP BY  clientes.nome