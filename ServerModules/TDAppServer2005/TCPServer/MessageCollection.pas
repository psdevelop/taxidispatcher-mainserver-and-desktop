unit MessageCollection;

interface

uses Classes, SysUtils, uLkJSON;

type

  JSONItem = record
    key: String;
    value: String;
  end;

  JSONMessage = class
    private
      JSONItems: array of JSONItem;
    public
      ClientID: Integer;
      DirectJSONString: String;
      OnDeleted: Boolean;
      constructor Create();
      function AddJSONItem(Item: JSONItem): Boolean;
      function GetFirstJSONItem: JSONItem;
      function DeleteFirstJSONItem: Boolean;
      function GetStrJSON(): Widestring;
  end;

  TMessageCollectionItem = class(TCollectionItem)
    private
      FJSONMessage: JSONMessage;
    public
      MSGJSONObject: TLkJSONObject;
      OnDeleted: Boolean;
      OnDeletedASKed: Boolean;
      ClientID: Integer;
      DirectJSONString: String;
      Pozyvnoi: Integer;
      DriverDBID: Integer;
      itsSystemMessage: Boolean;
      constructor Create(Collection: TCollection); override;
      function GetMessage(): JSONMessage;
      function GetStrJSON(): Widestring;
      procedure SetDirectJSONString(DirectJSON: String);
  end;

  TItemChangeEvent = procedure(Item: TCollectionItem) of object;

  TMessageCollection = class(TCollection)
    private
      FOwner: TPersistent;
      FOnItemChange: TItemChangeEvent;
    protected
      function GetOwner: TPersistent; override;
      procedure Update(Item: TCollectionItem); override;
      procedure DoItemChange(Item: TCollectionItem); dynamic;
      function GetItem(Index: Integer): TMessageCollectionItem;
      procedure SetItem(Index: Integer; const Value: TMessageCollectionItem);
    public
      constructor Create();
      function Add: TMessageCollectionItem;
      property Items[Index: Integer]: TMessageCollectionItem read GetItem write SetItem; default;
    published
      property OnItemChange: TItemChangeEvent
        read FOnItemChange write FOnItemChange;
  end;

implementation

uses TCPClientCollection;

  constructor JSONMessage.Create();
  begin
    SetLength(JSONItems,0);
    DirectJSONString:='';
  end;

  function JSONMessage.AddJSONItem(Item: JSONItem): Boolean;
  var res: Boolean;
  begin
    SetLength(JSONItems, Length(JSONItems));
    res:=True;
    Result:=res;
  end;
  
  function JSONMessage.GetFirstJSONItem: JSONItem;
  var res: JSONItem;
      i: Integer;
  begin
    res:=JSONItems[0];
    Result:=res;
  end;

  function JSONMessage.DeleteFirstJSONItem: Boolean;
  var i: Integer;
  begin
    for i:=0 to Length(JSONItems)-1 do
      JSONItems[i]:=JSONItems[i+1];
  end;

  function JSONMessage.GetStrJSON(): Widestring;
  var i: Integer;
      res: Widestring;
  begin
    res:='';

    if (Length(DirectJSONString)<=0) then
    begin

    if Length(JSONItems)>0 then
    begin
      res:='{ ';
      for i:=0 to Length(JSONItems)-1 do
      begin
        res:='"'+JSONItems[i].key+'":"'+
          JSONItems[i].value+'"';
        if i<(Length(JSONItems)-1) then
          res:=res+', ';
      end;
      res:=res+' }';
    end;

    end
    else
      res:=DirectJSONString;

    Result:=res;
  end;

  constructor TMessageCollectionItem.Create(Collection: TCollection);
  begin
    // ������� ��� ������ � �������������� ��� ����
    inherited Create(Collection);
    FJSONMessage := JSONMessage.Create();
    OnDeleted := False;
    OnDeletedASKed := False;
    FJSONMessage.OnDeleted := False;
    MSGJSONObject:= TLkJSONObject.Create();
    itsSystemMessage:=False;
  end;

  function TMessageCollectionItem.GetMessage(): JSONMessage;
  begin
    Result:=FJSONMessage;
  end;

  function TMessageCollectionItem.GetStrJSON(): Widestring;
  begin
    Result:=FJSONMessage.GetStrJSON();
  end;

  procedure TMessageCollectionItem.
    SetDirectJSONString(DirectJSON: String);
  begin
    DirectJSONString:=DirectJSON;
    FJSONMessage.DirectJSONString:=DirectJSON;
  end;

  function TMessageCollection.Add: TMessageCollectionItem;
  begin
  // �������� ����� TCollectionItem � �������� ��� � ������ TSpot
  //try
  Result := TMessageCollectionItem(inherited Add);
  //except on E:Exception do
    
  //end;
end;

constructor TMessageCollection.Create();
begin
  // ������� ��������� � ���������� ������ �� �� ���������
  inherited Create(TMessageCollectionItem);
  FOwner := nil;
end;

procedure TMessageCollection.DoItemChange(Item: TCollectionItem);
begin
  // ����������� ����� ����������������� ����������� �������
  if Assigned(FOnItemChange) then
    FOnItemChange(Item);
end;

function TMessageCollection.GetItem(Index: Integer): TMessageCollectionItem;
begin
  // �������� ����� TCollectionItem � �������� ��� � ������ TSpot
  Result := TMessageCollectionItem(inherited GetItem(Index));
end;

function TMessageCollection.GetOwner: TPersistent;
begin
  // ���������� ����� ����������� ������ �� ��������� ���������
  Result := TPersistent(FOwner);
end;

procedure TMessageCollection.SetItem(Index: Integer; const Value: TMessageCollectionItem);
begin
  // ������ ���������� �������������� ����� ������
  inherited SetItem(Index, Value);
end;

procedure TMessageCollection.Update(Item: TCollectionItem);
begin
  // ����� ��������������� ������ ����� ������, �� ��� ��������� �����. ��
  // ����������� ������ ������ ���� ��� ���������� � ����� ������� Delphi.
  inherited Update(Item);
  // ���� ������ �� ����������� ����������-���������
  //FSocketCoordinator.Invalidate;
  // ���������� ������� - ������ �� ��������� ��������
  DoItemChange(Item);
end;

end.
