object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Teste com Interfaces'
  ClientHeight = 624
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 732
    Height = 73
    Align = alTop
    TabOrder = 0
    TabStop = True
    object lblProduto: TLabel
      Left = 8
      Top = 8
      Width = 107
      Height = 15
      Caption = 'Produto (descri'#231#227'o):'
    end
    object lblValor: TLabel
      Left = 308
      Top = 8
      Width = 29
      Height = 15
      Caption = 'Valor:'
    end
    object lblDesconto: TLabel
      Left = 383
      Top = 8
      Width = 74
      Height = 15
      Caption = 'Desconto (%):'
    end
    object btnIncluir: TButton
      Left = 462
      Top = 29
      Width = 120
      Height = 25
      Caption = 'Incluir Produto'
      TabOrder = 3
      OnClick = btnIncluirClick
    end
    object edtProduto: TEdit
      Left = 8
      Top = 29
      Width = 289
      Height = 23
      TabOrder = 0
      Text = 'edtProduto'
      OnKeyDown = edtProdutoKeyDown
    end
    object edtValor: TEdit
      Left = 308
      Top = 29
      Width = 65
      Height = 23
      Alignment = taRightJustify
      MaxLength = 10
      TabOrder = 1
      Text = '0'
      OnKeyDown = edtProdutoKeyDown
    end
    object btnExcluir: TButton
      Left = 588
      Top = 29
      Width = 120
      Height = 25
      Caption = 'Excluir Selecionado'
      TabOrder = 4
      TabStop = False
      OnClick = btnExcluirClick
    end
    object edtDesconto: TEdit
      Left = 383
      Top = 29
      Width = 65
      Height = 23
      Alignment = taRightJustify
      MaxLength = 6
      TabOrder = 2
      Text = '0'
      OnKeyDown = edtProdutoKeyDown
    end
  end
  object grdItensPedido: TStringGrid
    Left = 0
    Top = 73
    Width = 732
    Height = 510
    Align = alClient
    TabOrder = 1
    ColWidths = (
      64
      363
      64
      64
      64)
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 583
    Width = 732
    Height = 41
    Align = alBottom
    TabOrder = 2
    object lblTotal: TLabel
      Left = 502
      Top = 10
      Width = 85
      Height = 15
      Caption = 'Total do Pedido:'
    end
    object edtTotalPedido: TEdit
      Left = 595
      Top = 6
      Width = 121
      Height = 23
      TabStop = False
      Alignment = taRightJustify
      ParentColor = True
      ReadOnly = True
      TabOrder = 0
      Text = 'edtTotalPedido'
    end
  end
end
