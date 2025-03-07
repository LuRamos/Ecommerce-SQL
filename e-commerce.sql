-- criação do banco de dados de Ecommerce

CREATE DATABASE Ecommerce;
USE ecommerce;

-- Tabela para pessoa física 
CREATE TABLE PessoaFisica(
	idPessoaFisica INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL
);

-- Tabela para pessoa jurídica
CREATE TABLE PessoaJuridica(
	idPessoaJuridica INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nome_Fantasia VARCHAR(50) NOT NULL,
    Razao_Social VARCHAR(50) NOT NULL,
    CNPJ VARCHAR(14) UNIQUE NOT NULL
);

CREATE TABLE Endereco(
	idEndereco INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Rua_Avenida VARCHAR(50) NOT NULL,
    CEP VARCHAR(10) NOT NULL,
    Bairro VARCHAR(20) NOT NULL,
    Cidade VARCHAR(20) NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    País VARCHAR(20) NOT NULL,
    Número VARCHAR(10) NOT NULL,
    Complemento VARCHAR(45),
    Tipo_Endereco ENUM('Residencial', 'Comercial', 'Cobrança', 'Entrega')
);



CREATE TABLE Fornecedor(
	idFornecedor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_Fornecedor_PessoaJuridica INT,
    id_Fornecedor_Endereco INT,
    Nome VARCHAR(50) NOT NULL,
    Telefone VARCHAR(45) NOT NULL,
    Email VARCHAR(50) NOT NULL,
	FOREIGN KEY (id_Fornecedor_PessoaJuridica) REFERENCES PessoaJuridica(idPessoaJuridica),
    FOREIGN KEY (id_Fornecedor_Endereco) REFERENCES Endereco(idEndereco)
);

CREATE TABLE TerceirosVendedor(
	idTerceirosVendedor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_TerceirosVendedor_PessoaJuridica INT,
    id_TerceirosVendedor_Endereco INT,
    Nome VARCHAR(50) NOT NULL,
    Telefone VARCHAR(45) NOT NULL,
    Email VARCHAR(50) NOT NULL,
	FOREIGN KEY (id_TerceirosVendedor_PessoaJuridica) REFERENCES PessoaJuridica(idPessoaJuridica),
    FOREIGN KEY (id_TerceirosVendedor_Endereco) REFERENCES Endereco(idEndereco)
);


CREATE TABLE Cliente(
	idCliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_Cliente_PessoaFisica INT NULL,
    id_Cliente_PessoaJuridica INT NULL,
    id_Cliente_Endereco INT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Senha VARCHAR(45) NOT NULL,
    Tipo_Cliente ENUM('PF', 'PJ') NOT NULL,
    FOREIGN KEY (id_Cliente_PessoaFisica) REFERENCES PessoaFisica(idPessoaFisica),
    FOREIGN KEY (id_Cliente_PessoaJuridica) REFERENCES PessoaJuridica(idPessoaJuridica),
    FOREIGN KEY (id_Cliente_Endereco) REFERENCES Endereco(idEndereco),
    CONSTRAINT chk_cliente CHECK (
        (Tipo_Cliente = 'PF' AND id_Cliente_PessoaFisica IS NOT NULL AND id_Cliente_PessoaJuridica IS NULL) OR
        (Tipo_Cliente = 'PJ' AND id_Cliente_PessoaJuridica IS NOT NULL AND id_Cliente_PessoaFisica IS NULL)
    )
);

CREATE TABLE Produto(
	idProduto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nome_Produto VARCHAR(45) NOT NULL,
	Descrição VARCHAR(45) NOT NULL,
    Preco FLOAT NOT NULL,
    Categoria ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos') NOT NULL
   
);




CREATE TABLE Estoque(
	idEstoque INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Local VARCHAR(45),
    Data_Ultima_Atualizacao DATE NOT NULL,
    Nivel_Reposicao VARCHAR(45) NOT NULL
);





CREATE TABLE Pedido(
	idPedido INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_Pedido_Cliente INT NOT NULL,
    Data_Pedido DATE NOT NULL,
    Descrição VARCHAR(150) NOT NULL,
    FOREIGN KEY (id_Pedido_Cliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Entrega(
	idEntrega INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_Entrega_Pedido INT NOT NULL,
    id_Entrega_Endereco INT NOT NULL,
    Código_Rastreio VARCHAR(25) NOT NULL,
    Endereco_Entrega VARCHAR(45),
    Data_Envio DATE NOT NULL,
    Data_Entrega DATE NOT NULL, 
    Data_Entrega_Estimada DATE,
    FOREIGN KEY (id_Entrega_Pedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (id_Entrega_Endereco) REFERENCES Endereco(idEndereco)
);



CREATE TABLE HistoricoEntrega(
	idHistoricoEntrega INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_HistoricoEntrega_Endereco INT NOT NULL,
    Status_Entrega VARCHAR(25) NOT NULL,
    Data_Entrega_Atualizacao DATE NOT NULL,
    FOREIGN KEY (id_HistoricoEntrega_Endereco) REFERENCES Endereco(idEndereco)
);

CREATE TABLE FormaPagamento(
	idFormaPagamento INT AUTO_INCREMENT PRIMARY KEY  NOT NULL,
	Tipo_Pagamento ENUM('Pix', 'Cartão de Crédito', 'Cartão de Débito', 'Boleto') NOT NULL,
    Detalhes_Pagamento VARCHAR(45) NOT NULL,
    Valor_Total_Pagamento FLOAT NOT NULL
);


CREATE TABLE StatusPedido(
	idStatusPedido INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    idStatus_FormaPagamento INT NOT NULL,
    idStatus_HistoricoEntrega INT NOT NULL,
    Data_Status DATE,
	Descricao_Status ENUM('Aguardando Pagamento', 'Pagamento Aprovado', 'Em Transporte', 'Entregue', 'Atrasado') DEFAULT 'Aguardando Pagamento',
    FOREIGN KEY (idStatus_FormaPagamento) REFERENCES FormaPagamento(idFormaPagamento),
    FOREIGN KEY (idStatus_HistoricoEntrega) REFERENCES HistoricoEntrega(idHistoricoEntrega)
    
);












-- Tabelas de Relacionamento N:M

-- Relação N:M Produto e Estoque
CREATE TABLE EstoqueProdutos(
	idEstoque_Produtos INT NOT NULL,
    idProduto_Produtos INT NOT NULL,
    Quantidade INT NOT NULL CHECK(Quantidade>=0),
    PRIMARY KEY(idEstoque_Produtos, idProduto_Produtos),
    FOREIGN KEY (idEstoque_Produtos) REFERENCES Estoque(idEstoque),
    FOREIGN KEY (idProduto_Produtos) REFERENCES Produto(idProduto)
);

-- Relação N:M Produto e Fornecedor
CREATE TABLE FornecendoProdutos(
	idFornecedor_Produtos INT NOT NULL,
    idProduto_Produtos INT NOT NULL,
    Quantidade INT NOT NULL,
    PRIMARY KEY(idFornecedor_Produtos, idProduto_Produtos),
    FOREIGN KEY (idFornecedor_Produtos) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (idProduto_Produtos) REFERENCES Produto(idProduto)
);


-- Relação N:M Produto e Terceiros Vendedor
CREATE TABLE ProdutosTerceirosVendedor(
	idTerceirosVendedor_Produtos INT NOT NULL,
    idProduto_Produtos INT NOT NULL,
    Quantidade INT NOT NULL,
    Preco_Vendedor FLOAT NOT NULL,
    PRIMARY KEY(idTerceirosVendedor_Produtos, idProduto_Produtos),
    FOREIGN KEY (idTerceirosVendedor_Produtos) REFERENCES TerceirosVendedor(idTerceirosVendedor),
    FOREIGN KEY (idProduto_Produtos) REFERENCES Produto(idProduto)
);


-- Relação N:M Produto e Terceiros Vendedor
CREATE TABLE RelacaoPedidosProdutos(
	idRelacao_Pedidos INT NOT NULL,
    idRelacao_Produtos INT NOT NULL,
    Quantidade INT NOT NULL,
    PRIMARY KEY(idRelacao_Pedidos, idRelacao_Produtos),
    FOREIGN KEY (idRelacao_Pedidos) REFERENCES Pedido(idPedido),
    FOREIGN KEY (idRelacao_Produtos) REFERENCES Produto(idProduto)
);


-- Relação N:M Forma de Pagamento e Pedido
CREATE TABLE PedidoFormaPagamento(
	idPedidoFormaPagamento_FormaPagamento INT NOT NULL,
    idPedidoFormaPagamento_Pedido INT NOT NULL,
    Valor_Pago FLOAT NOT NULL,
    Data_Pagamento DATE NOT NULL,
    Status_Pagamento ENUM('Aguardando pagamento', 'Em processamento', 'Aprovado', 'Cancelado', 'Estornado') DEFAULT 'Aguardando pagamento',
    PRIMARY KEY(idPedidoFormaPagamento_FormaPagamento, idPedidoFormaPagamento_Pedido),
    FOREIGN KEY (idPedidoFormaPagamento_FormaPagamento) REFERENCES FormaPagamento(idFormaPagamento),
    FOREIGN KEY (idPedidoFormaPagamento_Pedido) REFERENCES Pedido(idPedido)
);







