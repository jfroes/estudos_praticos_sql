-- ================================
-- TABELA FUNCIONARIOS (SELF JOIN)
-- ================================
CREATE TABLE funcionarios (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    chefe_id INT NULL
);