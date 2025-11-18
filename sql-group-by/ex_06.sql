-- Exercicio 06: Agrupe clientes por estado.

SELECT cliente.nome, estado.nome AS estado, estado.sigla
FROM estados estado
JOIN cidades cidade ON estado.id = cidade.estado_id
JOIN clientes cliente ON cidade.id = cliente.cidade_id
ORDER BY estado.nome ASC