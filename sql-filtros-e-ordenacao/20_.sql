-- 20. Crie filtros compostos (AND + OR).

SELECT * FROM clients WHERE LOWER(name) LIKE LOWER('%SILVA%')
AND LOWER(cidade) = LOWER('São Paulo') OR LOWER(cidade) = LOWER('Rio de Janeiro');
