-- Quantos pedidos foram feitos por cada cliente
SELECT 
    Cliente.Nome, 
    COUNT(Pedido.idPedido) AS Quantidade_Pedidos
FROM 
    Cliente
JOIN 
    Pedido ON Cliente.idCliente = Pedido.id_Pedido_Cliente
GROUP BY 
    Cliente.idCliente;


-- --------------------------------------------------------------------------------------------------------------------------



-- Relação de produtos, fornecedores, locais e estoques
SELECT 
    Produto.Nome_Produto, 
    Fornecedor.Nome AS Nome_Fornecedor, 
    Estoque.Local, 
    Estoque.Nivel_Reposicao
FROM 
    Produto
LEFT JOIN 
    FornecendoProdutos ON Produto.idProduto = FornecendoProdutos.idProduto_Produtos
LEFT JOIN 
    Fornecedor ON FornecendoProdutos.idFornecedor_Produtos = Fornecedor.idFornecedor
LEFT JOIN 
    EstoqueProdutos ON Produto.idProduto = EstoqueProdutos.idProduto_Produtos
LEFT JOIN 
    Estoque ON EstoqueProdutos.idEstoque_Produtos = Estoque.idEstoque;



-- --------------------------------------------------------------------------------------------------------------------------

-- Relação de nomes dos fornecedores e nomes dos produtos
SELECT 
    Fornecedor.Nome AS Nome_Fornecedor, 
    Produto.Nome_Produto
FROM 
    Fornecedor
JOIN 
    FornecendoProdutos ON Fornecedor.idFornecedor = FornecendoProdutos.idFornecedor_Produtos
JOIN 
    Produto ON FornecendoProdutos.idProduto_Produtos = Produto.idProduto;




-- --------------------------------------------------------------------------------------------------------------------------

-- Produtos vendidos por um determinado vendedor
SELECT 
    Produto.Nome_Produto, 
    ProdutosTerceirosVendedor.Preco_Vendedor, 
    TerceirosVendedor.Nome AS Nome_Vendedor
FROM  
    Produto
JOIN 
    ProdutosTerceirosVendedor ON Produto.idProduto = ProdutosTerceirosVendedor.idProduto_Produtos
JOIN 
    TerceirosVendedor ON ProdutosTerceirosVendedor.idTerceirosVendedor_Produtos = TerceirosVendedor.idTerceirosVendedor
WHERE 
    ProdutosTerceirosVendedor.idTerceirosVendedor_Produtos = 2;  -- ID do vendedor




-- --------------------------------------------------------------------------------------------------------------------------

-- Recupera produtos vendidos por um vendedor específico (idTerceirosVendedor_Produtos = 1)
SELECT Nome_Produto, Preco_Vendedor
FROM Produto
JOIN ProdutosTerceirosVendedor ON Produto.idProduto = ProdutosTerceirosVendedor.idProduto_Produtos
WHERE ProdutosTerceirosVendedor.idTerceirosVendedor_Produtos = 2;





-- --------------------------------------------------------------------------------------------------------------------------

-- Calcula o preço com desconto (10%) para cada produto vendido
SELECT Nome_Produto, Preco_Vendedor, Preco_Vendedor * 0.9 AS Preco_Com_Desconto
FROM Produto
JOIN ProdutosTerceirosVendedor ON Produto.idProduto = ProdutosTerceirosVendedor.idProduto_Produtos;





-- --------------------------------------------------------------------------------------------------------------------------


-- Ordena os produtos por preço, do mais barato para o mais caro
SELECT Nome_Produto, Preco_Vendedor
FROM Produto
JOIN ProdutosTerceirosVendedor ON Produto.idProduto = ProdutosTerceirosVendedor.idProduto_Produtos
ORDER BY Preco_Vendedor ASC;




-- --------------------------------------------------------------------------------------------------------------------------


-- Exibe os vendedores que estão vendendo mais de um produto (contagem de produtos vendidos > 1)
SELECT 
    TerceirosVendedor.Nome AS Nome_Vendedor, 
    COUNT(ProdutosTerceirosVendedor.idProduto_Produtos) AS Quantidade_Produtos_Vendidos
FROM 
    ProdutosTerceirosVendedor
JOIN 
    TerceirosVendedor ON ProdutosTerceirosVendedor.idTerceirosVendedor_Produtos = TerceirosVendedor.idTerceirosVendedor
GROUP BY 
    ProdutosTerceirosVendedor.idTerceirosVendedor_Produtos
HAVING 
    COUNT(ProdutosTerceirosVendedor.idProduto_Produtos) > 1;


-- --------------------------------------------------------------------------------------------------------------------------

-- Quantidade de produtos vendidos por pedido.
SELECT 
    Produto.Nome_Produto, 
    SUM(RelacaoPedidosProdutos.Quantidade) AS Quantidade_Vendida
FROM 
    Produto
JOIN 
    RelacaoPedidosProdutos ON Produto.idProduto = RelacaoPedidosProdutos.idRelacao_Produtos
JOIN 
    Pedido ON RelacaoPedidosProdutos.idRelacao_Pedidos = Pedido.idPedido
GROUP BY 
    Produto.Nome_Produto
ORDER BY 
    Quantidade_Vendida DESC;





-- --------------------------------------------------------------------------------------------------------------------------


-- Mostrar uma mensagem quando o estoque estiver baixo
SELECT 
    Produto.Nome_Produto, 
    Estoque.Nivel_Reposicao,
    CASE 
        WHEN Estoque.Nivel_Reposicao < 10 THEN 'Reabastecer'
        ELSE 'Estoque adequado'
    END AS Status_Reposicao
FROM 
    Produto
JOIN 
    EstoqueProdutos ON Produto.idProduto = EstoqueProdutos.idProduto_Produtos
JOIN 
    Estoque ON EstoqueProdutos.idEstoque_Produtos = Estoque.idEstoque;





-- --------------------------------------------------------------------------------------------------------------------------
-- Pedidos com status de entrega atrasado
SELECT 
    Pedido.idPedido, 
    Cliente.Nome, 
    DATE_FORMAT(Pedido.Data_Pedido, '%d/%m/%Y') AS Data_Pedido,
    DATE_FORMAT(Entrega.Data_Envio, '%d/%m/%Y') AS Data_Envio,
    DATE_FORMAT(Entrega.Data_Entrega_Estimada, '%d/%m/%Y') AS Data_Entrega_Estimada,
    DATE_FORMAT(Entrega.Data_Entrega, '%d/%m/%Y') AS Data_Entrega,
    CASE
        WHEN Entrega.Data_Entrega > Entrega.Data_Entrega_Estimada THEN 'Atrasado'
        ELSE 'No Prazo'
    END AS Status_Entrega
FROM 
    Pedido
JOIN 
    Cliente ON Pedido.id_Pedido_Cliente = Cliente.idCliente
JOIN
    Entrega ON Pedido.idPedido = Entrega.id_Entrega_Pedido
WHERE 
    Entrega.Data_Entrega > Entrega.Data_Entrega_Estimada;



-- --------------------------------------------------------------------------------------------------------------------------


-- -- Pedidos com status de entrega no prazo
SELECT 
    Pedido.idPedido, 
    Cliente.Nome, 
    DATE_FORMAT(Pedido.Data_Pedido, '%d/%m/%Y') AS Data_Pedido,
    DATE_FORMAT(Entrega.Data_Envio, '%d/%m/%Y') AS Data_Envio,
    DATE_FORMAT(Entrega.Data_Entrega_Estimada, '%d/%m/%Y') AS Data_Entrega_Estimada,
    DATE_FORMAT(Entrega.Data_Entrega, '%d/%m/%Y') AS Data_Entrega,
    CASE
        WHEN Entrega.Data_Entrega <= Entrega.Data_Entrega_Estimada THEN 'No Prazo'
        ELSE 'Atrasado'
    END AS Status_Entrega
FROM 
    Pedido
JOIN 
    Cliente ON Pedido.id_Pedido_Cliente = Cliente.idCliente
JOIN
    Entrega ON Pedido.idPedido = Entrega.id_Entrega_Pedido
WHERE 
    Entrega.Data_Entrega <= Entrega.Data_Entrega_Estimada;




-- --------------------------------------------------------------------------------------------------------------------------


-- Fornecedores que não estão fornecendo produtos
SELECT 
    Fornecedor.Nome AS Fornecedores_Sem_Fornecer
FROM 
    Fornecedor
LEFT JOIN 
    FornecendoProdutos ON Fornecedor.idFornecedor = FornecendoProdutos.idFornecedor_Produtos
WHERE 
    FornecendoProdutos.idProduto_Produtos IS NULL;





-- --------------------------------------------------------------------------------------------------------------------------

-- Total de vendas por vendedor
SELECT 
    TerceirosVendedor.Nome AS Nome_Vendedor, 
    SUM(ProdutosTerceirosVendedor.Preco_Vendedor * RelacaoPedidosProdutos.Quantidade) AS Total_Vendas
FROM 
    ProdutosTerceirosVendedor
JOIN 
    TerceirosVendedor ON ProdutosTerceirosVendedor.idTerceirosVendedor_Produtos = TerceirosVendedor.idTerceirosVendedor
JOIN 
    RelacaoPedidosProdutos ON ProdutosTerceirosVendedor.idProduto_Produtos = RelacaoPedidosProdutos.idRelacao_Produtos
JOIN 
    Pedido ON RelacaoPedidosProdutos.idRelacao_Pedidos = Pedido.idPedido
GROUP BY 
    TerceirosVendedor.Nome;
    
    
-- --------------------------------------------------------------------------------------------------------------------------

-- Clientes que não fizeram compras
SELECT 
    Cliente.Nome AS Cliente_Não_Fez_Pedidos
FROM 
    Cliente
LEFT JOIN 
    Pedido ON Cliente.idCliente = Pedido.id_Pedido_Cliente
WHERE 
    Pedido.idPedido IS NULL;



-- --------------------------------------------------------------------------------------------------------------------------

-- Ordene os produtos vendidos pelo preço mais alto.
SELECT 
    Produto.Nome_Produto, 
    MAX(ProdutosTerceirosVendedor.Preco_Vendedor) AS Preco_Maximo
FROM 
    Produto
JOIN 
    ProdutosTerceirosVendedor ON Produto.idProduto = ProdutosTerceirosVendedor.idProduto_Produtos
GROUP BY 
    Produto.Nome_Produto
ORDER BY 
    Preco_Maximo DESC;
