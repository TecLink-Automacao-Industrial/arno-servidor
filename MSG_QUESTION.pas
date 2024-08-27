unit MSG_QUESTION;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls, Buttons;

type
  TfrmMSG_QUESTION = class(TForm)
    FlatPanel1: TPanel;
    Label1: TLabel;
    txtMsg: TMemo;
    Panel1: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Panel2: TPanel;
    Bevel3: TBevel;
    cmdNo: TSpeedButton;
    cmdCancel: TSpeedButton;
    cmdYesToAll: TSpeedButton;
    Image1: TImage;
    cmdYes: TSpeedButton;
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cmdYesClick(Sender: TObject);
    procedure cmdYesToAllClick(Sender: TObject);
    procedure cmdNoClick(Sender: TObject);
    procedure cmdCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMSG_QUESTION: TfrmMSG_QUESTION;

implementation

{$R *.dfm}

procedure TfrmMSG_QUESTION.Label1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   ReleaseCapture;
   PostMessage(frmMSG_QUESTION.Handle, WM_SYSCOMMAND, $F012, 0) ;
end;

procedure TfrmMSG_QUESTION.cmdYesClick(Sender: TObject);
begin
   ModalResult:=mrYes;
end;

procedure TfrmMSG_QUESTION.cmdYesToAllClick(Sender: TObject);
begin
   ModalResult:=mrYesToAll;
end;

procedure TfrmMSG_QUESTION.cmdNoClick(Sender: TObject);
begin
   ModalResult:=mrNo;
end;

procedure TfrmMSG_QUESTION.cmdCancelClick(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

end.
