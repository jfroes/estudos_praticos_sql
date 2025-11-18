-- Exercicio 01: Conte clientes por cidade.

SELECT cidade.nome, COUNT(cliente.id)
FROM cidades cidade
JOIN clientes cliente ON cidade.id = cliente.cidade_id
GROUP BY cidade.id