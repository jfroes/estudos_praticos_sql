-- Exercicio 12: Use ON e USING e compare os resultados.


SELECT c.nome, p.valor
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id

SELECT c.nome, p.valor
FROM clientes c
INNER JOIN pedidos p USING (id);