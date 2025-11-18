-- CRIAR TABELAS ANTES


-- CLIENTES
INSERT INTO clientes (id, nome, cidade) VALUES
(1, 'Ana', 'São Paulo'),
(2, 'Bruno', 'Rio de Janeiro'),
(3, 'Carlos', 'Belo Horizonte'),
(4, 'Diana', 'São Paulo'),
(5, 'Eduardo', 'Curitiba'); -- sem pedidos

-- ENDERECOS
INSERT INTO enderecos (id, cliente_id, rua, cidade) VALUES
(1, 1, 'Rua A, 100', 'São Paulo'),
(2, 2, 'Rua B, 200', 'Rio de Janeiro'),
(3, 3, 'Rua C, 300', 'Belo Horizonte'),
(4, 4, 'Rua D, 400', 'São Paulo');

-- CATEGORIAS
INSERT INTO categorias (id, nome) VALUES
(1, 'Eletrônicos'),
(2, 'Roupas'),
(3, 'Livros');

-- PRODUTOS
INSERT INTO produtos (id, nome, categoria_id) VALUES
(1, 'Notebook', 1),
(2, 'Camiseta', 2),
(3, 'Livro SQL', 3),
(4, 'Mouse', NULL);  -- categoria nula para LEFT JOIN

-- PEDIDOS
INSERT INTO pedidos (id, cliente_id, produto_id, valor, data_pedido, status) VALUES
(1, 1, 1, 3500.00, '2025-01-10', 'pago'),
(2, 1, 2,  80.00,  '2025-01-11', 'pendente'),
(3, 2, 3, 120.00,  '2025-01-13', 'pago'),
(4, 3, NULL, 250.00, '2025-01-14', 'cancelado'), -- pedido sem produto
(5, NULL, 1, 3500.00, '2025-01-15', 'pago');     -- pedido sem cliente (RIGHT JOIN)

-- FUNCIONARIOS (SELF JOIN)
INSERT INTO funcionarios (id, nome, chefe_id) VALUES
(1, 'Marcos', NULL),
(2, 'Julia', 1),
(3, 'Renato', 1),
(4, 'Fernanda', 2),
(5, 'Paulo', 3);
