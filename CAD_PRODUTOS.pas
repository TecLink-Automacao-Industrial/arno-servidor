unit CAD_PRODUTOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TecComps, ExtCtrls, Teclink, Grids, Wwdbigrd, Wwdbgrid, DB, Wwdatsrc, ADODB, TecQueryADO, wwSpeedButton, wwDBNavigator,
  wwclearpanel;

type
  TfrmCAD_PRODUTOS = class(TForm)
    Panel1: TPanel;
    CAD_PRODUTOS: TTecQueryADO;
    dsCAD_PRODUTOS: TwwDataSource;
    dbgCAD_PRODUTOS: TwwDBGrid;
    wwDBNavigator1: TwwDBNavigator;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Edit: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    wwDBNavigator1Refresh: TwwNavButton;
    CAD_PRODUTOSC_ID_PRODUTO: TAutoIncField;
    CAD_PRODUTOSC_COD_SAP: TStringField;
    CAD_PRODUTOSC_COD_EAN13: TStringField;
    CAD_PRODUTOSC_TIPO_ETIQUETA: TStringField;
    CAD_PRODUTOSC_COD_PRODUTO: TStringField;
    CAD_PRODUTOSC_SIGLA_PRODUTO: TStringField;
    CAD_PRODUTOSC_NOME_COMERCIAL: TStringField;
    CAD_PRODUTOSC_COR_PRODUTO: TStringField;
    CAD_PRODUTOSC_TENSAO_PRODUTO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure dbgCAD_PRODUTOSCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure CAD_PRODUTOSBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCAD_PRODUTOS: TfrmCAD_PRODUTOS;

implementation

uses DM_MSSQL, FUNCTIONS;

{$R *.dfm}

{----------------------------------------------------------------------------------------------}
procedure TfrmCAD_PRODUTOS.CAD_PRODUTOSBeforeDelete(DataSet: TDataSet);
var v_sql:string;
begin
   if f_Message_Question('Tem certeza que deseja excluir o produto?') = mrYes then
   begin
      v_sql:='delete from COLETA_PRODUCAO where '+
             'C_ID_PRODUTO ='+#39+CAD_PRODUTOSC_ID_PRODUTO.asstring+#39;
      t_query(dm.qDB,v_sql,'E');

      v_sql:='delete from CAD_PRODUTOS where '+
             'C_ID_PRODUTO ='+#39+CAD_PRODUTOSC_ID_PRODUTO.asstring+#39;
      t_query(dm.qDB,v_sql,'E');

      t_refreshAdo([CAD_PRODUTOS]);
   end;

   abort;
end;
{----------------------------------------------------------------------------------------------}
procedure TfrmCAD_PRODUTOS.dbgCAD_PRODUTOSCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   if Field.ReadOnly then
   begin
      ABrush.Color:=cl3DLight;
      AFont.Color:=clBlack;
   end;
end;
{----------------------------------------------------------------------------------------------}
procedure TfrmCAD_PRODUTOS.FormCreate(Sender: TObject);
begin
   //produtos
   t_query(CAD_PRODUTOS,'select * from CAD_PRODUTOS order by C_COD_SAP','O');
end;
{----------------------------------------------------------------------------------------------}
end.


