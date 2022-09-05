unit uPesqSocio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.Win.ADODB;

type
  TfrmPesquisarSocio = class(TForm)
    Panel1: TPanel;
    edtPesquisar: TEdit;
    btnPesquisar: TBitBtn;
    btnConfCli: TBitBtn;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    aqrPesqSocio: TADOQuery;
    dsPesqSocio: TDataSource;
    aqrPesqSocioID_SOCIO: TAutoIncField;
    aqrPesqSocioNOME_SOCIO: TStringField;
    procedure btnConfCliClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisarSocio: TfrmPesquisarSocio;

implementation

{$R *.dfm}

uses uCadDependente, UDM;

procedure TfrmPesquisarSocio.btnConfCliClick(Sender: TObject);
begin
  if DBGrid1.Columns[0].Field.AsString='' then
    raise Exception.Create('Selecione um Socio!')
  else
    begin
      frmCadDependente.edtCodSocio.Text:=DBGrid1.Columns[0].Field.AsString;
      Close;
    end;
end;

procedure TfrmPesquisarSocio.btnPesquisarClick(Sender: TObject);
begin

aqrPesqSocio.Close;
aqrPesqSocio.SQL.Clear;
aqrPesqSocio.SQL.Add('SELECT ID_SOCIO, NOME_SOCIO '+
' FROM SOCIO WHERE NOME_SOCIO LIKE '''+('%'+edtPesquisar.Text+'%')+'''');
aqrPesqSocio.Open;
end;

procedure TfrmPesquisarSocio.FormShow(Sender: TObject);
begin
aqrPesqSocio.Active := true;
end;

end.
