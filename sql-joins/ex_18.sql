-- Exercicio 18: Faça JOIN entre clientes e enderecos.

SELECT c.nome AS cliente, e.rua, e.cidade
FROM clientes c
JOIN enderecos e ON c.id = e.cliente_id;