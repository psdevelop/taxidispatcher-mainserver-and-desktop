//������  �������
//02.01.2006 - ��������� ���������� UseListElem
//� ���������� �����
//
unit HandlesDM;

interface

uses
  SysUtils, Classes, BoldSubscription, BoldHandles, BoldRootedHandles,
  BoldAbstractListHandle, BoldCursorHandle, BoldListHandle, BoldListActions,
  ActnList, BoldHandleAction, BoldElements, BoldPlaceableSubscriber,
  BoldVariableHandle, BoldOclVariables, BoldExpressionHandle, DB, BoldDataSet,
  BoldPersistenceNotifier, BoldPropertiesController, BoldReferenceHandle;

type
  TBoldHandlesDM = class(TDataModule)
    blhUsersList: TBoldListHandle;
    bvhStarDate: TBoldVariableHandle;
    bvhEndDate: TBoldVariableHandle;
    AllUsersActionList: TActionList;
    BoldListHandleAddNewActionAllUsers: TBoldListHandleAddNewAction;
    BoldListHandleDeleteActionAllUsers: TBoldListHandleDeleteAction;
    blhCurrUser: TBoldListHandle;
    bvhCurrUserLogin: TBoldVariableHandle;
    bovCurrUser: TBoldOclVariables;
    blhAllDrivers: TBoldListHandle;
    blhUniionObjects: TBoldListHandle;
    blhDriversUnion: TBoldListHandle;
    blhAllActiveDrivers: TBoldListHandle;
    bvhDrNum: TBoldVariableHandle;
    blhDrSearch: TBoldListHandle;
    bovDrSearch: TBoldOclVariables;
    blhActDrTimeOut: TBoldListHandle;
    behEndDateTime: TBoldExpressionHandle;
    blhAllWorkSector: TBoldListHandle;
    AllWorkSectorActionList: TActionList;
    BoldListHandleAddNewActionAllWorkSector: TBoldListHandleAddNewAction;
    BoldListHandleDeleteActionAllWorkSector: TBoldListHandleDeleteAction;
    blhSectorDrivers2: TBoldListHandle;
    blhSectorByCode: TBoldListHandle;
    bvhSectorCode: TBoldVariableHandle;
    bovSectorByCode: TBoldOclVariables;
    dsActDrTimeOut: TDataSource;
    behCurrDSDriver: TBoldExpressionHandle;
    bovCurrDSDriver: TBoldOclVariables;
    bvhOnlyActiveCust: TBoldVariableHandle;
    bvhOnlyPrevCust: TBoldVariableHandle;
    blhAllDrSearch2: TBoldListHandle;
    bvhSectByNum: TBoldVariableHandle;
    blhSectByNum: TBoldListHandle;
    bovSectByNum: TBoldOclVariables;
    bvhControlDrNum: TBoldVariableHandle;
    bovControlValues: TBoldOclVariables;
    brhCurrSelectDriver: TBoldReferenceHandle;
    blhUserInOutEvents: TBoldListHandle;
    behEndWithEndSect: TBoldExpressionHandle;
    blhAllDrGroups: TBoldListHandle;
    BoldListHandleAddNewActionAllGroups: TBoldListHandleAddNewAction;
    BoldListHandleDeleteActionAllGroups: TBoldListHandleDeleteAction;
    brhCurrDrGroup: TBoldReferenceHandle;
    bovAllDriversGr: TBoldOclVariables;
    blhGroupDrivers: TBoldListHandle;
    blhOrderDrGroups: TBoldListHandle;
    BoldListHandleAddNewActionAllRegion: TBoldListHandleAddNewAction;
    BoldListHandleDeleteActionAllRegion: TBoldListHandleDeleteAction;
    blhInAllDrSearch2: TBoldListHandle;
    bvhShowStaticWorker: TBoldVariableHandle;
    bvhShowStag: TBoldVariableHandle;
    bvhOutNullableDr: TBoldVariableHandle;
    BoldListHandle1_2: TBoldListHandle;
    procedure BoldListHandleAddNewActionAllDriversExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BoldHandlesDM: TBoldHandlesDM;

implementation

{$R *.dfm}

uses ModelDM, ImageLists, MainForm, Dialogs, SectorEnumsUnit, BoldOtherHandlCompUnit, DateUtils, BusinessClasses;

procedure TBoldHandlesDM.BoldListHandleAddNewActionAllDriversExecute(Sender: TObject);
begin
  (blhAllDrivers.List.AddNew as TVoditelj).chem_uchityvaetsya_voditelj:=(blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti);
end;

end.
