-- Exercicio 20: Crie uma view que junta clientes e pedidos.

CREATE VIEW clientes_pedidos AS
SELECT c.nome AS cliente, p.id AS id_pedido, p.valor
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id

SELECT * FROM clientes_pedidos