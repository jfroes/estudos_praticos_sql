-- ============================================
-- CRIAÇÃO DAS TABELAS
-- ============================================

-- Tabela de Estados
CREATE TABLE estados (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    sigla VARCHAR(2)
);

-- Tabela de Cidades
CREATE TABLE cidades (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    estado_id INT,
    FOREIGN KEY (estado_id) REFERENCES estados(id)
);

-- Tabela de Clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    cidade_id INT,
    FOREIGN KEY (cidade_id) REFERENCES cidades(id)
);

-- Tabela de Fornecedores
CREATE TABLE fornecedores (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade_id INT,
    FOREIGN KEY (cidade_id) REFERENCES cidades(id)
);

-- Tabela de Categorias
CREATE TABLE categorias (
    id INT PRIMARY KEY,
    nome VARCHAR(50)
);

-- Tabela de Produtos
CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2),
    estoque INT,
    categoria_id INT,
    fornecedor_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id),
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(id)
);

-- Tabela de Vendedores
CREATE TABLE vendedores (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade_id INT,
    FOREIGN KEY (cidade_id) REFERENCES cidades(id)
);

-- Tabela de Pedidos
CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    vendedor_id INT,
    data_pedido DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (vendedor_id) REFERENCES vendedores(id)
);

-- Tabela de Itens do Pedido
CREATE TABLE itens_pedido (
    id INT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- ============================================
-- INSERÇÃO DOS DADOS
-- ============================================

-- Estados
INSERT INTO estados (id, nome, sigla) VALUES
(1, 'São Paulo', 'SP'),
(2, 'Rio de Janeiro', 'RJ'),
(3, 'Minas Gerais', 'MG'),
(4, 'Paraná', 'PR'),
(5, 'Bahia', 'BA');

-- Cidades
INSERT INTO cidades (id, nome, estado_id) VALUES
(1, 'São Paulo', 1),
(2, 'Campinas', 1),
(3, 'Santos', 1),
(4, 'Rio de Janeiro', 2),
(5, 'Niterói', 2),
(6, 'Belo Horizonte', 3),
(7, 'Uberlândia', 3),
(8, 'Curitiba', 4),
(9, 'Salvador', 5);

-- Clientes
INSERT INTO clientes (id, nome, idade, cidade_id) VALUES
(1, 'João Silva', 28, 1),
(2, 'Maria Santos', 35, 1),
(3, 'Pedro Oliveira', 42, 2),
(4, 'Ana Costa', 31, 3),
(5, 'Carlos Souza', 45, 4),
(6, 'Juliana Lima', 29, 4),
(7, 'Roberto Alves', 38, 5),
(8, 'Fernanda Rocha', 26, 6),
(9, 'Lucas Martins', 33, 6),
(10, 'Patrícia Dias', 40, 7),
(11, 'Rafael Cardoso', 27, 8),
(12, 'Camila Ferreira', 36, 9),
(13, 'Bruno Gomes', 44, 1),
(14, 'Aline Ribeiro', 30, 2),
(15, 'Thiago Barbosa', 34, 3);

-- Fornecedores
INSERT INTO fornecedores (id, nome, cidade_id) VALUES
(1, 'TechSupply Ltda', 1),
(2, 'InfoParts SA', 4),
(3, 'MegaDistribuidora', 6),
(4, 'Global Imports', 1),
(5, 'Nacional Produtos', 8);

-- Categorias
INSERT INTO categorias (id, nome) VALUES
(1, 'Eletrônicos'),
(2, 'Informática'),
(3, 'Móveis'),
(4, 'Eletrodomésticos'),
(5, 'Esportes'),
(6, 'Livros');

-- Produtos
INSERT INTO produtos (id, nome, preco, estoque, categoria_id, fornecedor_id) VALUES
(1, 'Notebook Dell', 3500.00, 15, 2, 1),
(2, 'Mouse Logitech', 45.00, 100, 2, 1),
(3, 'Teclado Mecânico', 250.00, 50, 2, 2),
(4, 'Monitor LG 24"', 800.00, 30, 1, 1),
(5, 'Cadeira Gamer', 1200.00, 20, 3, 3),
(6, 'Mesa Escritório', 650.00, 25, 3, 3),
(7, 'Smartphone Samsung', 2200.00, 40, 1, 4),
(8, 'Fone Bluetooth', 180.00, 75, 1, 2),
(9, 'Geladeira Brastemp', 2800.00, 12, 4, 5),
(10, 'Micro-ondas', 450.00, 35, 4, 5),
(11, 'Liquidificador', 120.00, 60, 4, 5),
(12, 'Bicicleta MTB', 1800.00, 18, 5, 3),
(13, 'Tênis Corrida', 320.00, 45, 5, 4),
(14, 'Livro Python Básico', 85.00, 90, 6, 2),
(15, 'Livro SQL Avançado', 95.00, 70, 6, 2),
(16, 'Webcam HD', 280.00, 55, 2, 1),
(17, 'Impressora HP', 950.00, 22, 2, 1),
(18, 'Tablet Samsung', 1500.00, 28, 1, 4),
(19, 'Smart TV 50"', 2400.00, 15, 1, 4),
(20, 'Estante Madeira', 580.00, 30, 3, 3);

-- Vendedores
INSERT INTO vendedores (id, nome, cidade_id) VALUES
(1, 'André Vendas', 1),
(2, 'Carla Comercial', 4),
(3, 'Diego Negócios', 6),
(4, 'Eliane Vendas', 1),
(5, 'Fábio Comercial', 8);

-- Pedidos
INSERT INTO pedidos (id, cliente_id, vendedor_id, data_pedido, valor_total) VALUES
(1, 1, 1, '2023-01-15', 3545.00),
(2, 2, 1, '2023-01-20', 1200.00),
(3, 3, 2, '2023-02-10', 800.00),
(4, 1, 1, '2023-02-14', 250.00),
(5, 4, 2, '2023-03-05', 2200.00),
(6, 5, 2, '2023-03-12', 2800.00),
(7, 6, 2, '2023-04-08', 180.00),
(8, 7, 3, '2023-04-22', 650.00),
(9, 8, 3, '2023-05-03', 450.00),
(10, 1, 1, '2023-05-18', 280.00),
(11, 9, 3, '2023-06-07', 1800.00),
(12, 10, 4, '2023-06-25', 320.00),
(13, 11, 5, '2023-07-11', 85.00),
(14, 12, 5, '2023-07-19', 2400.00),
(15, 13, 1, '2023-08-02', 950.00),
(16, 14, 2, '2023-08-16', 1500.00),
(17, 2, 1, '2023-09-05', 580.00),
(18, 15, 4, '2023-09-21', 3500.00),
(19, 3, 2, '2023-10-10', 95.00),
(20, 5, 2, '2023-10-28', 120.00),
(21, 6, 2, '2023-11-14', 280.00),
(22, 8, 3, '2023-11-30', 1200.00),
(23, 4, 2, '2023-12-08', 800.00),
(24, 9, 3, '2023-12-20', 2200.00),
(25, 1, 1, '2024-01-10', 180.00),
(26, 7, 3, '2024-01-25', 450.00),
(27, 10, 4, '2024-02-12', 1800.00),
(28, 13, 1, '2024-02-28', 320.00),
(29, 15, 4, '2024-03-15', 2800.00),
(30, 11, 5, '2024-03-30', 650.00);

-- Itens do Pedido
INSERT INTO itens_pedido (id, pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 1, 3500.00),
(2, 1, 2, 1, 45.00),
(3, 2, 5, 1, 1200.00),
(4, 3, 4, 1, 800.00),
(5, 4, 3, 1, 250.00),
(6, 5, 7, 1, 2200.00),
(7, 6, 9, 1, 2800.00),
(8, 7, 8, 1, 180.00),
(9, 8, 6, 1, 650.00),
(10, 9, 10, 1, 450.00),
(11, 10, 16, 1, 280.00),
(12, 11, 12, 1, 1800.00),
(13, 12, 13, 1, 320.00),
(14, 13, 14, 1, 85.00),
(15, 14, 19, 1, 2400.00),
(16, 15, 17, 1, 950.00),
(17, 16, 18, 1, 1500.00),
(18, 17, 20, 1, 580.00),
(19, 18, 1, 1, 3500.00),
(20, 19, 15, 1, 95.00),
(21, 20, 11, 1, 120.00),
(22, 21, 16, 1, 280.00),
(23, 22, 5, 1, 1200.00),
(24, 23, 4, 1, 800.00),
(25, 24, 7, 1, 2200.00),
(26, 25, 8, 1, 180.00),
(27, 26, 10, 1, 450.00),
(28, 27, 12, 1, 1800.00),
(29, 28, 13, 1, 320.00),
(30, 29, 9, 1, 2800.00),
(31, 30, 6, 1, 650.00);

-- ============================================
-- VERIFICAÇÃO DOS DADOS
-- ============================================

-- Verificar quantidades inseridas
SELECT 'Estados' AS tabela, COUNT(*) AS total FROM estados
UNION ALL
SELECT 'Cidades', COUNT(*) FROM cidades
UNION ALL
SELECT 'Clientes', COUNT(*) FROM clientes
UNION ALL
SELECT 'Fornecedores', COUNT(*) FROM fornecedores
UNION ALL
SELECT 'Categorias', COUNT(*) FROM categorias
UNION ALL
SELECT 'Produtos', COUNT(*) FROM produtos
UNION ALL
SELECT 'Vendedores', COUNT(*) FROM vendedores
UNION ALL
SELECT 'Pedidos', COUNT(*) FROM pedidos
UNION ALL
SELECT 'Itens Pedido', COUNT(*) FROM itens_pedido;