program SCANNER_7188;

uses
  Forms,
  PRINCIPAL in 'PRINCIPAL.pas' {frmPRINCIPAL},
  DM_MSSQL in 'DM_MSSQL.pas' {DM: TDataModule},
  FUNCTIONS in 'FUNCTIONS.pas',
  MSG_ERRO in 'MSG_ERRO.pas' {frmMSG_ERRO},
  MSG_PADRAO in 'MSG_PADRAO.pas' {frmMSG_PADRAO},
  MSG_QUESTION in 'MSG_QUESTION.pas' {frmMSG_QUESTION},
  MSG_WARNING in 'MSG_WARNING.pas' {frmMSG_WARNING},
  SETUP in 'SETUP.pas' {frmSETUP},
  CAD_PRODUTOS in 'CAD_PRODUTOS.pas' {frmCAD_PRODUTOS},
  CAD_COLABORADORES in 'CAD_COLABORADORES.pas' {frmCAD_COLABORADORES},
  PROD_PRINT in 'PROD_PRINT.pas' {frmPROD_PRINT};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Leitura Código de Barras';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPRINCIPAL, frmPRINCIPAL);
  Application.Run;
end.
