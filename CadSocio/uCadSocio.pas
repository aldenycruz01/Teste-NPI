unit uCadSocio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Data.DB, Data.Win.ADODB, Vcl.Mask;

type
  TfrmCadSocio = class(TForm)
    Panel2: TPanel;
    PageControl2: TPageControl;
    TabSheet6: TTabSheet;
    Panel7: TPanel;
    Label6: TLabel;
    Panel11: TPanel;
    edtCodSocio: TEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    Label8: TLabel;
    Label1: TLabel;
    edtNomeSocio: TEdit;
    Label2: TLabel;
    cbSim: TCheckBox;
    cbNao: TCheckBox;
    Panel6: TPanel;
    btnSalvarPedido: TBitBtn;
    BitBtn9: TBitBtn;
    btnCadastro: TBitBtn;
    btnNovo: TBitBtn;
    aqrSocio: TADOQuery;
    edtRendaSocio: TEdit;
    aqrSocioID_SOCIO: TAutoIncField;
    aqrSocioNOME_SOCIO: TStringField;
    aqrSocioRENDA_SOCIO: TBCDField;
    btnAlterar: TBitBtn;
    btnSalvarAlteracao: TBitBtn;
    aqrSocioSTATUS: TBooleanField;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarPedidoClick(Sender: TObject);
    procedure edtRendaSocioClick(Sender: TObject);
    procedure edtRendaSocioChange(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure edtRendaSocioExit(Sender: TObject);
    procedure btnCadastroClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarAlteracaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

     function VirgPonto(Nume:string; TirarCaractere:char=','; ColocarCaractere:char='.'):String; overload;
      function VirgPonto(Nume:double; TirarCaractere:char=','; ColocarCaractere:char='.'):String; overload;
  public
    { Public declarations }
  end;

var
  frmCadSocio: TfrmCadSocio;

implementation

{$R *.dfm}

uses UDM, uCadDependente, uFichaCadastralSocio;

procedure TfrmCadSocio.BitBtn9Click(Sender: TObject);
begin
frmCadSocio.Close;
end;

procedure TfrmCadSocio.btnAlterarClick(Sender: TObject);
begin
btnSalvarAlteracao.Enabled := true;
edtNomeSocio.Enabled := true;
edtRendaSocio.Enabled := true;
edtRendaSocio.Enabled := true;
cbSim.Enabled := true;
cbNao.Enabled := true;



end;

procedure TfrmCadSocio.btnCadastroClick(Sender: TObject);
begin
 Application.CreateForm(TfrmCadDependente,frmCadDependente);
  frmCadDependente.ShowModal;
end;

procedure TfrmCadSocio.btnNovoClick(Sender: TObject);
begin
edtNomeSocio.Enabled := true;
edtRendaSocio.Enabled := true;
edtRendaSocio.Enabled := true;
cbSim.Enabled := true;
cbNao.Enabled := true;
btnSalvarPedido.Enabled :=true;

end;





function TfrmCadSocio.VirgPonto(Nume:string; TirarCaractere:char=','; ColocarCaractere:char='.'):String;
var
  i: integer;
begin
  if Trim(Nume) = '' then
    Nume := '0';
  i := Pos(TirarCaractere, Nume);
  if i > 0 then
    Nume[i] := ColocarCaractere;
  Result:=Nume;
end;

function TfrmCadSocio.VirgPonto(Nume:Double; TirarCaractere:char=','; ColocarCaractere:char='.'):String;
var
  Nume1:string;
  i: integer;
begin
  Nume1:=FloatToStr(Nume);
  i := Pos(TirarCaractere, Nume1);
  if i > 0 then
    Nume1[i] := ColocarCaractere;
  Result:=Nume1;
end;


procedure TfrmCadSocio.btnSalvarAlteracaoClick(Sender: TObject);
VAR
sit : BOOLEAN;
CodSocio : string;
valor : string;
begin
btnSalvarAlteracao.Enabled := false;
edtNomeSocio.Enabled := false;
edtRendaSocio.Enabled := false;
edtRendaSocio.Enabled := false;
cbSim.Enabled := false;
cbNao.Enabled := false;


     if cbsim.Checked then
     begin
     sit := TRUE;
     end;

     if cbNao.Checked then
     begin
     sit := FALSE ;
     end;

aqrSocio.Close;
aqrSocio.SQL.Clear;
aqrSocio.SQL.Add('UPDATE SOCIO SET NOME_SOCIO = '''+edtNomeSocio.Text+''', '+
' RENDA_SOCIO = '''+edtRendaSocio.Text+''', STATUS = '+BoolToStr(sit)+' WHERE  ID_SOCIO='''+edtCodSocio.Text+''' ');
aqrSocio.ExecSQL;

 aqrSocio.Close;
 aqrSocio.sql.Clear;
 aqrSocio.SQL.Add('SELECT ID_SOCIO,NOME_SOCIO, RENDA_SOCIO ,STATUS FROM SOCIO WHERE NOME_SOCIO LIKE '''+('%'+edtNomeSocio.Text+'%')+''' ');
 aqrSocio.open;

 valor:= aqrSocio.FieldByName('STATUS').AsString;

   if valor = 'True' then
      begin
      cbSim.Checked :=true
    end
 else
    begin
    cbNao.Checked := true;
   end;


 CodSocio := aqrSocio.FieldByName('ID_SOCIO').AsString;
 edtCodSocio.Text := CodSocio;
 edtNomeSocio.Text := aqrSocio.FieldByName('NOME_SOCIO').AsString;
 edtRendaSocio.Text := aqrSocio.FieldByName('RENDA_SOCIO').AsString;

ShowMessage('Altera��o realizada !');
end;

procedure TfrmCadSocio.btnSalvarPedidoClick(Sender: TObject);
VAR
sit : BOOLEAN;
CodSocio : string;
begin

if (cbSim.Checked = true) and (cbNao.Checked = true) then
raise Exception.Create('Marque apenas uma situa��o para o socio  !');

if (cbSim.Checked <> true) and (cbNao.Checked <> true) then
raise Exception.Create('Selecione a situa��o do socio  !');

if (edtNomeSocio.Text = '') or (edtRendaSocio.Text = '') then
raise Exception.Create('Preencha os dados do socio !');


     if cbsim.Checked then
     begin
     sit := TRUE;
     end;

     if cbNao.Checked then
     begin
     sit := FALSE ;
     end;



 aqrSocio.Close;
 aqrSocio.sql.Clear;
 aqrSocio.SQL.Add('INSERT INTO SOCIO (NOME_SOCIO, RENDA_SOCIO, STATUS) '+
 ' VALUES ('''+edtNomeSocio.Text+''','''+VirgPonto(edtRendaSocio.Text)+''','+BoolToStr(sit)+' ) ');
 aqrSocio.ExecSQL;

 aqrSocio.Close;
 aqrSocio.sql.Clear;
 aqrSocio.SQL.Add('SELECT ID_SOCIO,NOME_SOCIO, RENDA_SOCIO FROM SOCIO WHERE NOME_SOCIO LIKE '''+('%'+edtNomeSocio.Text+'%')+''' ');
 aqrSocio.open;

 CodSocio := aqrSocio.FieldByName('ID_SOCIO').AsString;
 edtCodSocio.Text := CodSocio;

 ShowMessage('Cadastro do socio realizado');
 btnCadastro.Enabled := true;


end;



procedure TfrmCadSocio.edtRendaSocioChange(Sender: TObject);
begin
 if edtRendaSocio.Text='' then
    begin
      edtRendaSocio.Text:='0';
      edtRendaSocio.SelectAll;
    end;
end;

procedure TfrmCadSocio.edtRendaSocioClick(Sender: TObject);
begin
edtRendaSocio.SelStart:=0;
end;

procedure TfrmCadSocio.edtRendaSocioExit(Sender: TObject);
begin
 edtRendaSocio.Text := FormatFloat(' ##0.00',strtofloat(edtRendaSocio.Text));
end;

procedure TfrmCadSocio.FormClose(Sender: TObject; var Action: TCloseAction);

var
valor : string;
begin
frmFichaCadastralSocio.aqrAuxiliar.Close;
frmFichaCadastralSocio.aqrAuxiliar.SQL.Clear;
frmFichaCadastralSocio.aqrAuxiliar.SQL.Add(' SELECT ID_SOCIO,NOME_SOCIO,RENDA_SOCIO,STATUS   '+
'FROM SOCIO WHERE ID_SOCIO = '''+frmFichaCadastralSocio.edtCodSocio.Text+''' ');
frmFichaCadastralSocio.aqrAuxiliar.Open;

frmFichaCadastralSocio.edtNomeSocio.Text := frmFichaCadastralSocio.aqrAuxiliar.FieldByName('NOME_SOCIO').AsString;
frmFichaCadastralSocio.edtRendaSocio.Text := frmFichaCadastralSocio.aqrAuxiliar.FieldByName('RENDA_SOCIO').AsString;

valor:= frmFichaCadastralSocio.aqrAuxiliar.FieldByName('STATUS').AsString;



    if valor = 'True' then
      begin

      frmFichaCadastralSocio.cbSim.Checked :=true ;
    end
 else
    begin

    frmFichaCadastralSocio.cbNao.Checked := true;
   end;

frmFichaCadastralSocio.aqrPesqSocio.Close;
frmFichaCadastralSocio.aqrPesqSocio.SQL.Clear;
frmFichaCadastralSocio.aqrPesqSocio.SQL.Add(' SELECT ID_DEPENDENTE, NOME_DEPENDENTE,IDADE_DEPENDENTE  '+
'FROM DEPENDENTE WHERE ID_SOCIO = '''+frmFichaCadastralSocio.edtCodSocio.Text+''' ');
frmFichaCadastralSocio.aqrPesqSocio.Open;


end;


procedure TfrmCadSocio.FormShow(Sender: TObject);
begin
     frmFichaCadastralSocio.cbSim.Checked :=false;
      frmFichaCadastralSocio.cbNao.Checked := false;

end;

end.
