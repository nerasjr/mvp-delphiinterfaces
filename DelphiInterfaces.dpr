program DelphiInterfaces;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  uniProdutoInterface in 'uniProdutoInterface.pas',
  untProdutoClass in 'untProdutoClass.pas',
  uniPedidoInterface in 'uniPedidoInterface.pas',
  untPedidoClass in 'untPedidoClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
