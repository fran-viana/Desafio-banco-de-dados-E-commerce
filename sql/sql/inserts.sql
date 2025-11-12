-- ==========================================
--  INSERÇÃO DE DADOS DE EXEMPLO
-- Projeto: E-commerce - Desafio DIO
-- ==========================================

-- Inserir Clientes
INSERT INTO Cliente (nome, tipoCliente, cpf_cnpj, email, telefone) VALUES
('Maria Silva', 'PF', '12345678900', 'maria@email.com', '11999998888'),
('João Santos', 'PF', '98765432100', 'joao@email.com', '21988887777'),
('Tech Solutions LTDA', 'PJ', '11222333444455', 'contato@techsol.com', '1133334444');

-- Inserir Fornecedores
INSERT INTO Fornecedor (nomeFornecedor, cnpj, email, telefone) VALUES
('Alpha Distribuidora', '55667788990011', 'vendas@alpha.com', '1130303030'),
('Beta Imports', '99887766554433', 'contato@beta.com', '1140404040');

-- Inserir Produtos
INSERT INTO Produto (nome, descricao, preco, categoria) VALUES
('Notebook Dell', 'Notebook i7 16GB RAM SSD 512GB', 5500.00, 'Informática'),
('Mouse Logitech', 'Mouse sem fio', 120.00, 'Acessórios'),
('Cadeira Gamer', 'Cadeira ergonômica com ajuste de altura', 950.00, 'Móveis');

-- Relacionar Produtos e Fornecedores
INSERT INTO Produto_has_Fornecedor (idProduto, idFornecedor) VALUES
(1, 1),
(2, 1),
(3, 2);

-- Inserir Estoques
INSERT INTO Estoque (localizacao, capacidade) VALUES
('São Paulo - SP', 500),
('Rio de Janeiro - RJ', 300);

-- Inserir Produtos em Estoque
INSERT INTO Em_Estoque (idProduto, idEstoque, quantidade) VALUES
(1, 1, 100),
(2, 1, 200),
(3, 2, 50);

-- Inserir Terceiros Vendedores
INSERT INTO Terceiro_Vendedor (nomeVendedor, cnpj, email, telefone) VALUES
('Loja XPTO', '44332211000155', 'contato@xpto.com', '11911112222'),
('Mega Ofertas', '55443322110088', 'vendas@megaofertas.com', '21922223333');

-- Relacionar Terceiro Vendedor com Produtos
INSERT INTO Terceiro_Vendedor_has_Produto (idVendedor, idProduto) VALUES
(1, 2),
(2, 3);

-- Inserir Pedidos
INSERT INTO Pedido (dataPedido, statusPedido, idCliente) VALUES
('2025-11-01', 'Pago', 1),
('2025-11-03', 'Enviado', 2),
('2025-11-05', 'Pendente', 3);

-- Relacionar Produtos e Pedidos
INSERT INTO Produto_has_Pedido (idProduto, idPedido, quantidade) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1);
