-- Exclua todos os produtos com estoque zero.

DELETE FROM products WHERE estoque = 0;