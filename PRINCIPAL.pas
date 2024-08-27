unit PRINCIPAL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp, TecComps, tecserial, teclink, ExtCtrls, Menus, ComCtrls, pngimage, Teclogo, jpeg, Grids, Wwdbigrd, Wwdbgrid, DB,
  Wwdatsrc, ADODB, TecQueryADO, wwdbdatetimepicker, wwdblook;

type
  TfrmPRINCIPAL = class(TForm)
    pnComunic: TPanel;
    txtComunic: TMemo;
    Label2: TLabel;
    cmdLimpar: TButton;
    cmdDesconectar: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    MainMenu: TMainMenu;
    Cadastros1: TMenuItem;
    mnuCad_Produtos: TMenuItem;
    Teclogo: TTeclogo;
    StatusBar: TStatusBar;
    Image1: TImage;
    Label4: TLabel;
    txtLinha: TEdit;
    txtProduto: TEdit;
    Label8: TLabel;
    imgRede_OFF: TImage;
    imgRede_ON: TImage;
    dbgCOLETA_PRODUCAO: TwwDBGrid;
    COLETA_PRODUCAO: TTecQueryADO;
    dsCOLETA_PRODUCAO: TwwDataSource;
    COLETA_PRODUCAOC_DTHR_INI_PROD: TDateTimeField;
    COLETA_PRODUCAOC_DTHR_FIM_PROD: TDateTimeField;
    COLETA_PRODUCAOC_COD_EAN13: TStringField;
    COLETA_PRODUCAOC_LINHA: TStringField;
    COLETA_PRODUCAOC_QTD_LIDA: TIntegerField;
    COLETA_PRODUCAOC_QTD_OK: TIntegerField;
    COLETA_PRODUCAOC_QTD_NK: TIntegerField;
    Label5: TLabel;
    txt7188_Status: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    txtIpLocal: TEdit;
    txtIP7188: TEdit;
    cmdSetup: TButton;
    cmdLerProd: TButton;
    Panel4: TPanel;
    dtINI: TwwDBDateTimePicker;
    Label1: TLabel;
    dtFIM: TwwDBDateTimePicker;
    Label3: TLabel;
    lcProduto: TwwDBLookupCombo;
    Label9: TLabel;
    cmdOk: TTecButton;
    CAD_PRODUTOS: TTecQueryADO;
    Timer1: TTimer;
    COLETA_PRODUCAOC_COD_COLABORADOR: TIntegerField;
    COLETA_PRODUCAOC_NOME_COLABORADOR: TStringField;
    COLETA_PRODUCAOC_MATRICULA: TStringField;
    mnuCad_Colaboradores: TMenuItem;
    cmdImprimir: TButton;
    CAD_PRODUTOSC_ID_PRODUTO: TIntegerField;
    CAD_PRODUTOSC_COD_SAP: TStringField;
    CAD_PRODUTOSC_COD_EAN13: TStringField;
    CAD_PRODUTOSC_TIPO_ETIQUETA: TStringField;
    CAD_PRODUTOSC_COD_PRODUTO: TStringField;
    CAD_PRODUTOSC_SIGLA_PRODUTO: TStringField;
    CAD_PRODUTOSC_NOME_COMERCIAL: TStringField;
    CAD_PRODUTOSC_COR_PRODUTO: TStringField;
    CAD_PRODUTOSC_TENSAO_PRODUTO: TIntegerField;
    COLETA_PRODUCAOC_ID_PRODUCAO: TIntegerField;
    COLETA_PRODUCAOC_ID_PRODUTO: TIntegerField;
    COLETA_PRODUCAOC_NOME_COMERCIAL: TStringField;
    COLETA_PRODUCAOC_COD_SAP: TStringField;
    PopupMenu_7188: TPopupMenu;
    mnu7188_GetCodBar: TMenuItem;
    mnu7188_SendCodBar: TMenuItem;

    procedure p_7188_Set_Status(l_conectado:boolean);

    procedure FormCreate(Sender: TObject);
    procedure cmdDesconectarClick(Sender: TObject);
    procedure cmdLimparClick(Sender: TObject);
    procedure mnuCad_ProdutosClick(Sender: TObject);
    procedure cmdOkClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cmdSetupClick(Sender: TObject);
    procedure cmdLerProdClick(Sender: TObject);
    procedure mnuCad_ColaboradoresClick(Sender: TObject);
    procedure cmdImprimirClick(Sender: TObject);
    procedure mnu7188_GetCodBarClick(Sender: TObject);
    procedure mnu7188_SendCodBarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRINCIPAL: TfrmPRINCIPAL;

implementation

uses DM_MSSQL, FUNCTIONS, CAD_PRODUTOS, SETUP, CAD_COLABORADORES;

{$R *.dfm}

{----------------------------------------------------------------------------------------------}
procedure TfrmPRINCIPAL.FormCreate(Sender: TObject);
var v_ok:boolean;
begin
   VERSAO := T_strzero(Teclogo.Versao_Dia, 2) + '/' +
             T_strzero(Teclogo.Versao_Mes, 2) + '/' +
             T_strzero(Teclogo.Versao_Ano, 4);

   StatusBar.Panels[3].Text := 'Versão: ' + VERSAO;

   //frmPrincipal.Width := 1280;
   //frmPrincipal.Height := 800;

   Teclogo.Show;
   sleep(1000);

   dtINI.date:=date;
   dtFIM.date:=date;
	txtComunic.clear;
   p_7188_Set_Status(false);
   txtIpLocal.text:=t_IpLocal;

   M7188_CONTADOR_PORTA:=0;
   M7188_CONTADOR_OK:=0;
   M7188_CONTADOR_NK:=0;

   // sql server
   v_ok:=f_Conecta_Banco_Dados_MSSQL;

   StatusBar.Panels[0].Text:='Database: '+DATABASE_NAME;

   if v_ok then
   begin
      //liga o socket
      Try
         dm.SS.Active:=true;
      Except on E:Exception do
      begin
         v_ok:=false;
         p_Message_Erro('Porta '+inttostr(dm.SS.Port)+' já esta sendo usada neste computador!'+#13#10+
                        'Verifique se o aplicativo EAC_PLC já esta sendo executado ou se outro aplicativo usa a mesma porta...');
      end;
      End;
   end;

   if v_ok then
   begin
      txtLinha.text:=LINHA;

      //produtos
      t_query(CAD_PRODUTOS,'select * from CAD_PRODUTOS '+
                           'order by C_COD_SAP','O');

      cmdOkClick(sender);
   end;

   Teclogo.Fecha;

   if v_ok then
   begin
      Timer1.enabled:=true;
   end
   else
   begin
      Application.Terminate;
   end;
end;
{----------------------------------------------------------------------------------------------}
procedure TfrmPRINCIPAL.mnu7188_GetCodBarClick(Sender: TObject);
begin
   if dm.SS.Socket.ActiveConnections <= 0 then
   begin
      p_Message_Aviso('7188 não esta conectado!');
   end
   else
   begin
      dm.SS.Socket.Connections[dm.SS.Socket.ActiveConnections-1].SendText('ENCB');
   end;
end;
{----------------------------------------------------------------------------------------------}
procedure TfrmPRINCIPAL.mnu7188_SendCodBarClick(Sender: TObject);
var v_protocolo:string;
begin
   if dm.SS.Socket.ActiveConnections <= 0 then
   begin
      p_Message_Aviso('7188 não esta conectado!');
   end
   else if t_query(dm.qDB,'Select top 1 B.C_COD_EAN13 from COLETA_PRODUCAO A join CAD_PRODUTOS B on '+
                          'A.C_ID_PRODUTO = B.C_ID_PRODUTO '+
                          'order by A.C_ID_PRODUCAO desc','O') then
   begin
      v_protocolo:='RECB'+t_strbrancos(13,dm.qDB.fieldbyname('C_COD_EAN13').asstring);
      dm.SS.Socket.Connections[dm.SS.Socket.ActiveConnections-1].SendText(v_protocolo);
      txtComunic.Lines.Add(Formatdatetime('HH:MM:SS:ZZZ',now)+' ENV: '+v_protocolo);
   end;
end;
{----------------------------------------------------------------------------------------------}
procedure TfrmPRINCIPAL.mnuCad_ColaboradoresClick(Sender: TObject);
begin
   Application.createform(tfrmCAD_COLABORADORES,frmCAD_COLABORADORES);
   frmCAD_COLABORADORES.showmodal;
   frmCAD_COLABORADORES.release;
   frmCAD_COLABORADORES.free;
end;
{----------------------------------------------------------------------------------------------}
procedure TfrmPRINCIPAL.mnuCad_ProdutosClick(Sender: TObject);
begin
   Application.createform(tfrmCAD_PRODUTOS,frmCAD_PRODUTOS);
   frmCAD_PRODUTOS.showmodal;
   frmCAD_PRODUTOS.release;
   frmCAD_PRODUTOS.free;

   t_refreshAdo([CAD_PRODUTOS]);
end;
{----------------------------------------------------------------------------------------------}
procedure TfrmPRINCIPAL.p_7188_Set_Status(l_conectado: boolean);
begin
   if l_conectado then
   begin
      txt7188_Status.Color:=clLime;
      txt7188_Status.Font.Color:=clBlack;
      txt7188_Status.Text:='CONECTADO';
      imgRede_ON.visible:=true;
      imgRede_OFF.visible:=false;
      txtIP7188.text:='';
   end
   else
   begin
      txt7188_Status.Color:=clRed;
      txt7188_Status.Font.Color:=clWhite;
      txt7188_Status.Text:='DESCONECTADO';
      imgRede_ON.visible:=false;
      imgRede_OFF.visible:=true;      
   end;
end;
{----------------------------------------------------------------------------------------------}
procedure TfrmPRINCIPAL.Timer1Timer(Sender: TObject);
begin
   StatusBar.Panels[5].text:=formatdatetime('dd/mm/yyyy hh:mm:ss',now);
end;
{----------------------------------------------------------------------------------------------}
procedure TfrmPRINCIPAL.cmdDesconectarClick(Sender: TObject);
begin
   if dm.SS.Socket.ActiveConnections <= 0 then
   begin
      p_Message_Aviso('7188 não esta conectado!');
   end
   else
   begin
      dm.SS.Socket.Connections[dm.SS.Socket.ActiveConnections-1].SendText('SHUTDOWN');
   end;
end;
{----------------------------------------------------------------------------------------------}
procedure TfrmPRINCIPAL.cmdImprimirClick(Sender: TObject);
begin

end;
{----------------------------------------------------------------------------------------------}
procedure TfrmPRINCIPAL.cmdLerProdClick(Sender: TObject);
begin
   if dm.SS.Socket.ActiveConnections <= 0 then
   begin
      p_Message_Aviso('7188 não esta conectado!');
   end
   else
   begin
      dm.SS.Socket.Connections[dm.SS.Socket.ActiveConnections-1].SendText('ENPR');
   end;
end;
{----------------------------------------------------------------------------------------------}
procedure TfrmPRINCIPAL.cmdLimparClick(Sender: TObject);
begin
   txtComunic.Lines.Clear;
end;
{----------------------------------------------------------------------------------------------}
procedure TfrmPRINCIPAL.cmdOkClick(Sender: TObject);
var v_sql:string;
begin
   if dtINI.text = '' then
   begin
      p_Message_Aviso('Informe a Data Inicial!');
      dtINI.setfocus;
   end
   else if dtFIM.text = '' then
   begin
      p_Message_Aviso('Informe a Data Final!');
      dtFIM.setfocus;
   end
   else if dtINI.date > dtFIM.date then
   begin
      p_Message_Aviso('A Data Final não pode ser menor do que a Inicial!');
      dtFIM.setfocus;
   end
   else
   begin
      v_sql:='select '+
             'A.C_ID_PRODUCAO, '+
             'A.C_DTHR_INI_PROD, '+
             'A.C_DTHR_FIM_PROD, '+
             'A.C_ID_PRODUTO, '+
             'B.C_COD_SAP, '+
             'B.C_COD_EAN13, '+
             'B.C_NOME_COMERCIAL, '+
             'A.C_COD_COLABORADOR, '+
             'C.C_NOME_COLABORADOR, '+
             'C.C_MATRICULA, '+
             'A.C_LINHA, '+
             'A.C_QTD_LIDA, '+
             'A.C_QTD_OK, '+
             'A.C_QTD_NK from COLETA_PRODUCAO A join CAD_PRODUTOS B on '+
             'A.C_ID_PRODUTO = B.C_ID_PRODUTO join CAD_COLABORADORES C on '+
             'A.C_COD_COLABORADOR = C.C_COD_COLABORADOR where '+
             'Cast(A.C_DTHR_INI_PROD as date) >='+f_strdt(dtINI.date) + ' and '+
             'Cast(A.C_DTHR_INI_PROD as date) <='+f_strdt(dtFIM.date);

      if lcProduto.text <> '' then
      begin
         v_sql:=v_sql + ' and A.C_ID_PRODUTO ='+#39+CAD_PRODUTOSC_ID_PRODUTO.asstring+#39;
      end;

      v_sql:=v_sql + ' order by A.C_ID_PRODUCAO desc';

      t_query(COLETA_PRODUCAO,v_sql,'O');

      txtProduto.text:=COLETA_PRODUCAOC_COD_EAN13.asstring;       
   end;
end;
{----------------------------------------------------------------------------------------------}
procedure TfrmPRINCIPAL.cmdSetupClick(Sender: TObject);
begin
   if dm.SS.Socket.ActiveConnections <= 0 then
   begin
      p_Message_Aviso('7188 não esta conectado!');
   end
   else
   begin
      Application.createform(tfrmSETUP,frmSETUP);

      if frmSETUP.ShowModal = mrOk then
      begin
         t_refreshAdo([COLETA_PRODUCAO]);
      end;
      
      frmSETUP.release;
      frmSETUP.free;   
   end;
end;
{----------------------------------------------------------------------------------------------}
end.
