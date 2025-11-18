# 📊 Estudos Práticos de SQL

[![SQL](https://img.shields.io/badge/SQL-100%25-blue.svg)](https://www.iso.org/standard/63555.html)
[![MySQL](https://img.shields.io/badge/MySQL-8.0+-orange.svg)](https://www.mysql.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-14+-blue.svg)](https://www.postgresql.org/)
[![Status](https://img.shields.io/badge/status-em%20andamento-green.svg)](https://github.com/jfroes/estudos_praticos_sql)

> Repositório dedicado ao aprendizado e prática de SQL através de exercícios progressivos, desde conceitos básicos até operações avançadas

## 📖 Sobre o Repositório

Este repositório documenta minha jornada de aprendizado em SQL, contendo exercícios práticos organizados por nível de complexidade e tópico. O objetivo é consolidar conhecimentos em bancos de dados relacionais através da prática constante e resolução de problemas reais.

## 📂 Estrutura do Repositório

```
estudos_praticos_sql/
│
├── 01-sql-basico-crud/          # Operações CREATE, READ, UPDATE, DELETE
├── 02-sql-filtros-e-ordenacao/  # WHERE, ORDER BY, LIMIT
├── 03-sql-joins/                # INNER, LEFT, RIGHT, FULL OUTER JOIN
├── 04-sql-group-by/             # Agregações e agrupamentos
├── 05-sql-subconsultas/         # Subqueries e queries aninhadas
└── 06-sql-funcoes-avancadas/    # Window functions, CTEs, procedures
```

## 🎯 Tópicos Abordados

### Fundamentos (Básico)
- ✅ **CRUD Operations** - INSERT, SELECT, UPDATE, DELETE
- ✅ **Filtros e Condições** - WHERE, AND, OR, NOT, IN, BETWEEN
- ✅ **Ordenação** - ORDER BY (ASC/DESC)
- ✅ **Limites e Paginação** - LIMIT, OFFSET
- ✅ **Funções de String** - CONCAT, SUBSTRING, UPPER, LOWER

### Intermediário
- ✅ **JOINs** - INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN
- ✅ **Agregações** - COUNT, SUM, AVG, MIN, MAX
- ✅ **GROUP BY e HAVING** - Agrupamentos e filtros em agregações
- ✅ **Subconsultas** - Subqueries em SELECT, FROM, WHERE
- 🔄 **Views** - Criação e utilização de views

### Avançado
- 🔄 **Window Functions** - ROW_NUMBER, RANK, DENSE_RANK
- 🔄 **CTEs** - Common Table Expressions (WITH clause)
- 🔄 **Transactions** - BEGIN, COMMIT, ROLLBACK
- 🔄 **Índices** - Criação e otimização de índices
- 🔄 **Stored Procedures** - Procedimentos armazenados

**Legenda:** ✅ Concluído | 🔄 Em andamento | ⏳ Planejado

## 💻 Exemplos de Queries

### Consulta Básica com Filtros
```sql
-- Buscar produtos com preço entre R$ 50 e R$ 200
SELECT 
    nome_produto,
    preco,
    categoria
FROM produtos
WHERE preco BETWEEN 50 AND 200
ORDER BY preco DESC;
```

### JOIN com Agregação
```sql
-- Total de vendas por categoria
SELECT 
    c.nome_categoria,
    COUNT(v.id_venda) AS total_vendas,
    SUM(v.valor_total) AS receita_total
FROM categorias c
INNER JOIN produtos p ON c.id_categoria = p.id_categoria
INNER JOIN vendas v ON p.id_produto = v.id_produto
GROUP BY c.nome_categoria
HAVING SUM(v.valor_total) > 1000
ORDER BY receita_total DESC;
```

### Subconsulta Correlacionada
```sql
-- Produtos com preço acima da média de sua categoria
SELECT 
    p.nome_produto,
    p.preco,
    c.nome_categoria
FROM produtos p
INNER JOIN categorias c ON p.id_categoria = c.id_categoria
WHERE p.preco > (
    SELECT AVG(p2.preco)
    FROM produtos p2
    WHERE p2.id_categoria = p.id_categoria
);
```

## 🛠️ Ferramentas Utilizadas

- **pgAdmin 4** - Interface gráfica para PostgreSQL
- 
## 📚 Bases de Dados de Estudo

Os exercícios utilizam bases de dados fictícias que simulam cenários reais:

1. **E-commerce** - Produtos, clientes, pedidos, categorias
2. **RH (Recursos Humanos)** - Funcionários, departamentos, salários

## 🚀 Como Usar Este Repositório

### 1. Clone o repositório
```bash
git clone https://github.com/jfroes/estudos_praticos_sql.git
cd estudos_praticos_sql
```

### 2. Configure seu ambiente
- Instale MySQL ou PostgreSQL
- Importe os scripts de criação das bases de dados (pasta `/setup`)
- Configure sua ferramenta de gerenciamento preferida

### 3. Execute os exercícios
- Navegue pelas pastas organizadas por tópico


## 📈 Progresso de Aprendizado

| Tópico | Exercícios | Concluídos | Status |
|--------|------------|------------|--------|
| CRUD Básico | 15 | 15 | ✅ |
| Filtros e Ordenação | 20 | 20 | ✅ |
| JOINs | 18 | 18 | ✅ |
| GROUP BY | 16 | 16 | ✅ |
| Subconsultas | 12 | 8 | 🔄 |
| Window Functions | 10 | 0 | ⏳ |


## 💡 Boas Práticas Aprendidas

1. **Nomenclatura Clara** - Use nomes descritivos para tabelas e colunas
2. **Indentação** - Mantenha queries legíveis e bem formatadas
3. **Comentários** - Documente queries complexas
4. **Performance** - Use índices apropriados e evite SELECT *
5. **Normalização** - Organize dados para evitar redundância
6. **Segurança** - Sempre use prepared statements para evitar SQL injection

## 🤝 Contribuições

Este é um repositório de estudos pessoais, mas sugestões e feedback são sempre bem-vindos! Sinta-se à vontade para:

- Sugerir novos exercícios
- Reportar erros nas soluções
- Compartilhar abordagens alternativas
- Indicar recursos de aprendizado

## 👨‍💻 Autor

**José Paulo Froes**

- GitHub: [@jfroes](https://github.com/jfroes)
- Email: josepaulo.froes@gmail.com
- LinkedIn: [José Paulo Froes](https://www.linkedin.com/in/josepaulofroes/)

## 📝 Licença

Este projeto é de código aberto e está disponível para fins educacionais.

---

## 🔗 Repositórios Relacionados

- [DSCommerce](https://github.com/jfroes/dscommerce) - API REST com Spring Boot e JPA

---

💾 **"Practice makes perfect. Query makes better!"** 

⭐ Se este repositório foi útil para você, considere dar uma estrela!
