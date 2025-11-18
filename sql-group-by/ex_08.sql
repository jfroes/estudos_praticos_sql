-- Exercicio 08: Média de idade por cidade.

SELECT cidade.nome, FLOOR(AVG(cliente.idade))
FROM cidades cidade
JOIN clientes cliente ON cidade.id = cliente.cidade_id
GROUP BY cidade.id