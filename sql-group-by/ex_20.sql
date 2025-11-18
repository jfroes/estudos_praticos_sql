-- Exercicio 20: Agrupe e mostre a maior venda por categoria.

SELECT categoria.nome, MAX(item_pedido.preco_unitario * item_pedido.quantidade) AS vendas_categoria
FROM categorias categoria
JOIN produtos produto ON categoria.id = produto.categoria_id
JOIN itens_pedido item_pedido ON produto.id = item_pedido.produto_id
GROUP BY categoria.id
ORDER BY MAX(item_pedido.preco_unitario * item_pedido.quantidade) ASC
