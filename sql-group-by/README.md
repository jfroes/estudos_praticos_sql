# SQL GROUP BY - Exercícios Práticos 📊

Repositório com exercícios práticos de SQL focados em operações de **GROUP BY**, agregações e análise de dados.

## 📋 Sobre o Projeto

Este repositório contém 20 exercícios progressivos de SQL que cobrem desde agrupamentos básicos até consultas complexas combinando GROUP BY, HAVING, JOIN e funções de agregação.

## 🎯 Objetivos de Aprendizado

- Dominar cláusula GROUP BY
- Utilizar funções de agregação (COUNT, SUM, AVG, MAX, MIN)
- Aplicar filtros com HAVING
- Combinar GROUP BY com JOINs
- Realizar análises temporais (por mês, ano)
- Ordenar e filtrar resultados agregados

## 🗄️ Estrutura do Banco de Dados

O banco de dados simula um sistema de e-commerce com as seguintes tabelas:

- **estados** - Estados brasileiros
- **cidades** - Cidades e seus estados
- **clientes** - Clientes com idade e localização
- **fornecedores** - Fornecedores dos produtos
- **categorias** - Categorias de produtos
- **produtos** - Produtos com preço, estoque e relações
- **vendedores** - Vendedores responsáveis pelos pedidos
- **pedidos** - Pedidos realizados (2023-2024)
- **itens_pedido** - Itens de cada pedido

### Diagrama de Relacionamentos

```
estados (1) ─── (N) cidades
                      │
      ┌───────────────┼───────────────┐
      │               │               │
   clientes      fornecedores    vendedores
      │               │               │
      │          produtos (N)         │
      │               │               │
      └──── pedidos ──┴───────────────┘
               │
          itens_pedido
```


## 📝 Lista de Exercícios

### Nível Básico (1-7)
1. Conte clientes por cidade
2. Some total de pedidos por cliente
3. Média de preço por categoria
4. Conte produtos por fornecedor
5. Máximo e mínimo preço por categoria
6. Agrupe clientes por estado
7. Total de vendas por mês

### Nível Intermediário (8-14)
8. Média de idade por cidade
9. Soma de estoque por categoria
10. Agrupe produtos com HAVING preço médio > 100
11. Quantos pedidos cada vendedor tem
12. Agrupe e ordene resultados
13. Use funções COUNT, SUM, AVG juntas
14. Agrupe e filtre com HAVING

### Nível Avançado (15-20)
15. Combine GROUP BY com JOIN
16. Mostre clientes com mais de 2 pedidos
17. Calcule o faturamento total e por cidade
18. Agrupe pedidos por ano
19. Mostre categorias com mais de 3 produtos
20. Agrupe e mostre a maior venda por categoria

## 📊 Dados de Exemplo

O banco contém:
- 5 estados brasileiros
- 9 cidades
- 15 clientes
- 5 fornecedores
- 6 categorias
- 20 produtos
- 5 vendedores
- 30 pedidos (2023-2024)

## 🛠️ Tecnologias

- SQL (compatível com MySQL, PostgreSQL, SQL Server)
- Qualquer ferramenta de gerenciamento de BD de sua preferência


## 📄 Licença

Este projeto está sob a licença MIT.

## ✍️ Autor

**jfroes**
- GitHub: [@jfroes](https://github.com/jfroes)
