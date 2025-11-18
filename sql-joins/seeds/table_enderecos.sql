-- ================================
-- TABELA ENDERECOS (JOIN com clientes)
-- ================================
CREATE TABLE enderecos (
    id INT PRIMARY KEY,
    cliente_id INT,
    rua VARCHAR(150),
    cidade VARCHAR(100),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
