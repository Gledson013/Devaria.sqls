CREATE TABLE
	Marcas
	(
		Codigo int identity(1,1),
		Nome varchar(100),
		Descricao ntext
		CONSTRAINT PK_Marcas PRIMARY KEY (Codigo)
	)

CREATE TABLE
	Produtos
	(
		Codigo int identity(1,1),
		Nome varchar(50),
		Descricao varchar(255),
		Codigo_Marca int,
		CONSTRAINT PK_Produtos PRIMARY KEY (Codigo),
		CONSTRAINT FK_Produtos_Marcas FOREIGN KEY (Codigo_Marca) REFERENCES Marcas(Codigo)
	)
CREATE TABLE Clientes
(
	Codigo int Identity (1,1),
	CPF CHAR(11),
	Nome VARCHAR(40),
	Email Varchar(40),
	Telefone CHAR(11),
	Celular CHAR(11),
	CEP CHAR(8),
	Logradouro Varchar(40),
	Estado CHAR(2),
	Cidade Varchar(35),
	CONSTRAINT PK_CodigoCliente PRIMARY KEY (Codigo)
)

CREATE TABLE Fidelidade
(
	Codigo_Cliente int,
	Data_Adesao DATETIME,
	Pontos INT,
	CONSTRAINT PK_CodigoClienteFidelidade PRIMARY KEY (Codigo_Cliente),
	CONSTRAINT FK_CodigoCliente_Fidelidade FOREIGN KEY (Codigo_Cliente) REFERENCES Clientes(Codigo)
)

CREATE TABLE Formas_Pagamento
(
	Codigo INT IDENTITY (1,1),
	Nome Varchar(25),
	Tipo Varchar(25),
	CONSTRAINT PK_CodigoPagamento PRIMARY KEY (Codigo)
)

CREATE TABLE Pedidos_Venda
(
	Codigo INT IDENTITY (1,1),
	Valor DECIMAL (6,2),
	Valor_Imposto DECIMAL (6,2),
	Data DATETIME,
	Codigo_Forma_Pagamento INT,
	Codigo_Cliente INT,
	CONSTRAINT PK_CodigoVenda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoFormaPagamento FOREIGN KEY (Codigo_Forma_Pagamento) REFERENCES Formas_Pagamento(Codigo),
	CONSTRAINT FK_CodigoCliente FOREIGN KEY (Codigo_Cliente) REFERENCES Clientes(Codigo)
)
CREATE TABLE Itens_Pedidos_Venda
(
	Codigo INT IDENTITY (1,1),
	Valor_Total DECIMAL (6,2),
	Valor_Imposto DECIMAL (6,2),
	Valor_Unitario DECIMAL(6,2),
	Quantidade INT,
	Codigo_Produto INT,
	Codigo_Pedido_Venda INT,
	CONSTRAINT PK_CodigoPedidoVenda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoProdutoVenda FOREIGN KEY (Codigo_Produto) REFERENCES Produtos(Codigo),
	CONSTRAINT FK_CodigoVenda FOREIGN KEY (Codigo_Pedido_Venda) REFERENCES Pedidos_Venda(Codigo)
)

CREATE TABLE Distribuidores
(
	Codigo INT IDENTITY(1,1),
	CNPJ VARCHAR(14),
	Nome_Fantasia VARCHAR(40),
	Razao_Social VARCHAR(40),
	CEP CHAR(8),
	Logradouro VARCHAR(40),
	Estado CHAR(2),
	Cidade VARCHAR(35),
	CONSTRAINT PK_CodigoDistribuidor PRIMARY KEY (Codigo)
)

CREATE TABLE Pedidos_Compra
(
	Codigo INT IDENTITY(1,1),
	Data DATETIME,
	Valor DECIMAL(6,2),
	Entregue BIT,
	ValorUnitario DECIMAL(6,2),
	Codigo_Distribuidor INT,
	CONSTRAINT PK_CodigoPedido_Venda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoDistribuidor FOREIGN KEY (Codigo_Distribuidor) REFERENCES Distribuidores(Codigo)
)


CREATE TABLE Itens_Pedidos_Compra
(
	Codigo INT IDENTITY(1,1),
	ValorTotal DECIMAL(6,2),
	ValorUnitario DECIMAL(6,2),
	Quantidade INT,
	Codigo_Produto INT,
	Codigo_Pedido_Compra INT,
	CONSTRAINT PK_CodigoItemPedidoVenda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoProdutoCompra FOREIGN KEY (Codigo_Produto) REFERENCES Produtos(Codigo),
	CONSTRAINT FK_CodigoPedidoCompraItem FOREIGN KEY (Codigo_Pedido_Compra) REFERENCES Pedidos_Compra(Codigo),
)

