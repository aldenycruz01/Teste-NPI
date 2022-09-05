unit uPesquisarDependente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.Win.ADODB;

type
  TfrmPesquisaDeDependente = class(TForm)
    Panel1: TPanel;
    edtPesquisar: TEdit;
    btnPesquisar: TBitBtn;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btnAlterar: TBitBtn;
    cmbFiltros: TComboBox;
    aqrDependente: TADOQuery;
    dsDependente: TDataSource;
    aqrDependenteNOME_SOCIO: TStringField;
    aqrDependenteSITUACAO: TStringField;
    aqrDependenteNOME_DEPENDENTE: TStringField;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaDeDependente: TfrmPesquisaDeDependente;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmPesquisaDeDependente.btnPesquisarClick(Sender: TObject);
var
sBase : string;
begin

sbase := 'SELECT NOME_SOCIO,CASE WHEN T1.STATUS = 1 THEN ''ATIVO'' ELSE ''DESATIVADO'' END AS SITUACAO, NOME_DEPENDENTE  '+
' FROM SOCIO AS T1  '+
'INNER JOIN DEPENDENTE  AS T2 ON  T1.ID_SOCIO = T2.ID_SOCIO WHERE  ';


if cmbFiltros.Text = '' then
raise Exception.Create('Selecione uma op��o de filtro!');



if cmbFiltros.Text = 'Nome Socio' then
begin

  sBase := sBase + ' NOME_SOCIO  LIKE '''+('%'+edtPesquisar.Text+'%')+''' '

end
else
 begin
   sBase := sBase + ' NOME_DEPENDENTE  LIKE '''+('%'+edtPesquisar.Text+'%')+''' '
 end;


 aqrDependente.Close;
 aqrDependente.SQL.Clear;
 aqrDependente.SQL.Add(sBase);
 aqrDependente.Open;

end;

procedure TfrmPesquisaDeDependente.FormShow(Sender: TObject);
begin
aqrDependente.Active := true ;
end;

end.
