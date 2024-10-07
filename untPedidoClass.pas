unit untPedidoClass;

interface

uses System.Generics.Collections, uniPedidoInterface, uniProdutoInterface;

type
  TPedido = class(TInterfacedObject, IPedido)
  private
    FProdutos: TList<IProduto>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AdicionarProduto(const AProduto: IProduto);
    procedure RemoverProduto(const AProduto: IProduto);
    function CalcularTotal: Currency;
    property Produtos: TList<IProduto> read FProdutos;
  end;

implementation

constructor TPedido.Create;
begin
  FProdutos := TList<IProduto>.Create;
end;

destructor TPedido.Destroy;
begin
  FProdutos.Free;
  inherited;
end;

procedure TPedido.AdicionarProduto(const AProduto: IProduto);
begin
  FProdutos.Add(AProduto);
end;

procedure TPedido.RemoverProduto(const AProduto: IProduto);
begin
  FProdutos.Remove(AProduto);
end;

function TPedido.CalcularTotal: Currency;
var
  Produto: IProduto;
  Total: Currency;
begin
  Total := 0;
  for Produto in FProdutos do
    Total := Total + Produto.GetPreco;
  Result := Total;
end;

end.
