-- 17. Mostre clientes que não estão em determinada cidade (NOT IN).

SELECT * FROM clients WHERE cidade NOT IN ('São Paulo', 'Rio de Janeiro');
