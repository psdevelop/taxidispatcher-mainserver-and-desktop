unit AdministrationPanelUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BoldGrid, StdCtrls,  BoldElements, Buttons, ExtCtrls, BoldEdit,
  ComCtrls;

type
  TAdminPanelForm = class(TForm)
    BoldGrid7: TBoldGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    BitBtn23: TBitBtn;
    BitBtn21: TBitBtn;
    BoldEdit7: TBoldEdit;
    BoldEdit6: TBoldEdit;
    BoldEdit5: TBoldEdit;
    BoldEdit4: TBoldEdit;
    BoldEdit3: TBoldEdit;
    BoldEdit2: TBoldEdit;
    BoldEdit1: TBoldEdit;
    BoldEdit9: TBoldEdit;
    BoldEdit10: TBoldEdit;
    BoldEdit11: TBoldEdit;
    BoldGrid1: TBoldGrid;
    Splitter1: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BoldGrid7Columns5LookupChange(DestElement,
      NewValue: TBoldElement);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdminPanelForm: TAdminPanelForm;

implementation

{$R *.dfm}

uses HandlesDM, BusinessClasses, ModelDM, ImageLists;

procedure TAdminPanelForm.BoldGrid7Columns5LookupChange(DestElement,
  NewValue: TBoldElement);
begin
  if NewValue<>nil then
    begin
      (DestElement as TPersonal).Imya_dispetchera:=
        (NewValue as TPersonal).Polnoe_imya;
      (DestElement as TPersonal).Ident_dispetchera:=  
        BoldModelDM.IDByLogin((NewValue as TPersonal).Login);
    end
  else
    begin
      (DestElement as TPersonal).Ident_dispetchera:=0;
      (DestElement as TPersonal).Imya_dispetchera:='Не определён';
    end;
end;

procedure TAdminPanelForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BoldModelDM.BoldUpdateDBAction1.Execute;
end;

end.
