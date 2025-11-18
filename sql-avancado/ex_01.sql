-- Exercicio 01: Crie uma CTE para listar os 5 clientes com mais pedidos.

WITH top5_clientes_mais_pedidos AS (
	SELECT id_cliente, COUNT (*) AS total_pedidos
	FROM pedidos
	GROUP BY id_cliente
	ORDER BY total_pedidos DESC LIMIT 5
)

SELECT * FROM top5_clientes_mais_pedidos