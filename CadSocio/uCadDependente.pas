unit uCadDependente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, Data.DB, Data.Win.ADODB;

type
  TfrmCadDependente = class(TForm)
    Panel2: TPanel;
    PageControl2: TPageControl;
    TabSheet6: TTabSheet;
    Panel7: TPanel;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Panel11: TPanel;
    edtCodSocio: TEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    btnSalvarPedido: TBitBtn;
    BitBtn9: TBitBtn;
    btnPesquisar: TBitBtn;
    Panel4: TPanel;
    edtCodDepen: TEdit;
    edtIdadeDepen: TEdit;
    edtNomeDepen: TEdit;
    Label3: TLabel;
    btnNovo: TBitBtn;
    aqrDependente: TADOQuery;
    aqrDependenteID_DEPENDENTE: TAutoIncField;
    aqrDependenteID_SOCIO: TIntegerField;
    aqrDependenteNOME_DEPENDENTE: TStringField;
    aqrDependenteIDADE_DEPENDENTE: TIntegerField;
    btnAlterar: TBitBtn;
    btnSalvarAlteracao: TBitBtn;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarPedidoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarAlteracaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadDependente: TfrmCadDependente;

implementation

{$R *.dfm}

uses uPesqSocio, UDM, uFichaCadastralSocio;

procedure TfrmCadDependente.BitBtn9Click(Sender: TObject);
begin
frmCadDependente.Close;
end;

procedure TfrmCadDependente.btnAlterarClick(Sender: TObject);
begin
edtNomeDepen.Enabled:=true;
edtIdadeDepen.Enabled:=true;
btnSalvarAlteracao.Enabled:=true;

end;

procedure TfrmCadDependente.btnNovoClick(Sender: TObject);
begin
edtNomeDepen.Enabled := true;
edtIdadeDepen.Enabled := true;
edtCodSocio.Enabled := true;
btnPesquisar.Enabled := true;
btnSalvarPedido.Enabled := true;
end;

procedure TfrmCadDependente.btnPesquisarClick(Sender: TObject);
begin
Application.CreateForm(TfrmPesquisarSocio,frmPesquisarSocio);
frmPesquisarSocio.ShowModal;
end;

procedure TfrmCadDependente.btnSalvarAlteracaoClick(Sender: TObject);
begin
aqrDependente.Close;
aqrDependente.SQL.Clear;
aqrDependente.SQL.Add('UPDATE DEPENDENTE SET NOME_DEPENDENTE = '''+edtNomeDepen.Text+''', '+
' IDADE_DEPENDENTE = '''+edtIdadeDepen.Text+''' WHERE ID_DEPENDENTE= '''+edtCodDepen.Text+''' ');
aqrDependente.ExecSQL;

ShowMessage('Altera��o realizada !');


end;

procedure TfrmCadDependente.btnSalvarPedidoClick(Sender: TObject);
var
CodDepen : string;

begin

if (edtNomeDepen.Text = '') and (edtIdadeDepen.Text = '') then
 raise Exception.Create('Por gentileza preencher campos vazios !');


if (edtCodSocio.Text = '') then
 raise Exception.Create('Selecione o Socio responsavel pelo Dependente !');


 aqrDependente.Close;
 aqrDependente.SQL.Clear;
 aqrDependente.SQL.Add('INSERT INTO DEPENDENTE (ID_SOCIO, NOME_DEPENDENTE, IDADE_DEPENDENTE) '+
 'VALUES ( '''+edtCodSocio.Text+''', '''+edtNomeDepen.Text+''', '''+edtIdadeDepen.Text+''' )  ');
 aqrDependente.ExecSQL;

 aqrDependente.Close;
 aqrDependente.SQL.Clear;
 aqrDependente.SQL.Add('SELECT ID_SOCIO,ID_DEPENDENTE,NOME_DEPENDENTE ,IDADE_DEPENDENTE FROM DEPENDENTE '+
 'WHERE NOME_DEPENDENTE LIKE '''+('%'+edtNomeDepen.Text+'%')+'''');
 aqrDependente.Open;

 CodDepen := aqrDependente.FieldByName('ID_DEPENDENTE').AsString;
 edtCodDepen.Text := CodDepen;





 ShowMessage('Realizado o cadastro do dependenente ');


end;

procedure TfrmCadDependente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

frmFichaCadastralSocio.aqrPesqSocio.Close;
frmFichaCadastralSocio.aqrPesqSocio.SQL.Clear;
frmFichaCadastralSocio.aqrPesqSocio.SQL.Add(' SELECT ID_DEPENDENTE, NOME_DEPENDENTE,IDADE_DEPENDENTE  '+
'FROM DEPENDENTE WHERE ID_SOCIO = '''+edtCodSocio.Text+''' ');
frmFichaCadastralSocio.aqrPesqSocio.Open;

end;

end.
