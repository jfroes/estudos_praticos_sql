-- ================================
-- TABELA PEDIDOS
-- ================================
CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    produto_id INT,
    valor DECIMAL(10,2),
    data_pedido DATE,
    status VARCHAR(20),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
