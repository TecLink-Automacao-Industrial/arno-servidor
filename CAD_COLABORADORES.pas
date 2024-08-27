unit CAD_COLABORADORES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TecComps, ExtCtrls, Teclink, Grids, Wwdbigrd, Wwdbgrid, DB, Wwdatsrc, ADODB, TecQueryADO, wwSpeedButton, wwDBNavigator,
  wwclearpanel;

type
  TfrmCAD_COLABORADORES = class(TForm)
    Panel1: TPanel;
    CAD_COLABORADORES: TTecQueryADO;
    dsCAD_COLABORADORES: TwwDataSource;
    dbgCAD_COLABORADORES: TwwDBGrid;
    wwDBNavigator1: TwwDBNavigator;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Edit: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    wwDBNavigator1Refresh: TwwNavButton;
    CAD_COLABORADORESC_COD_COLABORADOR: TAutoIncField;
    CAD_COLABORADORESC_MATRICULA: TStringField;
    CAD_COLABORADORESC_NOME_COLABORADOR: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure dbgCAD_COLABORADORESCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCAD_COLABORADORES: TfrmCAD_COLABORADORES;

implementation

uses DM_MSSQL, FUNCTIONS;

{$R *.dfm}

{----------------------------------------------------------------------------------------------}
procedure TfrmCAD_COLABORADORES.dbgCAD_COLABORADORESCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean;
  AFont: TFont; ABrush: TBrush);
begin
   if Field.ReadOnly then
   begin
      ABrush.Color:=cl3DLight;
      AFont.Color:=clBlack;
   end;
end;
{----------------------------------------------------------------------------------------------}
procedure TfrmCAD_COLABORADORES.FormCreate(Sender: TObject);
begin
   //colaboradores
   t_query(CAD_COLABORADORES,'select '+
                             'C_COD_COLABORADOR, '+
                             'C_MATRICULA, '+
                             'C_NOME_COLABORADOR from CAD_COLABORADORES '+
                             'order by C_NOME_COLABORADOR','O');
end;
{----------------------------------------------------------------------------------------------}
end.
