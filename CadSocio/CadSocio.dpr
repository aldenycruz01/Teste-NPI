program CadSocio;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uCadSocio in 'uCadSocio.pas' {frmCadSocio},
  uCadDependente in 'uCadDependente.pas' {frmCadDependente},
  uPesqSocio in 'uPesqSocio.pas' {frmPesquisarSocio},
  uPesquisarSocio in 'uPesquisarSocio.pas' {frmPesquisaDeSocio},
  uPesquisarDependente in 'uPesquisarDependente.pas' {frmPesquisaDeDependente},
  UDM in 'UDM.pas' {DM: TDataModule},
  uRelatorio in 'uRelatorio.pas' {frmRelatorio},
  uFichaCadastralSocio in 'uFichaCadastralSocio.pas' {frmFichaCadastralSocio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmRelatorio, frmRelatorio);
  Application.CreateForm(TfrmFichaCadastralSocio, frmFichaCadastralSocio);
  Application.Run;
end.
