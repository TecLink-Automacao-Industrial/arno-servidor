unit MSG_ERRO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls, Buttons;

type
  TfrmMSG_ERRO = class(TForm)
    Label1: TLabel;
    txtMsg: TMemo;
    Panel1: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Panel2: TPanel;
    Bevel3: TBevel;
    Image1: TImage;
    cmdOk: TSpeedButton;
    procedure cmdOkClick(Sender: TObject);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMSG_ERRO: TfrmMSG_ERRO;

implementation

{$R *.dfm}

procedure TfrmMSG_ERRO.cmdOkClick(Sender: TObject);
begin
   close;
end;

procedure TfrmMSG_ERRO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = VK_RETURN then
   begin
      cmdOk.OnClick(sender);
   end
   else if key = VK_ESCAPE then
   begin
      cmdOk.OnClick(sender);
   end;
end;

procedure TfrmMSG_ERRO.Label1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   ReleaseCapture;
   PostMessage(frmMSG_ERRO.Handle, WM_SYSCOMMAND, $F012, 0) ;
end;

end.
