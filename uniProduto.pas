unit uniProduto;

interface
type
  IProduto = interface
    ['{A1E5A0C9-5D8E-40A9-B3A9-C7C29B1C7EB5}']
    function GetNome: string;
    function GetPreco: Currency;
    procedure AplicarDesconto(Percentual: Double);
  end;


implementation

end.
