-- Inserindo dados na tabela PessoaFisica
INSERT INTO PessoaFisica (Nome, CPF) VALUES
('João Silva', '12345678901'),
('Maria Oliveira', '23456789012'),
('Pedro Santos', '34567890123'),
('Ana Costa', '45678901234'),
('Luana Pereira', '56789012345'),
('Carlos Lima', '67890123456'),
('Fernanda Souza', '78901234567'),
('Roberto Martins', '89012345678'),
('Juliana Rocha', '90123456789'),
('Eduardo Alves', '01234567890');



-- Inserindo dados na tabela PessoaJuridica
INSERT INTO PessoaJuridica (Nome_Fantasia, Razao_Social, CNPJ) VALUES
('Loja A', 'Loja A LTDA', '12345678000123'),
('Supermercado B', 'Supermercado B S/A', '23456789000134'),
('TecnoWeb', 'TecnoWeb Solutions LTDA', '34567890000145'),
('Vendas C', 'Vendas C Comércio', '45678901234567'),
('Empreendimentos D', 'Empreendimentos D Ltda', '56789012345678'),
('Comércio E', 'Comércio E S/A', '67890123456789'),
('Distribuidora F', 'Distribuidora F Ltda', '78901234567890'),
('Soluções G', 'Soluções G Indústria', '89012345678901'),
('Produtos H', 'Produtos H Comércio', '90123456789012'),
('Distribuição I', 'Distribuição I Ltda', '01234567890123');


-- Inserindo dados na tabela Endereco
INSERT INTO Endereco (Rua_Avenida, CEP, Bairro, Cidade, Estado, País, Número, Complemento, Tipo_Endereco) VALUES
('Rua 1', '12345-000', 'Centro', 'São Paulo', 'SP', 'Brasil', '10', 'Apto 101', 'Residencial'),
('Rua 2', '23456-000', 'Vila Nova', 'Rio de Janeiro', 'RJ', 'Brasil', '20', 'Bloco A', 'Comercial'),
('Rua 3', '34567-000', 'Jardim São Paulo', 'Belo Horizonte', 'MG', 'Brasil', '30', 'Casa 3', 'Cobrança'),
('Avenida 4', '45678-000', 'Barra', 'Salvador', 'BA', 'Brasil', '40', 'Apto 202', 'Entrega'),
('Rua 5', '56789-000', 'Boa Vista', 'Curitiba', 'PR', 'Brasil', '50', '', 'Residencial'),
('Avenida 6', '67890-000', 'Centro', 'Fortaleza', 'CE', 'Brasil', '60', '', 'Comercial'),
('Rua 7', '78901-000', 'Vila Mariana', 'São Paulo', 'SP', 'Brasil', '70', 'Andar 3', 'Cobrança'),
('Avenida 8', '89012-000', 'Vila Isabel', 'Rio de Janeiro', 'RJ', 'Brasil', '80', 'Sala 5', 'Entrega'),
('Rua 9', '90123-000', 'Vila Nova', 'Belo Horizonte', 'MG', 'Brasil', '90', 'Apto 303', 'Residencial'),
('Avenida 10', '01234-000', 'Centro', 'Curitiba', 'PR', 'Brasil', '100', 'Loja 10', 'Comercial');


-- Inserindo dados na tabela Fornecedor 
INSERT INTO Fornecedor (id_Fornecedor_PessoaJuridica, id_Fornecedor_Endereco, Nome, Telefone, Email) VALUES
(1, 1, 'Carlos Silva', '11987654321', 'carlossilva@email.com'),
(2, 2, 'Ana Souza', '21987654321', 'anasouza@email.com'),
(3, 3, 'João Pereira', '31987654321', 'joaopereira@email.com'),
(4, 4, 'Mariana Costa', '41987654321', 'marianacosta@email.com'),
(5, 5, 'Roberto Oliveira', '51987654321', 'robertooliveira@email.com'),
(6, 6, 'Fernanda Almeida', '61987654321', 'fernandaalmeida@email.com'),
(7, 7, 'Pedro Santos', '71987654321', 'pedrosantos@email.com'),
(8, 8, 'Juliana Lima', '81987654321', 'julianalima@email.com'),
(9, 9, 'Ricardo Martins', '91987654321', 'ricardomartins@email.com'),
(10, 10, 'Patrícia Ferreira', '011987654321', 'patriciaferreira@email.com');


-- Inserindo dados na tabela TerceirosVendedor 
INSERT INTO TerceirosVendedor (id_TerceirosVendedor_PessoaJuridica, id_TerceirosVendedor_Endereco, Nome, Telefone, Email) VALUES
(1, 1, 'Lucas Rocha', '11999999999', 'lucasrocha@email.com'),
(2, 2, 'Isabela Martins', '21999999999', 'isabelamartins@email.com'),
(3, 3, 'Gabriel Oliveira', '31999999999', 'gabrielloliveira@email.com'),
(4, 4, 'Sofia Pereira', '41999999999', 'sofiapereira@email.com'),
(5, 5, 'Tiago Carvalho', '51999999999', 'tiagocarvalho@email.com'),
(6, 6, 'Larissa Costa', '61999999999', 'larissacosta@email.com'),
(7, 7, 'Vinícius Souza', '71999999999', 'viniciussouza@email.com'),
(8, 8, 'Mariana Ribeiro', '81999999999', 'marianaribeiro@email.com'),
(9, 9, 'Henrique Almeida', '91999999999', 'henriquealmeida@email.com'),
(10, 10, 'Camila Silva', '01199999999', 'camilasilva@email.com');



-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (id_Cliente_PessoaFisica, id_Cliente_PessoaJuridica, id_Cliente_Endereco, Nome, Email, Telefone, Senha, Tipo_Cliente) VALUES
(1, NULL, 1, 'João Silva', 'joao@email.com', '11987654321', 'senha123', 'PF'),
(2, NULL, 2, 'Maria Oliveira', 'maria@email.com', '21987654321', 'senha456', 'PF'),
(NULL, 1, 3, 'Loja A', 'lojaA@email.com', '31987654321', 'senha789', 'PJ'),
(3, NULL, 4, 'Pedro Santos', 'pedro@email.com', '42987654321', 'senha101', 'PF'),
(NULL, 2, 5, 'Supermercado B', 'supermercadoB@email.com', '53987654321', 'senha102', 'PJ'),
(4, NULL, 6, 'Ana Costa', 'ana@email.com', '64987654321', 'senha103', 'PF'),
(5, NULL, 7, 'Carlos Lima', 'carlos@email.com', '75987654321', 'senha104', 'PF'),
(NULL, 3, 8, 'TecnoWeb', 'tecnoweb@email.com', '86987654321', 'senha105', 'PJ'),
(6, NULL, 9, 'Fernanda Souza', 'fernanda@email.com', '97987654321', 'senha106', 'PF'),
(NULL, 4, 10, 'Vendas C', 'vendasC@email.com', '08987654321', 'senha107', 'PJ');


-- Inserindo dados na tabela Produto
INSERT INTO Produto (Nome_Produto, Descrição, Preco, Categoria) VALUES
('Celular XYZ', 'Celular com 4GB de RAM', 1200.00, 'Eletrônico'),
('Camiseta ABC', 'Camiseta 100% algodão', 50.00, 'Vestimenta'),
('Brinquedo Defensor', 'Brinquedo de montar', 70.00, 'Brinquedos'),
('Arroz Branco', 'Arroz tipo 1', 5.00, 'Alimentos'),
('Notebook Intel', 'Notebook com 8GB de RAM', 3500.00, 'Eletrônico'),
('Jaqueta de Couro', 'Jaqueta de couro legítimo', 200.00, 'Vestimenta'),
('Carrinho de Controle Remoto', 'Carrinho de brinquedo', 120.00, 'Brinquedos'),
('Feijão Preto', 'Feijão tipo 1', 6.00, 'Alimentos'),
('Fone de Ouvido Bluetooth', 'Fone sem fio', 150.00, 'Eletrônico'),
('Calça Jeans', 'Calça jeans de corte reto', 80.00, 'Vestimenta');


-- Inserindo dados na tabela Estoque
INSERT INTO Estoque (Local, Data_Ultima_Atualizacao, Nivel_Reposicao) VALUES
('Depósito A', '2025-03-01', '10'),
('Depósito B', '2025-03-02', '8'),
('Depósito C', '2025-03-03', '15'),
('Depósito D', '2025-03-04', '3'),
('Depósito E', '2025-03-05', '20'),
('Depósito F', '2025-03-06', '5'),
('Depósito G', '2025-03-07', '12'),
('Depósito H', '2025-03-08', '7'),
('Depósito I', '2025-03-09', '0'),
('Depósito J', '2025-03-10', '25');


-- Inserindo dados na tabela Pedido 
INSERT INTO Pedido (id_Pedido_Cliente, Data_Pedido, Descrição) VALUES
(1, '2025-01-15', 'Pedido de Celular XYZ'),
(2, '2025-02-20', 'Pedido de Camiseta ABC'),
(3, '2025-01-10', 'Pedido de Brinquedo Defensor'),
(4, '2025-02-05', 'Pedido de Arroz Branco'),
(5, '2025-03-01', 'Pedido de Notebook Intel'),
(6, '2025-02-15', 'Pedido de Jaqueta de Couro'),
(7, '2025-01-25', 'Pedido de Carrinho de Controle Remoto'),
(8, '2025-03-02', 'Pedido de Feijão Preto'),
(9, '2025-02-28', 'Pedido de Fone de Ouvido Bluetooth'),
(10, '2025-01-30', 'Pedido de Calça Jeans');



-- Inserindo dados na tabela Entrega com Data de Envio, Data de Entrega e Data de Entrega Estimada
INSERT INTO Entrega (id_Entrega_Pedido, id_Entrega_Endereco, Código_Rastreio, Endereco_Entrega, Data_Envio, Data_Entrega, Data_Entrega_Estimada) VALUES
(1, 1, 'ABC123', 'Rua 1', '2025-03-02', '2025-03-04', '2025-03-20'),
(2, 2, 'DEF456', 'Rua 2', '2025-03-03', '2025-03-15', '2025-03-05'),
(3, 3, 'GHI789', 'Rua 3', '2025-03-04', '2025-03-06', '2025-04-06'),
(4, 4, 'JKL012', 'Rua 4', '2025-03-05', '2025-05-07', '2025-03-07'),
(5, 5, 'MNO345', 'Rua 5', '2025-03-06', '2025-03-08', '2025-03-28'),
(6, 6, 'PQR678', 'Rua 6', '2025-03-07', '2025-04-09', '2025-04-10'),
(7, 7, 'STU901', 'Rua 7', '2025-03-08', '2025-10-10', '2025-05-10'),
(8, 8, 'VWX234', 'Rua 8', '2025-03-09', '2025-04-11', '2025-06-12'),
(9, 9, 'YZA567', 'Rua 9', '2025-03-10', '2025-05-12', '2025-03-12'),
(10, 10, 'BCD890', 'Rua 10', '2025-03-11', '2025-03-13', '2025-03-13');



-- Inserindo dados na tabela FormaPagamento
INSERT INTO FormaPagamento (Tipo_Pagamento, Detalhes_Pagamento, Valor_Total_Pagamento) VALUES
('Pix', 'Pagamento via Pix', 1200.00),
('Cartão de Crédito', 'Pagamento via Cartão', 50.00),
('Boleto', 'Pagamento via boleto', 70.00),
('Pix', 'Pagamento via Pix', 5.00),
('Cartão de Crédito', 'Pagamento via Cartão', 3500.00),
('Cartão de Débito', 'Pagamento via Cartão Débito', 200.00),
('Boleto', 'Pagamento via boleto', 120.00),
('Pix', 'Pagamento via Pix', 6.00),
('Cartão de Crédito', 'Pagamento via Cartão', 150.00),
('Boleto', 'Pagamento via boleto', 80.00);


-- Inserindo dados na tabela HistoricoEntrega
INSERT INTO HistoricoEntrega (id_HistoricoEntrega_Endereco, Status_Entrega, Data_Entrega_Atualizacao) 
VALUES 
(1, 'Aguardando Retirada', '2025-03-05'), 
(2, 'Em Rota de Entrega', '2025-03-06'), 
(3, 'Entrega Realizada', '2025-03-06'), 
(4, 'Atrasado', '2025-03-07'), 
(5, 'Em Processamento', '2025-03-07'),
(6, 'Aguardando Retirada', '2025-03-05'),
(7, 'Em Rota de Entrega', '2025-03-06'),
(8, 'Entrega Realizada', '2025-03-06'),
(9, 'Atrasado', '2025-03-07'),
(10, 'Em Processamento', '2025-03-07');


-- Inserindo dados na tabela StatusPedido
INSERT INTO StatusPedido (idStatus_FormaPagamento, idStatus_HistoricoEntrega, Data_Status, Descricao_Status) VALUES
(1, 1, '2025-03-01', 'Pagamento Aprovado'),
(2, 2, '2025-03-02', 'Em Transporte'),
(3, 3, '2025-03-03', 'Entregue'),
(4, 4, '2025-03-04', 'Aguardando Pagamento'),
(5, 5, '2025-03-05', 'Em Transporte'),
(6, 6, '2025-03-06', 'Entregue'),
(7, 7, '2025-03-07', 'Atrasado'),
(8, 8, '2025-03-08', 'Aguardando Pagamento'),
(9, 9, '2025-03-09', 'Atrasado'),
(10, 10, '2025-03-10', 'Pagamento Aprovado');


-- Inserindo dados na tabela FornecendoProdutos
INSERT INTO FornecendoProdutos (idProduto_Produtos, idFornecedor_Produtos, Quantidade)  
VALUES  
    (1, 1, 100),  -- Produto 1 fornecido pelo Fornecedor 1 com 100 unidades  
    (2, 2, 50),   -- Produto 2 fornecido pelo Fornecedor 2 com 50 unidades  
    (3, 1, 75),   -- Produto 3 fornecido pelo Fornecedor 1 com 75 unidades  
    (4, 3, 120),  -- Produto 4 fornecido pelo Fornecedor 3 com 120 unidades  
    (5, 4, 200),  -- Produto 5 fornecido pelo Fornecedor 4 com 200 unidades  
    (6, 2, 150),  -- Produto 6 fornecido pelo Fornecedor 2 com 150 unidades  
    (7, 3, 90),   -- Produto 7 fornecido pelo Fornecedor 3 com 90 unidades  
    (8, 1, 50),   -- Produto 8 fornecido pelo Fornecedor 1 com 50 unidades  
    (9, 4, 80),   -- Produto 9 fornecido pelo Fornecedor 4 com 80 unidades  
    (10, 2, 60);  -- Produto 10 fornecido pelo Fornecedor 2 com 60 unidades



-- Inserindo dados na tabela EstoqueProdutos
INSERT INTO EstoqueProdutos (idEstoque_Produtos, idProduto_Produtos, Quantidade)
VALUES 
    (1, 1, 100),  -- Produto 1 no Estoque 1 com 100 unidades
    (2, 2, 50),   -- Produto 2 no Estoque 2 com 50 unidades
    (3, 3, 75),   -- Produto 3 no Estoque 3 com 75 unidades
    (4, 4, 200),  -- Produto 4 no Estoque 4 com 200 unidades
    (5, 5, 150),  -- Produto 5 no Estoque 5 com 150 unidades
    (6, 6, 120),  -- Produto 6 no Estoque 6 com 120 unidades
    (7, 7, 80),   -- Produto 7 no Estoque 7 com 80 unidades
    (8, 8, 90),   -- Produto 8 no Estoque 8 com 90 unidades
    (9, 9, 60),   -- Produto 9 no Estoque 9 com 60 unidades
    (10, 10, 130);-- Produto 10 no Estoque 10 com 130 unidades


-- Inserindo dados na tabela ProdutosTerceirosVendedor com vários vendedores
INSERT INTO ProdutosTerceirosVendedor (idTerceirosVendedor_Produtos, idProduto_Produtos, Quantidade, Preco_Vendedor)
VALUES 
    (1, 1, 50, 20.0), -- Produto 1 vendido pelo Vendedor 1 com preço de 20
    (2, 2, 30, 15.0), -- Produto 2 vendido pelo Vendedor 2 com preço de 15
    (3, 3, 40, 25.0), -- Produto 3 vendido pelo Vendedor 3 com preço de 25
    (1, 4, 20, 30.0), -- Produto 4 vendido pelo Vendedor 1 com preço de 30
    (2, 5, 15, 18.0), -- Produto 5 vendido pelo Vendedor 2 com preço de 18
    (3, 6, 60, 22.0), -- Produto 6 vendido pelo Vendedor 3 com preço de 22
    (1, 7, 50, 12.0), -- Produto 7 vendido pelo Vendedor 1 com preço de 12
    (2, 8, 30, 20.0), -- Produto 8 vendido pelo Vendedor 2 com preço de 20
    (3, 9, 25, 28.0), -- Produto 9 vendido pelo Vendedor 3 com preço de 28
    (1, 10, 40, 35.0); -- Produto 10 vendido pelo Vendedor 1 com preço de 35

    
    
    
    INSERT INTO RelacaoPedidosProdutos (idRelacao_Produtos, idRelacao_Pedidos, Quantidade)
VALUES 
(1, 1, 10),  -- Produto 1 no Pedido 1 com 10 unidades
(2, 1, 5),   -- Produto 2 no Pedido 1 com 5 unidades
(3, 2, 8),   -- Produto 3 no Pedido 2 com 8 unidades
(4, 3, 6),   -- Produto 4 no Pedido 3 com 6 unidades
(5, 3, 12),  -- Produto 5 no Pedido 3 com 12 unidades
(6, 4, 20),  -- Produto 6 no Pedido 4 com 20 unidades
(7, 4, 15),  -- Produto 7 no Pedido 4 com 15 unidades
(8, 5, 25),  -- Produto 8 no Pedido 5 com 25 unidades
(9, 5, 10),  -- Produto 9 no Pedido 5 com 10 unidades
(10, 6, 30); -- Produto 10 no Pedido 6 com 30 unidades

