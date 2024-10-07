Projeto que demonstra o uso de interfaces e conceitos de orientação a objetos no Delphi.

1.	Criado interface IProduto com os seguintes métodos:
	GetNome: Retorna o nome do produto.
	GetPreco: Retorna o preço do produto.
	AplicarDesconto: Recebe um percentual de desconto e aplica ao preço do produto.
2.	Criado a classe TProduto que implementa a interface IProduto:
	A classe contém os atributos Nome e Preço.
	Implementar os métodos da interface.
	Incluido lógica no método AplicarDesconto para garantir que o preço não fique negativo.
3.	Criado uma interface IPedido com os métodos:
	AdicionarProduto: Adiciona um produto ao pedido.
	RemoverProduto: Remove um produto do pedido.
	CalcularTotal: Calcula o total do pedido considerando possíveis descontos nos produtos.
4.	Criado uma classe TPedido que implementa a interface IPedido:
	A classe contém uma lista de produtos (uma lista de objetos que implementam a interface IProduto).
	Implementado os métodos da interface.
	O método CalcularTotal soma os preços dos produtos da lista e retorna o valor total do pedido.
