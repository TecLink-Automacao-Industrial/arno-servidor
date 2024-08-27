unit SETUP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TecComps, ExtCtrls, Teclink, wwdblook, DB, ADODB, TecQueryADO;

type
  TfrmSETUP = class(TForm)
    Panel1: TPanel;
    TecGroupBox2: TTecGroupBox;
    cmdSair: TTecButton;
    cmdConfirmar: TTecButton;
    txtProd_Ean: TEdit;
    Label7: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lcColaborador: TwwDBLookupCombo;
    CAD_COLABORADORES: TTecQueryADO;
    CAD_COLABORADORESC_COD_COLABORADOR: TIntegerField;
    CAD_COLABORADORESC_MATRICULA: TStringField;
    CAD_COLABORADORESC_NOME_COLABORADOR: TStringField;
    CAD_PRODUTOS: TTecQueryADO;
    CAD_PRODUTOSC_COD_SAP: TStringField;
    CAD_PRODUTOSC_COD_EAN13: TStringField;
    CAD_PRODUTOSC_TIPO_ETIQUETA: TStringField;
    CAD_PRODUTOSC_COD_PRODUTO: TStringField;
    CAD_PRODUTOSC_SIGLA_PRODUTO: TStringField;
    CAD_PRODUTOSC_NOME_COMERCIAL: TStringField;
    CAD_PRODUTOSC_COR_PRODUTO: TStringField;
    CAD_PRODUTOSC_TENSAO_PRODUTO: TIntegerField;
    CAD_PRODUTOSC_ID_PRODUTO: TIntegerField;
    lcProduto: TwwDBLookupCombo;
    Label3: TLabel;
    txtProd_Tipo: TEdit;
    Label4: TLabel;
    txtProd_Cod: TEdit;
    Label5: TLabel;
    txtProd_Sigla: TEdit;
    Label6: TLabel;
    txtProd_Ref: TEdit;
    Label8: TLabel;
    txtProd_Cor: TEdit;
    txtProd_Tensao: TEdit;
    Label9: TLabel;
    procedure cmdConfirmarClick(Sender: TObject);
    procedure cmdSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lcProdutoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSETUP: TfrmSETUP;

implementation

uses DM_MSSQL, FUNCTIONS;

{$R *.dfm}

{----------------------------------------------------------------------------------------------}
procedure TfrmSETUP.cmdConfirmarClick(Sender: TObject);
var v_sql:string;
    v_protocolo:string;
begin
   if dm.SS.Socket.ActiveConnections <= 0 then
   begin
      p_Message_Aviso('7188 não esta conectado!');
   end
   else if lcColaborador.text = '' then
   begin
      p_Message_Aviso('Informe o Colaborador!');
      lcColaborador.setfocus;
   end
   else if lcProduto.text = '' then
   begin
      p_Message_Aviso('Informe o Produto!');
      lcProduto.setfocus;
   end
   else if f_Message_Question('Confirma Setup do 7188?') = mrYes then
   begin
      v_protocolo:='RECB'+t_strbrancos(13,CAD_PRODUTOSC_COD_EAN13.asstring);

      Try
         //enviar protocolo para 7188
         dm.SS.Socket.Connections[dm.SS.Socket.ActiveConnections-1].SendText(v_protocolo);

         //fechar produção atual e abrir nova
         v_sql:='exec dbo.P_PRODUCAO_SETUP '+#39+CAD_PRODUTOSC_ID_PRODUTO.asstring+#39+','+
                                             #39+CAD_COLABORADORESC_COD_COLABORADOR.asstring+#39+','+
                                             #39+LINHA+#39;

         t_query(dm.qDB,v_sql,'E');

         modalResult:=mrOk;

      Except on E:Exception do
      begin
         p_Message_Erro(e.message);
      end;
      end;
   end;
end;
{----------------------------------------------------------------------------------------------}
procedure TfrmSETUP.cmdSairClick(Sender: TObject);
begin
   close;
end;
{----------------------------------------------------------------------------------------------}
procedure TfrmSETUP.FormCreate(Sender: TObject);
begin
   //colaboradores
   t_query(CAD_COLABORADORES,'select '+
                             'C_COD_COLABORADOR, '+
                             'C_MATRICULA, '+
                             'C_NOME_COLABORADOR from CAD_COLABORADORES '+
                             'order by C_NOME_COLABORADOR','O');

   //produtos
   t_query(CAD_PRODUTOS,'select * from CAD_PRODUTOS '+
                        'order by C_COD_SAP','O');
end;
{----------------------------------------------------------------------------------------------}
procedure TfrmSETUP.lcProdutoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   if lcProduto.text <> '' then
   begin
      txtProd_Ean.text:=CAD_PRODUTOSC_COD_EAN13.asstring;
      txtProd_Tipo.text:=CAD_PRODUTOSC_TIPO_ETIQUETA.asstring;
      txtProd_Cod.text:=CAD_PRODUTOSC_COD_PRODUTO.asstring;
      txtProd_Sigla.text:=CAD_PRODUTOSC_SIGLA_PRODUTO.asstring;
      txtProd_Ref.text:=CAD_PRODUTOSC_NOME_COMERCIAL.asstring;
      txtProd_Cor.text:=CAD_PRODUTOSC_COR_PRODUTO.asstring;
      txtProd_Tensao.text:=CAD_PRODUTOSC_TENSAO_PRODUTO.asstring;
   end
   else
   begin
      txtProd_Ean.text:='';
      txtProd_Tipo.text:='';
      txtProd_Cod.text:='';
      txtProd_Sigla.text:='';
      txtProd_Ref.text:='';
      txtProd_Cor.text:='';
      txtProd_Tensao.text:='';
   end;
end;
{----------------------------------------------------------------------------------------------}
end.
