unit uniPedidoInterface;

interface

uses uniProdutoInterface;

type
  IPedido = interface
    ['{B8DAB446-62A9-4E76-9A72-605F5EC79352}']
    procedure AdicionarProduto(const AProduto: IProduto);
    procedure RemoverProduto(const AProduto: IProduto);
    function CalcularTotal: Currency;
  end;

implementation

end.
