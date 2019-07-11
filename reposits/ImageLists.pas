unit ImageLists;

interface

uses
  SysUtils, Classes, ImgList, Controls;

type
  TImageListsDM = class(TDataModule)
    MagListManipPanelIL: TImageList;
    MainMenuImageList: TImageList;
    LeftPagesImageList: TImageList;
    MainToolBarImageList: TImageList;
    ReleaseStructTreeImageList: TImageList;
    ReleaseStructToolBarImageList: TImageList;
    CustDataImageList: TImageList;
    DriversPanelImageList: TImageList;
    SectorTreeImageList: TImageList;
    NavigatIL: TImageList;
    BalansIL: TImageList;
    AdminIL: TImageList;
    MainGridPopupImageList: TImageList;
    StackImageList: TImageList;
    MainBoldGridPopUpImageList: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImageListsDM: TImageListsDM;

implementation

{$R *.dfm}

end.
