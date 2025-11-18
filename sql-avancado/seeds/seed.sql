-- Limpar tabelas existentes (se necessário)
DROP TABLE IF EXISTS auditoria_produtos CASCADE;
DROP TABLE IF EXISTS itens_pedido CASCADE;
DROP TABLE IF EXISTS pedidos CASCADE;
DROP TABLE IF EXISTS produtos CASCADE;
DROP TABLE IF EXISTS clientes CASCADE;
DROP TABLE IF EXISTS categorias CASCADE;
DROP TABLE IF EXISTS departamentos CASCADE;

-- Tabela de Categorias
CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- Tabela de Produtos
CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    nome_produto VARCHAR(200) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT DEFAULT 0,
    id_categoria INT REFERENCES categorias(id_categoria),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    cidade VARCHAR(100),
    estado VARCHAR(2),
    data_cadastro DATE DEFAULT CURRENT_DATE
);

-- Tabela de Pedidos
CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10, 2),
    status VARCHAR(50) DEFAULT 'pendente'
);

-- Tabela de Itens do Pedido
CREATE TABLE itens_pedido (
    id_item SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    id_produto INT REFERENCES produtos(id_produto),
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL
);

-- Tabela de Departamentos (para hierarquia recursiva)
CREATE TABLE departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nome_departamento VARCHAR(100) NOT NULL,
    id_departamento_pai INT REFERENCES departamentos(id_departamento)
);

-- Tabela de Auditoria (para trigger)
CREATE TABLE auditoria_produtos (
    id_auditoria SERIAL PRIMARY KEY,
    id_produto INT,
    acao VARCHAR(50),
    valor_antigo TEXT,
    valor_novo TEXT,
    data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR(100)
);

-- ===== INSERINDO DADOS =====

-- Categorias
INSERT INTO categorias (nome_categoria, descricao) VALUES
('Eletrônicos', 'Produtos eletrônicos e tecnologia'),
('Roupas', 'Vestuário em geral'),
('Livros', 'Livros físicos e digitais'),
('Alimentos', 'Produtos alimentícios'),
('Móveis', 'Móveis para casa e escritório'),
('Esportes', 'Artigos esportivos'),
('Brinquedos', 'Brinquedos infantis'),
('Beleza', 'Produtos de beleza e cosméticos');

-- Produtos (80 produtos para ter dados significativos)
INSERT INTO produtos (nome_produto, preco, estoque, id_categoria) VALUES
('Notebook Dell', 3500.00, 15, 1),
('Mouse Logitech', 85.00, 50, 1),
('Teclado Mecânico', 450.00, 30, 1),
('Monitor LG 24"', 899.00, 20, 1),
('Smartphone Samsung', 2200.00, 25, 1),
('Fone Bluetooth', 250.00, 40, 1),
('HD Externo 1TB', 350.00, 35, 1),
('Webcam Full HD', 280.00, 22, 1),
('Camiseta Polo', 89.90, 100, 2),
('Calça Jeans', 149.90, 80, 2),
('Jaqueta Couro', 599.00, 15, 2),
('Tênis Nike', 399.00, 45, 2),
('Vestido Social', 199.00, 30, 2),
('Shorts Esportivo', 79.90, 60, 2),
('Livro Clean Code', 89.00, 50, 3),
('Livro Domain Driven Design', 120.00, 30, 3),
('Livro O Programador Pragmático', 95.00, 40, 3),
('Livro Algoritmos', 110.00, 25, 3),
('Café Especial 500g', 35.00, 100, 4),
('Chocolate Belga', 25.00, 150, 4),
('Azeite Extra Virgem', 45.00, 80, 4),
('Mel Orgânico', 38.00, 60, 4),
('Sofá 3 Lugares', 1899.00, 8, 5),
('Mesa de Jantar', 1200.00, 10, 5),
('Cadeira Gamer', 899.00, 18, 5),
('Estante Livros', 450.00, 12, 5),
('Bola Futebol', 120.00, 40, 6),
('Raquete Tênis', 350.00, 20, 6),
('Halteres 5kg', 180.00, 25, 6),
('Bicicleta MTB', 1800.00, 7, 6),
('Boneca Barbie', 89.90, 45, 7),
('Lego Star Wars', 299.00, 30, 7),
('Carrinho Hot Wheels', 25.00, 100, 7),
('Quebra-cabeça 1000pç', 65.00, 35, 7),
('Perfume Importado', 320.00, 28, 8),
('Creme Facial', 89.00, 50, 8),
('Shampoo Premium', 45.00, 80, 8),
('Maquiagem Kit', 199.00, 35, 8),
('Tablet Samsung', 1500.00, 20, 1),
('Impressora HP', 650.00, 15, 1),
('SSD 500GB', 450.00, 40, 1),
('Placa de Vídeo RTX', 3500.00, 5, 1),
('Memória RAM 16GB', 380.00, 30, 1),
('Processador Intel i7', 2100.00, 12, 1),
('Moletom Capuz', 129.00, 55, 2),
('Bermuda Tactel', 69.90, 70, 2),
('Meia Kit 6 Pares', 39.90, 120, 2),
('Cinto Couro', 89.00, 45, 2),
('Livro Refactoring', 105.00, 28, 3),
('Livro Padrões de Projeto', 98.00, 32, 3),
('Arroz Integral 5kg', 28.00, 200, 4),
('Feijão Preto 1kg', 8.50, 180, 4),
('Macarrão Italiano', 12.00, 150, 4),
('Molho Tomate Premium', 18.00, 100, 4),
('Rack TV', 599.00, 14, 5),
('Guarda-roupa 6 Portas', 2200.00, 6, 5),
('Cama Box Casal', 1800.00, 9, 5),
('Colchão Ortopédico', 1500.00, 11, 5),
('Luvas Boxe', 199.00, 22, 6),
('Kimono Judô', 280.00, 15, 6),
('Patins Inline', 320.00, 18, 6),
('Skate Profissional', 450.00, 12, 6),
('Jogo Tabuleiro', 89.00, 40, 7),
('Pelúcia Urso', 55.00, 60, 7),
('Kit Massinha', 35.00, 85, 7),
('Boneco Ação Marvel', 120.00, 38, 7),
('Sérum Vitamina C', 125.00, 42, 8),
('Máscara Facial', 68.00, 55, 8),
('Batom Matte', 42.00, 90, 8),
('Esmalte Kit 10 Cores', 55.00, 48, 8),
('Mouse Pad Gamer', 65.00, 70, 1),
('Cabo HDMI 2m', 35.00, 95, 1),
('Adaptador USB-C', 45.00, 60, 1),
('Carregador Portátil', 120.00, 50, 1),
('Capa Chuva', 45.00, 65, 2),
('Boné Aba Reta', 59.90, 75, 2),
('Mochila Executiva', 189.00, 28, 2),
('Carteira Couro', 99.00, 52, 2);

-- Clientes (50 clientes)
INSERT INTO clientes (nome, email, cidade, estado, data_cadastro) VALUES
('João Silva', 'joao.silva@email.com', 'São Paulo', 'SP', '2024-01-15'),
('Maria Santos', 'maria.santos@email.com', 'Rio de Janeiro', 'RJ', '2024-02-20'),
('Pedro Oliveira', 'pedro.oliveira@email.com', 'Belo Horizonte', 'MG', '2024-03-10'),
('Ana Costa', 'ana.costa@email.com', 'Curitiba', 'PR', '2024-01-25'),
('Carlos Souza', 'carlos.souza@email.com', 'Porto Alegre', 'RS', '2024-04-05'),
('Juliana Lima', 'juliana.lima@email.com', 'Brasília', 'DF', '2024-02-15'),
('Fernando Alves', 'fernando.alves@email.com', 'Salvador', 'BA', '2024-03-20'),
('Patricia Rocha', 'patricia.rocha@email.com', 'Fortaleza', 'CE', '2024-01-30'),
('Roberto Dias', 'roberto.dias@email.com', 'Recife', 'PE', '2024-04-10'),
('Camila Ferreira', 'camila.ferreira@email.com', 'Manaus', 'AM', '2024-02-25'),
('Lucas Martins', 'lucas.martins@email.com', 'São Paulo', 'SP', '2024-03-15'),
('Fernanda Gomes', 'fernanda.gomes@email.com', 'Rio de Janeiro', 'RJ', '2024-01-20'),
('Ricardo Barbosa', 'ricardo.barbosa@email.com', 'Campinas', 'SP', '2024-04-15'),
('Aline Ribeiro', 'aline.ribeiro@email.com', 'Santos', 'SP', '2024-02-10'),
('Bruno Cardoso', 'bruno.cardoso@email.com', 'Niterói', 'RJ', '2024-03-25'),
('Carla Mendes', 'carla.mendes@email.com', 'Curitiba', 'PR', '2024-01-18'),
('Daniel Castro', 'daniel.castro@email.com', 'Florianópolis', 'SC', '2024-04-20'),
('Elaine Moura', 'elaine.moura@email.com', 'Vitória', 'ES', '2024-02-28'),
('Fabio Teixeira', 'fabio.teixeira@email.com', 'Goiânia', 'GO', '2024-03-08'),
('Gabriela Pinto', 'gabriela.pinto@email.com', 'São Luís', 'MA', '2024-01-12'),
('Henrique Borges', 'henrique.borges@email.com', 'Natal', 'RN', '2024-04-25'),
('Isabela Correia', 'isabela.correia@email.com', 'João Pessoa', 'PB', '2024-02-18'),
('José Araújo', 'jose.araujo@email.com', 'Aracaju', 'SE', '2024-03-22'),
('Karina Vieira', 'karina.vieira@email.com', 'Maceió', 'AL', '2024-01-28'),
('Leonardo Campos', 'leonardo.campos@email.com', 'Teresina', 'PI', '2024-04-08'),
('Márcia Monteiro', 'marcia.monteiro@email.com', 'Belém', 'PA', '2024-02-22'),
('Nelson Azevedo', 'nelson.azevedo@email.com', 'Porto Velho', 'RO', '2024-03-18'),
('Olivia Santana', 'olivia.santana@email.com', 'Boa Vista', 'RR', '2024-01-22'),
('Paulo Freitas', 'paulo.freitas@email.com', 'Palmas', 'TO', '2024-04-12'),
('Quezia Duarte', 'quezia.duarte@email.com', 'Macapá', 'AP', '2024-02-16'),
('Rodrigo Nogueira', 'rodrigo.nogueira@email.com', 'Rio Branco', 'AC', '2024-03-12'),
('Sabrina Cavalcanti', 'sabrina.cavalcanti@email.com', 'Cuiabá', 'MT', '2024-01-16'),
('Thiago Pereira', 'thiago.pereira@email.com', 'Campo Grande', 'MS', '2024-04-18'),
('Ursula Lopes', 'ursula.lopes@email.com', 'São Paulo', 'SP', '2024-02-12'),
('Vitor Ramos', 'vitor.ramos@email.com', 'Sorocaba', 'SP', '2024-03-28'),
('Wagner Silva', 'wagner.silva@email.com', 'Ribeirão Preto', 'SP', '2024-01-24'),
('Ximena Torres', 'ximena.torres@email.com', 'Uberlândia', 'MG', '2024-04-22'),
('Yuri Melo', 'yuri.melo@email.com', 'Contagem', 'MG', '2024-02-08'),
('Zilda Pacheco', 'zilda.pacheco@email.com', 'Juiz de Fora', 'MG', '2024-03-16'),
('Alberto Cunha', 'alberto.cunha@email.com', 'Londrina', 'PR', '2024-01-26'),
('Beatriz Fogaça', 'beatriz.fogaca@email.com', 'Maringá', 'PR', '2024-04-16'),
('Cesar Braga', 'cesar.braga@email.com', 'Cascavel', 'PR', '2024-02-24'),
('Daniela Xavier', 'daniela.xavier@email.com', 'Caxias do Sul', 'RS', '2024-03-14'),
('Eduardo Neves', 'eduardo.neves@email.com', 'Pelotas', 'RS', '2024-01-14'),
('Flávia Moreira', 'flavia.moreira@email.com', 'Canoas', 'RS', '2024-04-28'),
('Gustavo Barros', 'gustavo.barros@email.com', 'Joinville', 'SC', '2024-02-14'),
('Helena Farias', 'helena.farias@email.com', 'Blumenau', 'SC', '2024-03-26'),
('Igor Siqueira', 'igor.siqueira@email.com', 'São José', 'SC', '2024-01-08'),
('Julia Tavares', 'julia.tavares@email.com', 'Chapecó', 'SC', '2024-04-06'),
('Kevin Medeiros', 'kevin.medeiros@email.com', 'Vila Velha', 'ES', '2024-02-02');

-- Pedidos (150 pedidos distribuídos entre os clientes)
INSERT INTO pedidos (id_cliente, data_pedido, valor_total, status) VALUES
-- Cliente 1 - João Silva (10 pedidos)
(1, '2024-05-10 10:30:00', 3585.00, 'entregue'),
(1, '2024-06-15 14:20:00', 450.00, 'entregue'),
(1, '2024-07-20 09:15:00', 899.00, 'entregue'),
(1, '2024-08-25 16:45:00', 2200.00, 'entregue'),
(1, '2024-09-10 11:00:00', 250.00, 'em_transito'),
(1, '2024-10-05 13:30:00', 350.00, 'em_transito'),
(1, '2024-10-20 10:00:00', 280.00, 'processando'),
(1, '2024-11-01 15:20:00', 89.90, 'processando'),
(1, '2024-11-10 12:00:00', 149.90, 'pendente'),
(1, '2024-11-15 09:30:00', 599.00, 'pendente'),
-- Cliente 2 - Maria Santos (8 pedidos)
(2, '2024-05-12 11:00:00', 399.00, 'entregue'),
(2, '2024-06-18 13:45:00', 199.00, 'entregue'),
(2, '2024-07-22 10:30:00', 89.00, 'entregue'),
(2, '2024-08-28 15:00:00', 120.00, 'entregue'),
(2, '2024-09-15 12:20:00', 95.00, 'em_transito'),
(2, '2024-10-10 14:40:00', 110.00, 'em_transito'),
(2, '2024-11-05 11:15:00', 35.00, 'processando'),
(2, '2024-11-12 16:00:00', 25.00, 'pendente'),
-- Cliente 3 - Pedro Oliveira (7 pedidos)
(3, '2024-06-01 10:00:00', 1899.00, 'entregue'),
(3, '2024-07-10 14:30:00', 1200.00, 'entregue'),
(3, '2024-08-15 09:45:00', 899.00, 'entregue'),
(3, '2024-09-20 13:00:00', 450.00, 'em_transito'),
(3, '2024-10-15 11:30:00', 120.00, 'em_transito'),
(3, '2024-11-08 15:45:00', 350.00, 'processando'),
(3, '2024-11-14 10:20:00', 180.00, 'pendente'),
-- Cliente 4 - Ana Costa (6 pedidos)
(4, '2024-06-05 12:00:00', 1800.00, 'entregue'),
(4, '2024-07-15 15:30:00', 89.90, 'entregue'),
(4, '2024-08-20 10:15:00', 299.00, 'entregue'),
(4, '2024-09-25 14:45:00', 25.00, 'em_transito'),
(4, '2024-10-20 12:30:00', 65.00, 'processando'),
(4, '2024-11-11 16:15:00', 320.00, 'pendente'),
-- Cliente 5 - Carlos Souza (6 pedidos)
(5, '2024-06-08 11:30:00', 89.00, 'entregue'),
(5, '2024-07-18 14:00:00', 45.00, 'entregue'),
(5, '2024-08-22 09:30:00', 199.00, 'entregue'),
(5, '2024-09-28 13:20:00', 1500.00, 'em_transito'),
(5, '2024-10-25 11:45:00', 650.00, 'processando'),
(5, '2024-11-13 15:00:00', 450.00, 'pendente'),
-- Demais clientes (5 pedidos cada para clientes 6-15)
(6, '2024-06-10 10:45:00', 3500.00, 'entregue'),
(6, '2024-07-20 14:15:00', 450.00, 'entregue'),
(6, '2024-08-25 09:00:00', 380.00, 'entregue'),
(6, '2024-09-30 13:45:00', 2100.00, 'em_transito'),
(6, '2024-11-14 11:00:00', 129.00, 'pendente'),
(7, '2024-06-12 12:30:00', 69.90, 'entregue'),
(7, '2024-07-22 15:45:00', 39.90, 'entregue'),
(7, '2024-08-27 10:30:00', 89.00, 'entregue'),
(7, '2024-10-02 14:00:00', 105.00, 'em_transito'),
(7, '2024-11-15 12:15:00', 98.00, 'pendente'),
(8, '2024-06-15 11:15:00', 28.00, 'entregue'),
(8, '2024-07-25 13:30:00', 8.50, 'entregue'),
(8, '2024-08-30 09:45:00', 12.00, 'entregue'),
(8, '2024-10-05 12:00:00', 18.00, 'processando'),
(8, '2024-11-16 10:30:00', 599.00, 'pendente'),
(9, '2024-06-18 10:00:00', 2200.00, 'entregue'),
(9, '2024-07-28 14:45:00', 1800.00, 'entregue'),
(9, '2024-09-05 11:30:00', 1500.00, 'em_transito'),
(9, '2024-10-10 15:15:00', 199.00, 'processando'),
(9, '2024-11-16 13:00:00', 280.00, 'pendente'),
(10, '2024-06-20 12:45:00', 320.00, 'entregue'),
(10, '2024-07-30 16:00:00', 450.00, 'entregue'),
(10, '2024-09-08 10:15:00', 89.00, 'entregue'),
(10, '2024-10-15 13:30:00', 55.00, 'processando'),
(10, '2024-11-16 14:45:00', 35.00, 'pendente'),
-- 3 pedidos para clientes 11-20
(11, '2024-07-05 11:00:00', 120.00, 'entregue'),
(11, '2024-09-10 14:30:00', 125.00, 'em_transito'),
(11, '2024-11-10 10:00:00', 68.00, 'pendente'),
(12, '2024-07-08 13:15:00', 42.00, 'entregue'),
(12, '2024-09-15 15:45:00', 55.00, 'em_transito'),
(12, '2024-11-12 11:30:00', 65.00, 'pendente'),
(13, '2024-07-10 10:30:00', 35.00, 'entregue'),
(13, '2024-09-18 12:00:00', 45.00, 'processando'),
(13, '2024-11-13 09:15:00', 120.00, 'pendente'),
(14, '2024-07-12 14:00:00', 45.00, 'entregue'),
(14, '2024-09-20 16:30:00', 59.90, 'processando'),
(14, '2024-11-14 12:45:00', 189.00, 'pendente'),
(15, '2024-07-15 11:45:00', 99.00, 'entregue'),
(15, '2024-09-22 13:15:00', 3500.00, 'em_transito'),
(15, '2024-11-15 14:00:00', 85.00, 'pendente'),
(16, '2024-07-18 10:15:00', 450.00, 'entregue'),
(16, '2024-09-25 15:00:00', 899.00, 'processando'),
(16, '2024-11-16 10:45:00', 2200.00, 'pendente'),
(17, '2024-07-20 12:30:00', 250.00, 'entregue'),
(17, '2024-09-28 14:15:00', 350.00, 'processando'),
(17, '2024-11-16 13:30:00', 280.00, 'pendente'),
(18, '2024-07-22 13:45:00', 89.90, 'entregue'),
(18, '2024-10-01 11:00:00', 149.90, 'processando'),
(18, '2024-11-16 15:15:00', 599.00, 'pendente'),
(19, '2024-07-25 15:00:00', 399.00, 'entregue'),
(19, '2024-10-05 12:30:00', 199.00, 'em_transito'),
(19, '2024-11-17 09:00:00', 79.90, 'pendente'),
(20, '2024-07-28 10:30:00', 89.00, 'entregue'),
(20, '2024-10-08 14:45:00', 120.00, 'processando'),
(20, '2024-11-17 10:30:00', 95.00, 'pendente'),
-- 2 pedidos para clientes 21-30
(21, '2024-08-05 11:15:00', 110.00, 'entregue'),
(21, '2024-10-15 13:00:00', 35.00, 'em_transito'),
(22, '2024-08-08 12:45:00', 25.00, 'entregue'),
(22, '2024-10-18 15:30:00', 45.00, 'processando'),
(23, '2024-08-10 14:00:00', 1899.00, 'entregue'),
(23, '2024-10-20 10:15:00', 1200.00, 'processando'),
(24, '2024-08-12 09:30:00', 899.00, 'entregue'),
(24, '2024-10-22 11:45:00', 450.00, 'em_transito'),
(25, '2024-08-15 11:00:00', 120.00, 'entregue'),
(25, '2024-10-25 13:30:00', 350.00, 'processando'),
(26, '2024-08-18 13:15:00', 180.00, 'entregue'),
(26, '2024-10-28 15:00:00', 1800.00, 'em_transito'),
(27, '2024-08-20 10:45:00', 89.90, 'entregue'),
(27, '2024-11-01 12:15:00', 299.00, 'processando'),
(28, '2024-08-22 12:00:00', 25.00, 'entregue'),
(28, '2024-11-03 14:30:00', 65.00, 'pendente'),
(29, '2024-08-25 14:30:00', 320.00, 'entregue'),
(29, '2024-11-05 10:00:00', 89.00, 'pendente'),
(30, '2024-08-28 09:15:00', 45.00, 'entregue'),
(30, '2024-11-08 11:30:00', 199.00, 'pendente'),
-- 1 pedido para clientes 31-50
(31, '2024-09-01 10:30:00', 1500.00, 'entregue'),
(32, '2024-09-03 12:00:00', 650.00, 'entregue'),
(33, '2024-09-05 13:30:00', 450.00, 'entregue'),
(34, '2024-09-08 11:15:00', 3500.00, 'em_transito'),
(35, '2024-09-10 14:45:00', 450.00, 'em_transito'),
(36, '2024-09-12 10:00:00', 380.00, 'processando'),
(37, '2024-09-15 12:30:00', 2100.00, 'processando'),
(38, '2024-09-18 15:00:00', 129.00, 'pendente'),
(39, '2024-09-20 09:45:00', 69.90, 'pendente'),
(40, '2024-09-22 11:00:00', 39.90, 'pendente'),
(41, '2024-09-25 13:15:00', 89.00, 'pendente'),
(42, '2024-09-28 14:30:00', 105.00, 'pendente'),
(43, '2024-10-01 10:15:00', 98.00, 'pendente'),
(44, '2024-10-03 12:45:00', 28.00, 'pendente'),
(45, '2024-10-05 15:00:00', 8.50, 'pendente'),
(46, '2024-10-08 09:30:00', 12.00, 'pendente'),
(47, '2024-10-10 11:45:00', 18.00, 'pendente'),
(48, '2024-10-12 14:00:00', 599.00, 'pendente'),
(49, '2024-10-15 10:30:00', 2200.00, 'pendente'),
(50, '2024-10-18 13:00:00', 1800.00, 'pendente');

-- Itens de Pedido (detalhamento dos produtos em cada pedido)
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario, subtotal) VALUES
-- Pedido 1 (João Silva)
(1, 1, 1, 3500.00, 3500.00),
(1, 2, 1, 85.00, 85.00),
-- Pedido 2
(2, 3, 1, 450.00, 450.00),
-- Pedido 3
(3, 4, 1, 899.00, 899.00),
-- Pedido 4
(4, 5, 1, 2200.00, 2200.00),
-- Pedido 5
(5, 6, 1, 250.00, 250.00),
-- Pedido 6
(6, 7, 1, 350.00, 350.00),
-- Pedido 7
(7, 8, 1, 280.00, 280.00),
-- Pedido 8
(8, 9, 1, 89.90, 89.90),
-- Pedido 9
(9, 10, 1, 149.90, 149.90),
-- Pedido 10
(10, 11, 1, 599.00, 599.00),
-- Pedido 11 (Maria Santos)
(11, 12, 1, 399.00, 399.00),
-- Pedido 12
(12, 13, 1, 199.00, 199.00),
-- Pedido 13
(13, 15, 1, 89.00, 89.00),
-- Pedido 14
(14, 16, 1, 120.00, 120.00),
-- Pedido 15
(15, 17, 1, 95.00, 95.00),
-- Pedido 16
(16, 18, 1, 110.00, 110.00),
-- Pedido 17
(17, 19, 1, 35.00, 35.00),
-- Pedido 18
(18, 20, 1, 25.00, 25.00),
-- Pedido 19 (Pedro Oliveira)
(19, 23, 1, 1899.00, 1899.00),
-- Pedido 20
(20, 24, 1, 1200.00, 1200.00),
-- Pedido 21
(21, 25, 1, 899.00, 899.00),
-- Pedido 22
(22, 26, 1, 450.00, 450.00),
-- Pedido 23
(23, 27, 1, 120.00, 120.00),
-- Pedido 24
(24, 28, 1, 350.00, 350.00),
-- Pedido 25
(25, 29, 1, 180.00, 180.00),
-- Pedido 26 (Ana Costa)
(26, 30, 1, 1800.00, 1800.00),
-- Pedido 27
(27, 31, 1, 89.90, 89.90),
-- Pedido 28
(28, 32, 1, 299.00, 299.00),
-- Pedido 29
(29, 33, 1, 25.00, 25.00),
-- Pedido 30
(30, 34, 1, 65.00, 65.00),
-- Pedido 31
(31, 35, 1, 320.00, 320.00),
-- Pedido 32 (Carlos Souza)
(32, 36, 1, 89.00, 89.00),
-- Pedido 33
(33, 37, 1, 45.00, 45.00),
-- Pedido 34
(34, 38, 1, 199.00, 199.00),
-- Pedido 35
(35, 39, 1, 1500.00, 1500.00),
-- Pedido 36
(36, 40, 1, 650.00, 650.00),
-- Pedido 37
(37, 41, 1, 450.00, 450.00),
-- Pedido 38 (Juliana Lima)
(38, 42, 1, 3500.00, 3500.00),
-- Pedido 39
(39, 3, 1, 450.00, 450.00),
-- Pedido 40
(40, 43, 1, 380.00, 380.00),
-- Pedido 41
(41, 44, 1, 2100.00, 2100.00),
-- Pedido 42
(42, 45, 1, 129.00, 129.00),
-- Pedido 43 (Fernando Alves)
(43, 46, 1, 69.90, 69.90),
-- Pedido 44
(44, 47, 1, 39.90, 39.90),
-- Pedido 45
(45, 48, 1, 89.00, 89.00),
-- Pedido 46
(46, 49, 1, 105.00, 105.00),
-- Pedido 47
(47, 50, 1, 98.00, 98.00),
-- Pedido 48 (Patricia Rocha)
(48, 51, 1, 28.00, 28.00),
-- Pedido 49
(49, 52, 1, 8.50, 8.50),
-- Pedido 50
(50, 53, 1, 12.00, 12.00),
-- Pedido 51
(51, 54, 1, 18.00, 18.00),
-- Pedido 52
(52, 55, 1, 599.00, 599.00),
-- Pedido 53 (Roberto Dias)
(53, 56, 1, 2200.00, 2200.00),
-- Pedido 54
(54, 57, 1, 1800.00, 1800.00),
-- Pedido 55
(55, 58, 1, 1500.00, 1500.00),
-- Pedido 56
(56, 59, 1, 199.00, 199.00),
-- Pedido 57
(57, 8, 1, 280.00, 280.00),
-- Pedido 58 (Camila Ferreira)
(58, 60, 1, 320.00, 320.00),
-- Pedido 59
(59, 61, 1, 450.00, 450.00),
-- Pedido 60
(60, 62, 1, 89.00, 89.00),
-- Pedido 61
(61, 63, 1, 55.00, 55.00),
-- Pedido 62
(62, 64, 1, 35.00, 35.00),
-- Pedidos 63-68 (Lucas Martins)
(63, 65, 1, 120.00, 120.00),
(64, 66, 1, 125.00, 125.00),
(65, 67, 1, 68.00, 68.00),
-- Pedidos 66-68 (Fernanda Gomes)
(66, 68, 1, 42.00, 42.00),
(67, 69, 1, 55.00, 55.00),
(68, 70, 1, 65.00, 65.00),
-- Pedidos 69-71 (Ricardo Barbosa)
(69, 71, 1, 35.00, 35.00),
(70, 72, 1, 45.00, 45.00),
(71, 73, 1, 120.00, 120.00),
-- Pedidos 72-74 (Aline Ribeiro)
(72, 74, 1, 45.00, 45.00),
(73, 75, 1, 59.90, 59.90),
(74, 76, 1, 189.00, 189.00),
-- Pedidos 75-77 (Bruno Cardoso)
(75, 77, 1, 99.00, 99.00),
(76, 42, 1, 3500.00, 3500.00),
(77, 2, 1, 85.00, 85.00),
-- Pedidos 78-80 (Carla Mendes)
(78, 3, 1, 450.00, 450.00),
(79, 4, 1, 899.00, 899.00),
(80, 5, 1, 2200.00, 2200.00),
-- Pedidos 81-83 (Daniel Castro)
(81, 6, 1, 250.00, 250.00),
(82, 7, 1, 350.00, 350.00),
(83, 8, 1, 280.00, 280.00),
-- Pedidos 84-86 (Elaine Moura)
(84, 9, 1, 89.90, 89.90),
(85, 10, 1, 149.90, 149.90),
(86, 11, 1, 599.00, 599.00),
-- Pedidos 87-89 (Fabio Teixeira)
(87, 12, 1, 399.00, 399.00),
(88, 13, 1, 199.00, 199.00),
(89, 14, 1, 79.90, 79.90),
-- Pedidos 90-92 (Gabriela Pinto)
(90, 15, 1, 89.00, 89.00),
(91, 16, 1, 120.00, 120.00),
(92, 17, 1, 95.00, 95.00),
-- Pedidos 93-94 (Henrique Borges)
(93, 18, 1, 110.00, 110.00),
(94, 19, 1, 35.00, 35.00),
-- Pedidos 95-96 (Isabela Correia)
(95, 20, 1, 25.00, 25.00),
(96, 21, 1, 45.00, 45.00),
-- Pedidos 97-98 (José Araújo)
(97, 23, 1, 1899.00, 1899.00),
(98, 24, 1, 1200.00, 1200.00),
-- Pedidos 99-100 (Karina Vieira)
(99, 25, 1, 899.00, 899.00),
(100, 26, 1, 450.00, 450.00),
-- Pedidos 101-102 (Leonardo Campos)
(101, 27, 1, 120.00, 120.00),
(102, 28, 1, 350.00, 350.00),
-- Pedidos 103-104 (Márcia Monteiro)
(103, 29, 1, 180.00, 180.00),
(104, 30, 1, 1800.00, 1800.00),
-- Pedidos 105-106 (Nelson Azevedo)
(105, 31, 1, 89.90, 89.90),
(106, 32, 1, 299.00, 299.00),
-- Pedidos 107-108 (Olivia Santana)
(107, 33, 1, 25.00, 25.00),
(108, 34, 1, 65.00, 65.00),
-- Pedidos 109-110 (Paulo Freitas)
(109, 35, 1, 320.00, 320.00),
(110, 36, 1, 89.00, 89.00),
-- Pedidos 111-112 (Quezia Duarte)
(111, 37, 1, 45.00, 45.00),
(112, 38, 1, 199.00, 199.00),
-- Pedidos 113-130 (demais clientes)
(113, 39, 1, 1500.00, 1500.00),
(114, 40, 1, 650.00, 650.00),
(115, 41, 1, 450.00, 450.00),
(116, 42, 1, 3500.00, 3500.00),
(117, 3, 1, 450.00, 450.00),
(118, 43, 1, 380.00, 380.00),
(119, 44, 1, 2100.00, 2100.00),
(120, 45, 1, 129.00, 129.00),
(121, 46, 1, 69.90, 69.90),
(122, 47, 1, 39.90, 39.90),
(123, 48, 1, 89.00, 89.00),
(124, 49, 1, 105.00, 105.00),
(125, 50, 1, 98.00, 98.00),
(126, 51, 1, 28.00, 28.00),
(127, 52, 1, 8.50, 8.50),
(128, 53, 1, 12.00, 12.00),
(129, 54, 1, 18.00, 18.00),
(130, 55, 1, 599.00, 599.00),
(131, 56, 1, 2200.00, 2200.00),
(132, 57, 1, 1800.00, 1800.00),
-- Adicionando mais itens para tornar alguns pedidos com múltiplos produtos
(1, 70, 1, 65.00, 65.00),
(3, 2, 2, 85.00, 170.00),
(5, 71, 1, 35.00, 35.00),
(10, 20, 2, 25.00, 50.00),
(15, 19, 3, 35.00, 105.00),
(20, 51, 5, 28.00, 140.00),
(25, 33, 10, 25.00, 250.00),
(30, 20, 4, 25.00, 100.00),
(35, 41, 2, 450.00, 900.00),
(40, 2, 3, 85.00, 255.00),
(45, 47, 5, 39.90, 199.50),
(50, 52, 20, 8.50, 170.00),
(55, 58, 2, 1500.00, 3000.00),
(60, 63, 3, 55.00, 165.00),
(65, 67, 2, 68.00, 136.00),
(70, 72, 4, 45.00, 180.00),
(75, 77, 3, 99.00, 297.00),
(80, 5, 2, 2200.00, 4400.00),
(85, 10, 3, 149.90, 449.70),
(90, 15, 2, 89.00, 178.00);

-- Departamentos (hierarquia para WITH RECURSIVE)
INSERT INTO departamentos (nome_departamento, id_departamento_pai) VALUES
('Diretoria', NULL),
('TI', 1),
('Vendas', 1),
('Marketing', 1),
('RH', 1),
('Desenvolvimento', 2),
('Infraestrutura', 2),
('Suporte', 2),
('Vendas Online', 3),
('Vendas Corporativas', 3),
('Mídias Sociais', 4),
('SEO', 4),
('Recrutamento', 5),
('Treinamento', 5),
('Frontend', 6),
('Backend', 6),
('Mobile', 6),
('DevOps', 6),
('Redes', 7),
('Servidores', 7);

-- Verificação final
SELECT 'Categorias' as tabela, COUNT(*) as total FROM categorias
UNION ALL
SELECT 'Produtos', COUNT(*) FROM produtos
UNION ALL
SELECT 'Clientes', COUNT(*) FROM clientes
UNION ALL
SELECT 'Pedidos', COUNT(*) FROM pedidos
UNION ALL
SELECT 'Itens Pedido', COUNT(*) FROM itens_pedido
UNION ALL
SELECT 'Departamentos', COUNT(*) FROM departamentos;

-- Mensagem final
SELECT 'Seeds criados com sucesso! Tabelas prontas para os exercícios.' as mensagem;