unit DM_MSSQL;

interface

uses SysUtils, Classes, ScktComp, DB, ADODB, TecQueryADO;

Const ARQ_INI = 'teclink.ini';

type
  TDM = class(TDataModule)
    SS: TServerSocket;
    DB_ADO: TADOConnection;
    qDB: TTecQueryADO;
    procedure SSClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure SSClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure SSClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure SSClientConnect(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;
  VERSAO:string;
  DATABASE_NAME:string;
  LINHA:string;

  M7188_CONTADOR_PORTA:integer;
  M7188_CONTADOR_OK:integer;
  M7188_CONTADOR_NK:integer;

implementation

uses PRINCIPAL, FUNCTIONS;

{$R *.dfm}

{----------------------------------------------------------------------------------------------}
procedure TDM.SSClientConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
   frmPRINCIPAL.txtComunic.Lines.Add(Formatdatetime('HH:MM:SS:ZZZ',now)+': CONECTADO');
   frmPRINCIPAL.p_7188_Set_Status(true);
   frmPRINCIPAL.txtIP7188.text:=Socket.RemoteAddress;
end;
{----------------------------------------------------------------------------------------------}
procedure TDM.SSClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
   frmPRINCIPAL.txtComunic.Lines.Add(Formatdatetime('HH:MM:SS:ZZZ',now)+': DESCONECTADO');
   frmPRINCIPAL.p_7188_Set_Status(false);
end;
{----------------------------------------------------------------------------------------------}
procedure TDM.SSClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
   frmPRINCIPAL.txtComunic.Lines.Add(Formatdatetime('HH:MM:SS:ZZZ',now)+': ERRO '+inttostr(ErrorCode));
end;
{----------------------------------------------------------------------------------------------}
procedure TDM.SSClientRead(Sender: TObject; Socket: TCustomWinSocket);
var v_protocolo:string[2];
    v_dados : string;
    v_resp  : string;
begin
   v_dados:=Socket.ReceiveText;
   v_protocolo:=copy(v_dados,1,2);
   v_dados:=copy(v_dados,3,length(v_dados));
   v_dados:=stringReplace(v_dados,#$D#$A,'',[rfReplaceAll]);
   v_dados:=stringReplace(v_dados,#$D#2,'',[rfReplaceAll]);

   frmPRINCIPAL.txtComunic.Lines.Add(Formatdatetime('HH:MM:SS:ZZZ',now)+' REC: '+v_protocolo+v_dados);

   if v_protocolo = 'ST' then
   begin
      v_resp := 'STOK';
   end;

   if v_protocolo = 'IN' then
   begin
      v_resp := 'INOK';
   end;

   //produção
   if v_protocolo = 'PR' then
   begin
      p_7188_Producao(v_dados);
      v_resp:='OK';
   end;

   if v_protocolo = 'ON' then
   begin
      v_resp:='OK';
   end;

   Socket.SendText(v_resp);
end;
{----------------------------------------------------------------------------------------------}
end.
