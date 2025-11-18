-- Insira e delete dados em transação (BEGIN, COMMIT, ROLLBACK).

BEGIN TRANSACTION;


INSERT INTO products (nome, preco, estoque)
VALUES ('Meia Vermelho Panetone', 29.99, 10);

INSERT INTO products (nome, preco, estoque)
VALUES ('Jaqueta Amarelo Couve', 799.99, 23);

SELECT * FROM  products;

ROLLBACK;

COMMIT
