-- Exercicio 14: Mostre pedidos e status (pago, pendente, cancelado) com CASE WHEN.

SELECT p.*,
    CASE 
		WHEN p.status = 'pago' THEN 'Aguardando Transportadora'
		WHEN p.status = 'pendente' THEN 'pedido em revisão'
		ELSE 'cancelado'
    END AS status
FROM pedidos p