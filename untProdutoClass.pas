unit untProdutoClass;

interface

uses uniProdutoInterface;

type
  TProduto = class(TInterfacedObject, IProduto)
  private
    FNome: string;
    FPreco: Currency;
  public
    constructor Create(const ANome: string; APreco: Currency);
    function GetNome: string;
    function GetPreco: Currency;
    procedure AplicarDesconto(const APercentual: Double);
  end;

implementation

constructor TProduto.Create(const ANome: string; APreco: Currency);
begin
  FNome := ANome;
  FPreco := APreco;
end;

function TProduto.GetNome: string;
begin
  Result := FNome;
end;

function TProduto.GetPreco: Currency;
begin
  Result := FPreco;
end;

procedure TProduto.AplicarDesconto(const APercentual: Double);
var
  Desconto: Currency;
begin
  Desconto := FPreco * (APercentual / 100);
  FPreco := FPreco - Desconto;
  if FPreco < 0 then
    FPreco := 0;
end;

end.
