unit FUNCTIONS;

interface

Uses SysUtils, Forms, Windows, Inifiles, teclink, ExtCtrls, ScktComp, DateUtils, IdTCPClient, Graphics, TecQueryADO, Math,
     StdCtrls, Classes, QuickRpt, Controls, DB, wwDialog, wwidlg, AdoDB, Dialogs, IdIcmpClient;

//banco de dados
Function  f_Conecta_Banco_Dados_MSSQL:boolean;

//message box
Procedure p_Message_Erro(l_msg:string;l_font_len:integer = 10;l_erro_padrao:boolean=true);
Procedure p_Message_Aviso(l_msg:string;l_font_len:integer = 10);
Procedure p_Message_Warning(l_msg:string;l_font_len:integer = 10);
function  f_Message_Question(l_msg:string;l_font_len:integer = 10;l_yestoall:boolean=false):integer;

//COVERTE UMA DATA PARA UMA STRING DE ACORDO COM O BANCO UTILIZADO
function f_strdt(l_data:TDateTime):string;

//7188
procedure p_ExtraiString(l_dados: string);
procedure p_7188_Producao(l_dados:string);

implementation

uses DM_MSSQL, MSG_ERRO, MSG_PADRAO, MSG_QUESTION, MSG_WARNING, PRINCIPAL;


{------------------------------------------------------------------------------}
Function f_Conecta_Banco_Dados_MSSQL:boolean;
var v_tecini: TInifile;
    v_path: string;
begin
   result:=false;

   v_path:=ExtractFilePath(Application.ExeName) + ARQ_INI;

   if FileExists(v_path)  then
   begin
      v_tecini:=TIniFile.Create(v_path);

      DATABASE_NAME:=v_tecini.ReadString('ARNO', 'DATABASENAME', '');
      LINHA:=v_tecini.ReadString('ARNO', 'LINHA', '');

      DM.DB_ADO.Connected:=false;

      DM.DB_ADO.ConnectionString:='Provider='+v_tecini.ReadString('ARNO', 'PROVIDER', 'SQLOLEDB.1')+';'+
                                  'Persist Security Info=True;'+
                                  'Data Source='+v_tecini.ReadString('ARNO', 'SERVERNAME', '')+';'+
                                  'Initial Catalog='+DATABASE_NAME+';'+
                                  'User ID='+v_tecini.ReadString('ARNO', 'USERNAME', '')+';'+
                                  'Password='+T_criptstr(v_tecini.ReadString('ARNO', 'PASSWORD', ''));

      v_tecini.Free;

      try
         DM.DB_ADO.Connected:=True;

         t_query(dm.qDB,'Set DateFormat DMY','E');

         result:=true;
      except on E:Exception do
      begin
         p_Message_Erro('Erro na Conexão com o Banco de Dados MSSQL!'+#13#10+E.Message);
      end;
      end;
   end
   else
   begin
      p_Message_Erro('O arquivo ' + v_path + ' não foi encontrado!');
   end;
end;
{------------------------------------------------------------------------------}
Procedure p_Message_Erro(l_msg:string;l_font_len:integer = 10;l_erro_padrao:boolean=true);
var v_msg:string;
begin
   if l_erro_padrao and (pos('PK_',l_msg) > 0) or (pos('unique',l_msg) > 0) or (pos('Key violation',l_msg) > 0) then
   begin
      v_msg:='Já existe o registro informado!'+#13#10+
             'Detalhes do erro: '+#13#10+
             l_msg;
   end
   else if l_erro_padrao and (pos('FK_',l_msg) > 0) then
   begin
      v_msg:='Este registro não pode ser excluído pois esta sendo usado no sistema!'+#13#10+
             'Detalhes do erro: '+#13#10+
             l_msg;
   end
   else
   begin
      v_msg:=l_msg;
   end;

   Application.CreateForm(TfrmMSG_ERRO,frmMSG_ERRO);
   frmMSG_ERRO.txtMsg.Text:=v_msg;
   frmMSG_ERRO.ShowModal;
   frmMSG_ERRO.Release;
   frmMSG_ERRO.Free;
end;
{------------------------------------------------------------------------------}
Procedure p_Message_Aviso(l_msg:string;l_font_len:integer = 10);
begin
   Application.CreateForm(TfrmMSG_PADRAO,frmMSG_PADRAO);
   frmMSG_PADRAO.txtMsg.Text:=l_msg;
   frmMSG_PADRAO.ShowModal;
   frmMSG_PADRAO.Release;
   frmMSG_PADRAO.Free;
end;
{------------------------------------------------------------------------------}
Procedure p_Message_Warning(l_msg:string;l_font_len:integer = 10);
begin
   Application.CreateForm(TfrmMSG_WARNING,frmMSG_WARNING);
   frmMSG_WARNING.txtMsg.Text:=l_msg;
   frmMSG_WARNING.BringToFront;
   frmMSG_WARNING.ShowModal;
   frmMSG_WARNING.Release;
   frmMSG_WARNING.Free;
end;
{------------------------------------------------------------------------------}
function f_Message_Question(l_msg:string;l_font_len:integer = 10;l_yestoall:boolean=false):integer;
begin
   Application.CreateForm(TfrmMSG_QUESTION,frmMSG_QUESTION);
   frmMSG_QUESTION.cmdYesToAll.Enabled:=l_yestoall;
   frmMSG_QUESTION.txtMsg.Text:=l_msg;
   result:=frmMSG_QUESTION.ShowModal;
   frmMSG_QUESTION.Release;
   frmMSG_QUESTION.Free;
end;
{------------------------------------------------------------------------------}
function f_strdt(l_data:TDateTime):string;
begin
   if l_data <> 0 then
   begin
      result:=#39 + formatdatetime('YYYY/MM/DD',l_data) + #39;
   end
   else
   begin
      result:='NULL';
   end;
end;
{------------------------------------------------------------------------------}
procedure p_7188_Producao(l_dados:string);
var v_sql:string;
begin
   p_ExtraiString(l_dados);

   if M7188_CONTADOR_PORTA > 0 then
   begin
      Try
         v_sql:='Update COLETA_PRODUCAO set '+
                'C_QTD_LIDA ='+inttostr(M7188_CONTADOR_PORTA)+', '+
                'C_QTD_OK ='+inttostr(M7188_CONTADOR_OK)+', '+
                'C_QTD_NK ='+inttostr(M7188_CONTADOR_NK)+' where '+
                'C_ID_PRODUCAO = (select max(C_ID_PRODUCAO) from COLETA_PRODUCAO)';

         t_query(dm.qDB,v_sql,'E');

         t_RefreshAdo([frmPRINCIPAL.COLETA_PRODUCAO])

      Except on E:Exception do
      begin
         p_message_erro(e.message);
      End;
      End;
   end;
end;
{------------------------------------------------------------------------------}
procedure p_ExtraiString(l_dados: string);
var v_sl: TStringList;
begin
   try
      v_sl:=TStringList.Create;
      ExtractStrings([';'], [' '], PChar(l_dados), v_sl);

      M7188_CONTADOR_PORTA:=strtoint(v_sl.Strings[0]);
      M7188_CONTADOR_OK:=strtoint(v_sl.Strings[1]);
      M7188_CONTADOR_NK:=strtoint(v_sl.Strings[2]);

      frmPRINCIPAL.txtComunic.Lines.Add(Formatdatetime('HH:MM:SS:ZZZ',now)+': CONTADOR PORTA: '+v_sl.Strings[0]);
      frmPRINCIPAL.txtComunic.Lines.Add(Formatdatetime('HH:MM:SS:ZZZ',now)+': CONTADOR OK...: '+v_sl.Strings[1]);
      frmPRINCIPAL.txtComunic.Lines.Add(Formatdatetime('HH:MM:SS:ZZZ',now)+': CONTADOR NK...: '+v_sl.Strings[2]);

   finally
      FreeAndNil(v_sl);
   end;
end;
{----------------------------------------------------------------------------------------------}
end.
