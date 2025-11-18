-- Exercicio 04: Crie uma função SQL simples.

CREATE OR REPLACE FUNCTION calcula_preco_medio(preco NUMERIC)
RETURNS NUMERIC AS $$
BEGIN
	RETURN ROUND(AVG(preco), 2);
END;
$$ LANGUAGE plpgsql;

SELECT p.nome_produto, calcula_preco_medio(p.preco) AS preco_medio
FROM produtos p;