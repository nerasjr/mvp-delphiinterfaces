unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls,
  untProdutoClass, untPedidoClass, uniPedidoInterface, uniProdutoInterface;

type
  TfrmPrincipal = class(TForm)
    pnlTop: TPanel;
    btnIncluir: TButton;
    grdItensPedido: TStringGrid;
    lblProduto: TLabel;
    lblValor: TLabel;
    lblDesconto: TLabel;
    edtProduto: TEdit;
    edtValor: TEdit;
    btnExcluir: TButton;
    pnlBottom: TPanel;
    edtTotalPedido: TEdit;
    lblTotal: TLabel;
    edtDesconto: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edtProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FPedido: TPedido;
    procedure LimparGrid;
    procedure ClearEdits;
    procedure IncluirProduto;
    procedure ExcluirProduto;
    function EncontrarProdutoPorNome(const NomeProduto: string): IProduto;
    function VerificaValor(): Boolean;
    procedure RemoverLinhaDaGrid(ALinha: Integer);
    procedure AtualizaNroItemGrid;
    procedure IniciaPedido;
    procedure MostrarTotal;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AtualizaNroItemGrid;
var
  i: Integer;
begin
  for i := 1 to grdItensPedido.RowCount do
  begin
    grdItensPedido.Cells[0, i] := IntToStr(i);
  end;
end;

procedure TfrmPrincipal.btnExcluirClick(Sender: TObject);
begin
  ExcluirProduto;
end;

procedure TfrmPrincipal.btnIncluirClick(Sender: TObject);
begin
  IncluirProduto;
end;

procedure TfrmPrincipal.ClearEdits;
var
  i: Integer;
begin
  for i := 0 to Pred(frmPrincipal.ComponentCount) do
  begin
    if (frmPrincipal.Components[i] is TEdit) then
      TEdit(frmPrincipal.Components[i]).Clear;
  end;
  edtValor.Text := '0';
  edtDesconto.Text := '0';
end;

procedure TfrmPrincipal.edtProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key in [VK_RETURN, VK_TAB]) then
  begin
    SelectNext(ActiveControl, TRUE, TRUE);
    Key := 0;
  end;
end;

function TfrmPrincipal.EncontrarProdutoPorNome(
  const NomeProduto: string): IProduto;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to FPedido.Produtos.Count - 1 do
  begin
    if FPedido.Produtos[i].GetNome = NomeProduto then
    begin
      Result := FPedido.Produtos[i];
      Exit;
    end;
  end;
end;

procedure TfrmPrincipal.ExcluirProduto;
var
  SelectedRow: Integer;
  Produto: IProduto;
begin
  SelectedRow := grdItensPedido.Row;
  if (SelectedRow > 0) and (SelectedRow < grdItensPedido.RowCount) then
  begin
    Produto := EncontrarProdutoPorNome(grdItensPedido.Cells[1, SelectedRow]);
    if Produto <> nil then
    begin
      FPedido.RemoverProduto(Produto);
      RemoverLinhaDaGrid(SelectedRow);
      MostrarTotal;
    end;
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal := nil;
  Application.Terminate;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FPedido := TPedido.Create;
  LimparGrid;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  IniciaPedido;
end;

procedure TfrmPrincipal.IncluirProduto;
var
  Produto: IProduto;
  row: integer;
  Valor, Desconto: Real;
begin
  if EncontrarProdutoPorNome(edtProduto.Text) <> nil then
  begin
    ShowMessage('Produto já existe no pedido!');
    edtProduto.SetFocus;
    Exit;
  end;
  if VerificaValor then
  begin
    Valor := StrToFloat(edtValor.Text);
    Desconto := StrToFloat(edtDesconto.Text);

    Produto := TProduto.Create(edtProduto.Text, Valor);
    FPedido.AdicionarProduto(Produto);
    if Desconto > 0 then
      Produto.AplicarDesconto(Desconto);

    row := grdItensPedido.RowCount;
    grdItensPedido.RowCount := row + 1;
    grdItensPedido.RowCount := FPedido.Produtos.Count + 1;
    grdItensPedido.Cells[0, row] := IntToStr(row);
    grdItensPedido.Cells[1, row] := edtProduto.Text;
    grdItensPedido.Cells[2, row] := FormatFloat('0.00', Valor);
    grdItensPedido.Cells[3, row] := FormatFloat('0.00', Desconto);
    grdItensPedido.Cells[4, row] := FormatFloat('0.00', Produto.GetPreco);
      IniciaPedido;
  end;
end;

procedure TfrmPrincipal.IniciaPedido;
begin
  ClearEdits;
  MostrarTotal;
  edtProduto.SetFocus;
end;

procedure TfrmPrincipal.LimparGrid;
begin
  ClearEdits;
  grdItensPedido.RowCount := 0;
  grdItensPedido.Cells[0, 0] := '#';
  grdItensPedido.Cells[1, 0] := 'Produto Descrição';
  grdItensPedido.Cells[2, 0] := 'Valor';
  grdItensPedido.Cells[3, 0] := 'Desconto';
  grdItensPedido.Cells[4, 0] := 'Total';
end;

procedure TfrmPrincipal.MostrarTotal;
begin
  edtTotalPedido.Text := FormatFloat('0.00', FPedido.CalcularTotal);
end;

procedure TfrmPrincipal.RemoverLinhaDaGrid(ALinha: Integer);
var
  i: Integer;
begin
  if (ALinha >= 1) and (ALinha < grdItensPedido.RowCount) then
  begin
    for i := ALinha to grdItensPedido.RowCount - 2 do
      grdItensPedido.Rows[i] := grdItensPedido.Rows[i + 1];
    grdItensPedido.RowCount := grdItensPedido.RowCount - 1;
    AtualizaNroItemGrid;
  end;
end;

function TfrmPrincipal.VerificaValor: Boolean;
begin
  Result := False;
  try
    if StrToFloat(edtValor.Text) <= 0 then
    begin
      ShowMessage('Valor Inválido');
      edtValor.SetFocus;
    end
    else
      Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Valor Inválido' + #10#13 + E.Message);
      edtValor.SetFocus;
    end
    else
      Result := True;
  end;
  if Result then
  begin
    Result := False;
    try
      if (StrToFloat(edtDesconto.Text) < 0) or (StrToFloat(edtDesconto.Text) >= 100) then
      begin
        ShowMessage('Desconto Inválido');
        edtDesconto.SetFocus;
      end
      else
        Result := True;
    except
      on E: Exception do
      begin
        ShowMessage('Desconto Inválido' + #10#13 + E.Message);
        edtDesconto.SetFocus;
      end
      else
        Result := True;
    end;
  end;
end;

end.
