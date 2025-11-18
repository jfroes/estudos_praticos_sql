-- Exercicio 11: Faça SELF JOIN em uma tabela funcionarios (chefe/subordinado).

SELECT f1.nome AS subordinado, f2.nome AS chefe
FROM funcionarios f1
JOIN  funcionarios f2 ON f1.chefe_id = f2.id;