# 📦 Modelagem de Banco de Dados para Sistema de Ecommerce

Bem-vindo ao README da modelagem de banco de dados para um sistema de ecommerce! Esta modelagem é um desafio do Bootcamp da Heineken - Inteligência Artificial Aplicada a Dados com Copilot, desenvolvida para representar e gerenciar todas as informações relacionadas aos clientes, pedidos, produtos, formas de pagamento e mais, garantindo eficiência e escalabilidade.

## 🖋️ Sobre a Modelagem

Esta modelagem foi projetada para um sistema de ecommerce completo e otimizado. O banco de dados busca garantir a integridade das informações, a flexibilidade de operações e o suporte a múltiplos relacionamentos entre entidades.

## 🎯 Objetivos da Modelagem

- **Cadastro de Clientes**: Gerenciar clientes físicos e jurídicos, com autenticação via CPF/CNPJ.
- **Gestão de Produtos**: Controle de estoque, fornecedores e vendedores.
- **Pedidos e Pagamentos**: Registro de pedidos, formas de pagamento e cálculo de frete.
- **Status e Entregas**: Acompanhamento de status de pedido e entregas.

## 🚀 Entidades Principais e Seus Atributos

### **Cliente**
- `idCliente` (PK)
- `Email`
- `Telefone`
- `Senha`
- `FK para Pessoa Física ou Pessoa Jurídica`

### **Pessoa Física**
- `idPessoaFisica` (PK)
- `Nome`
- `CPF`

### **Pessoa Jurídica**
- `idPessoaJuridica` (PK)
- `Nome Fantasia`
- `Razão Social`
- `CNPJ`

### **Endereço**
- `idEndereco` (PK)
- `Logradouro`
- `CEP`
- `Bairro`
- `Cidade`
- `Estado`
- `Tipo de Endereço (ENUM: Residencial, Comercial, Entrega)`

### **Pedido**
- `idPedido` (PK)
- `Data_Pedido`
- `Descrição`
- `FK para Cliente, Status Pedido e Forma de Pagamento`

### **Forma de Pagamento**
- `idFormaPagamento` (PK)
- `Tipo Pagamento`
- `Detalhes Pagamento`
- `Valor Total`

### **Status Pedido**
- `idStatusPedido` (PK)
- `Descrição (ENUM: Aguardando Pagamento, Em Transporte, Entregue)`
- `FK para Forma de Pagamento e Histórico de Entrega`

### **Entrega**
- `idEntrega` (PK)
- `Código de Rastreio`
- `Data Entrega`
- `FK para Status Pedido e Endereço de Entrega`

### **Produto**
- `idProduto` (PK)
- `Nome`
- `Descrição`
- `Preço`
- `Categoria`

### **Estoque**
- `idEstoque` (PK)
- `Local`
- `Quantidade`
- `FK para Produto`

- ### **Histórico de Entrega**
- `idHistoricoEntrega` (PK)
- `Status_Entrega`
- `Data_Entrega_Atualizacao`
- `FK para StatusPedido`
- `FK para Endereço`

---


## 🔗 Relacionamentos

- **Cliente e Pessoa Física/Jurídica**: Relacionamento 1:1 para garantir que um cliente seja uma pessoa física ou jurídica.
- **Pedido e Forma de Pagamento**: Relacionamento N:N através de uma tabela de ligação para permitir múltiplas formas de pagamento por pedido.
- **Endereço e Entidades**: Relacionamento 1:N, permitindo reutilização de endereços para clientes, fornecedores e entregas.
- **Fornecedor/Vendedor e Produto**: N:M, entre Fornecedor/Vendedor e Produto significa que um fornecedor ou vendedor pode fornecer muitos produtos, e um produto pode ser fornecido por vários fornecedores/vendedores.
- **Estoque e Produto**: N:M, um estoque pode conter vários produtos e um produto pode estar presente em vários estoques.
- **Pedido e Status Pedido**: 1:N, um pedido pode ter muitos status ao longo do seu ciclo (por exemplo: "Em andamento", "Pago", "Em transporte", "Entregue", etc.), mas cada status pertence a um único pedido.
- **Pedido e Entrega**: Relacionamento 1:N, um pedido pode ter muitas entregas.
- **Status Pedido e Histórico de Entrega**: Relacionamento 1:N, onde o status do pedido pode ser atualizado com o histórico de entrega.

---

