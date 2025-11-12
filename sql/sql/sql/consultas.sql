-- ==========================================
--  CONSULTAS DE EXEMPLO
-- Projeto: E-commerce - Desafio DIO
-- ==========================================

-- 1️ Listar todos os clientes e seus pedidos
SELECT c.nome AS Cliente, p.idPedido, p.dataPedido, p.statusPedido
FROM Cliente c
LEFT JOIN Pedido p ON c.idCliente = p.idCliente
ORDER BY c.nome;

-- 2️ Mostrar os produtos disponíveis em estoque com quantidade
SELECT pr.nome AS Produto, e.localizacao AS Local, em.quantidade
FROM Produto pr
JOIN Em_Estoque em ON pr.idProduto = em.idProduto
JOIN Estoque e ON em.idEstoque = e.idEstoque
ORDER BY pr.nome;

-- 3️ Mostrar produtos e seus fornecedores
SELECT pr.nome AS Produto, f.nomeFornecedor AS Fornecedor
FROM Produto pr
JOIN Produto_has_Fornecedor pf ON pr.idProduto = pf.idProduto
JOIN Fornecedor f ON pf.idFornecedor = f.idFornecedor
ORDER BY f.nomeFornecedor;

-- 4️ Listar os produtos vendidos por cada terceiro vendedor
SELECT tv.nomeVendedor AS Vendedor, pr.nome AS Produto
FROM Terceiro_Vendedor tv
JOIN Terceiro_Vendedor_has_Produto tvp ON tv.idVendedor = tvp.idVendedor
JOIN Produto pr ON tvp.idProduto = pr.idProduto
ORDER BY tv.nomeVendedor;

-- 5️ Mostrar o total de produtos em cada pedido
SELECT p.idPedido, c.nome AS Cliente, SUM(pp.quantidade) AS Total_Produtos
FROM Pedido p
JOIN Produto_has_Pedido pp ON p.idPedido = pp.idPedido
JOIN Cliente c ON p.idCliente = c.idCliente
GROUP BY p.idPedido, c.nome
ORDER BY p.idPedido;

-- 6️ Consultar clientes sem pedidos
SELECT nome AS Cliente
FROM Cliente
WHERE idCliente NOT IN (SELECT idCliente FROM Pedido);

-- 7️ Consultar o estoque total (somatório de todas as unidades)
SELECT SUM(quantidade) AS Total_Estoque
FROM Em_Estoque;
