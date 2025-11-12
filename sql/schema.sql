-- ==========================================
-- 🧱 CRIAÇÃO DAS TABELAS DO BANCO DE DADOS
-- Projeto: E-commerce - Desafio DIO
-- ==========================================

-- Tabela de Clientes
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    tipoCliente ENUM('PF', 'PJ') NOT NULL,
    cpf_cnpj VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Tabela de Pedidos
CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    dataPedido DATE NOT NULL,
    statusPedido ENUM('Pendente', 'Pago', 'Enviado', 'Concluído', 'Cancelado') DEFAULT 'Pendente',
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela de Produtos
CREATE TABLE Produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(50)
);

-- Tabela de Fornecedores
CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nomeFornecedor VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Tabela associativa entre Produto e Fornecedor (relação N:N)
CREATE TABLE Produto_has_Fornecedor (
    idProduto INT,
    idFornecedor INT,
    PRIMARY KEY (idProduto, idFornecedor),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor)
);

-- Tabela de Estoque
CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY AUTO_INCREMENT,
    localizacao VARCHAR(100),
    capacidade INT
);

-- Tabela associativa entre Produto e Estoque (N:N)
CREATE TABLE Em_Estoque (
    idProduto INT,
    idEstoque INT,
    quantidade INT DEFAULT 0,
    PRIMARY KEY (idProduto, idEstoque),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (idEstoque) REFERENCES Estoque(idEstoque)
);

-- Tabela de Terceiros Vendedores
CREATE TABLE Terceiro_Vendedor (
    idVendedor INT PRIMARY KEY AUTO_INCREMENT,
    nomeVendedor VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20) UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Associação entre Terceiro Vendedor e Produto (N:N)
CREATE TABLE Terceiro_Vendedor_has_Produto (
    idVendedor INT,
    idProduto INT,
    PRIMARY KEY (idVendedor, idProduto),
    FOREIGN KEY (idVendedor) REFERENCES Terceiro_Vendedor(idVendedor),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

-- Associação entre Produto e Pedido (N:N)
CREATE TABLE Produto_has_Pedido (
    idProduto INT,
    idPedido INT,
    quantidade INT DEFAULT 1,
    PRIMARY KEY (idProduto, idPedido),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);
