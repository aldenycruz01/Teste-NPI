unit uFichaCadastralSocio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmFichaCadastralSocio = class(TForm)
    Panel2: TPanel;
    PageControl2: TPageControl;
    TabSheet6: TTabSheet;
    Panel7: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Panel11: TPanel;
    edtCodSocio: TEdit;
    edtNomeSocio: TEdit;
    cbSim: TCheckBox;
    cbNao: TCheckBox;
    edtRendaSocio: TEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    BitBtn9: TBitBtn;
    aqrSocio: TADOQuery;
    aqrSocioID_SOCIO: TAutoIncField;
    aqrSocioNOME_SOCIO: TStringField;
    aqrSocioRENDA_SOCIO: TBCDField;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    aqrPesqSocio: TADOQuery;
    DBGrid2: TDBGrid;
    dsPesqSocio: TDataSource;
    Panel8: TPanel;
    BitBtn1: TBitBtn;
    btnAdicionar: TBitBtn;
    btnAlterar: TBitBtn;
    aqrAuxiliar: TADOQuery;
    aqrAuxiliarID_SOCIO: TAutoIncField;
    aqrAuxiliarNOME_SOCIO: TStringField;
    aqrAuxiliarRENDA_SOCIO: TBCDField;
    aqrAuxiliarSTATUS: TBooleanField;
    aqrPesqSocioID_DEPENDENTE: TAutoIncField;
    aqrPesqSocioNOME_DEPENDENTE: TStringField;
    aqrPesqSocioIDADE_DEPENDENTE: TIntegerField;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFichaCadastralSocio: TfrmFichaCadastralSocio;

implementation

{$R *.dfm}

uses UDM, uCadDependente, uCadSocio, uPesquisarSocio;

procedure TfrmFichaCadastralSocio.BitBtn1Click(Sender: TObject);
begin
aqrAuxiliar.Close;
aqrAuxiliar.SQL.Clear;
aqrAuxiliar.SQL.Add('DELETE FROM DEPENDENTE WHERE ID_DEPENDENTE = '''+DBGrid1.Columns[0].Field.AsString+'''  ');
aqrAuxiliar.ExecSQL;

aqrPesqSocio.Close;
aqrPesqSocio.SQL.Clear;
aqrPesqSocio.SQL.Add(' SELECT ID_DEPENDENTE, NOME_DEPENDENTE,IDADE_DEPENDENTE  '+
'FROM DEPENDENTE WHERE ID_SOCIO = '''+edtCodSocio.Text+''' ');
aqrPesqSocio.Open;

ShowMessage('Dependente Deletado');


end;

procedure TfrmFichaCadastralSocio.BitBtn2Click(Sender: TObject);
begin

 Application.CreateForm(TfrmCadSocio,frmCadSocio);
 frmCadSocio.edtCodSocio.Text := frmFichaCadastralSocio.edtCodSocio.Text;
 frmCadSocio.edtNomeSocio.Text := frmFichaCadastralSocio.edtNomeSocio.Text;
 frmCadSocio.edtRendaSocio.Text := frmFichaCadastralSocio.edtRendaSocio.Text;
 frmCadSocio.cbSim.Checked := frmFichaCadastralSocio.cbSim.Checked;
 frmCadSocio.cbNao.Checked := frmFichaCadastralSocio.cbNao.Checked;

 frmCadSocio.btnSalvarPedido.Visible := false;
 frmCadSocio.btnCadastro.Visible := false;
 frmCadSocio.btnNovo.Visible := false;
 frmCadSocio.btnAlterar.Visible := true;
 frmCadSocio.btnSalvarAlteracao.Visible := true;

 frmCadSocio.ShowModal;

end;

procedure TfrmFichaCadastralSocio.BitBtn3Click(Sender: TObject);
begin

if MessageDlg('Deseja Realmente Excluir o Socio e Dependentes ?',
   mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
   begin
aqrSocio.Close;
aqrSocio.SQL.Clear;
aqrSocio.SQL.Add('DELETE FROM SOCIO WHERE ID_SOCIO = '''+edtCodSocio.Text+''' ');
aqrSocio.ExecSQL;
aqrSocio.Close;
aqrSocio.SQL.Clear;
aqrSocio.SQL.Add('DELETE FROM DEPENDENTE WHERE ID_SOCIO = '''+edtCodSocio.Text+''' ');
aqrSocio.ExecSQL

   end
 else
 begin

 end;

 ShowMessage('Realizado a exclus?o !');
 frmPesquisaDeSocio.btnPesquisar.Click;
 close;



end;

procedure TfrmFichaCadastralSocio.btnAdicionarClick(Sender: TObject);
begin
 Application.CreateForm(TfrmCadDependente,frmCadDependente);
 frmCadDependente.edtCodSocio.Text := frmFichaCadastralSocio.edtCodSocio.Text;
 frmCadDependente.ShowModal;
end;

procedure TfrmFichaCadastralSocio.btnAlterarClick(Sender: TObject);
begin

Application.CreateForm(TfrmCadDependente,frmCadDependente);

frmCadDependente.btnNovo.Visible:=false;
frmCadDependente.btnSalvarPedido.Visible:=false;
frmCadDependente.btnAlterar.Visible:=true;
frmCadDependente.btnAlterar.Enabled:=true;
frmCadDependente.btnSalvarAlteracao.Visible:=true;

frmCadDependente.edtCodDepen.Text := aqrPesqSocio.FieldByName('ID_DEPENDENTE').AsString;
frmCadDependente.edtNomeDepen.Text := aqrPesqSocio.FieldByName('NOME_DEPENDENTE').AsString;
frmCadDependente.edtIdadeDepen.Text := aqrPesqSocio.FieldByName('IDADE_DEPENDENTE').AsString;
frmCadDependente.ShowModal;

end;

procedure TfrmFichaCadastralSocio.FormShow(Sender: TObject);
var
valor : string;
begin
aqrPesqSocio.Active := true;

aqrAuxiliar.Close;
aqrAuxiliar.SQL.Clear;
aqrAuxiliar.SQL.Add(' SELECT ID_SOCIO,NOME_SOCIO,RENDA_SOCIO,STATUS   '+
'FROM SOCIO WHERE ID_SOCIO = '''+edtCodSocio.Text+''' ');
aqrAuxiliar.Open;

edtNomeSocio.Text := aqrAuxiliar.FieldByName('NOME_SOCIO').AsString;
edtRendaSocio.Text := aqrAuxiliar.FieldByName('RENDA_SOCIO').AsString;

valor:= aqrAuxiliar.FieldByName('STATUS').AsString;



    if valor = 'True' then
      begin
      cbSim.Checked :=true
    end
 else
    begin
    cbNao.Checked := true;
   end;

aqrPesqSocio.Close;
aqrPesqSocio.SQL.Clear;
aqrPesqSocio.SQL.Add(' SELECT ID_DEPENDENTE, NOME_DEPENDENTE,IDADE_DEPENDENTE  '+
'FROM DEPENDENTE WHERE ID_SOCIO = '''+edtCodSocio.Text+''' ');
aqrPesqSocio.Open;


end;

end.
