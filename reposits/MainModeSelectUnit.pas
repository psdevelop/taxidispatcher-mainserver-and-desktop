unit MainModeSelectUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TMainModeSelectForm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    CheckBox1: TCheckBox;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    BigModeRadioButton: TRadioButton;
    LiteModeRadioButton: TRadioButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainModeSelectForm: TMainModeSelectForm;

implementation

{$R *.dfm}

end.

