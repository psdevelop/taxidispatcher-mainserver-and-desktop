{
  +-----------------------------------------------------------------------------
  |
  | Notice: this component has not been tested yet!
  |
  | DMW20Drv.pas
  |
  | TCommPortDriver add-on: Datalogic MW20 Hand Held Pen Driver
  | v1.00/32 - November 14th, 1997
  |
  | Written by M. Cocco (d3k@mdnet.it)
  |
  +-----------------------------------------------------------------------------
}

{$A-} { Record Fields Word Align Off }

unit DMW20Drv;

interface

uses
  Windows, Messages, SysUtils, Classes,

  ComDrv32; { Uses TCommPortDriver v1.07 or later }

type
  { MW20 Protocols }
  TMW20Protocol = ( mwpNative,    { MW20 Native }
                    mwpACKNACK ); { Generic ACK-NACK PC32 }

  { Error codes - returned by Download method }
  TMW20DownloadError = ( mwdeOk,           { Download terminated ok }
                         mwdeNoDriver,     { COMDriver is nil }
                         mwdeCOMError,     { COM port error }
                         mwdeCOMTimeout,   { COM port timeout }
                         mwdeAborted );    { Aborted }

  TMW20Driver = class(TComponent)
  private
    { COM port driver }
    FCOMDriver: TCommPortDriver;
    { MW20 Protocol }
    FProtocol: TMW20Protocol;
  protected
    { Handle component deletions (design-time only) }
    procedure Notification( AComponent: TComponent; Operation: TOperation ); override;
    { Download data using the MW20 Native protocol }
    function DownloadNative( dest: TStringList ): TMW20DownloadError;
    { Download data using the MW20 ACK-NACK PC32 protocol }
    function DownloadACKNACK( dest: TStringList ): TMW20DownloadError;
  public
    { Constructor }
    constructor Create( AOwner: TComponent ); override;
    { Destructor }
    destructor Destroy; override;

    { Download data from the MW20 pen }
    function Download( dest: TStringList ): TMW20DownloadError;

  published
    { COM port driver }
    property COMDriver: TCommPortDriver read FCOMDriver write FCOMDriver;
    { Protocol }
    property Protocol: TMW20Protocol read FProtocol write FProtocol default mwpACKNACK;
  end;

procedure Register;

implementation

  { ACK-NACK PC32 PROTOCOL

    Each block of data has the following structure:

    +----+----+----+----+--------------+----+----+----+----+
    | st | s1 | s2 | id | ... data ... | ct | c1 | c2 | cr |
    +----+----+----+----+--------------+----+----+----+----+

    Where fields have the following meaning:

    st: Synchronization character: '-'
        Put at the beginning of each block. This character is used to
        synchronize the receiver on the first character of the block.

    s1: ASCII value (hex digit) of the first significant nibble of the
        character count. This character together with the following
        one (s2) represents the number of characters in the data field
        of the block.

    s2: ASCII value (hex digit) of the least significant nibble of the
        character count. This character together with the previous
        one represents the number of characters in the data field of
        the block.

    id: This character is "1" (ASCII $31) in the first block,
        "0" (ASCII $30) in the last block. In all the other blocks this
        character identifies the block contents and its value is
        assigned by the application program.

    data: This field has variable length and contains data.

    ct: This is the block counter; this number is increased by every
        new block, starting from "0" (ASCII $30) in the first block up
        to "9" (ASCII $39). When this counter reaches the value "9" it
        rolls over the "0". This character can be tested by the receiver
        to detect if some block has been omitted or lost.

    c1: ASCII value of the most significant nibble of the checksum
        character. This character, together with the following one (c2),
        contains the checksum information.

    c2: ASCII value of the least significant nibble of thee checksum
        character. This character, together with the previous one (c1),
        contains the checksum information. The checksum character is
        computed performing binary addition on all the characters of
        the block (excluding the synchronization character, i.e. the
        starting "-").

    cr: This is the block terminator flag, the ASCII character CR ($0D).

    With the ACK-NACK PC32 protocol, after trasmitting every block, the
    MW20 stops and waits for the ACK character (ASCII $06) from the
    host computer. If the host computer receives the block correctly,
    it will answer with ACK and the trasmission continues with the next
    block; otherwise it will answer with NACK (ASCII $15) and the block
    will be trasmitted again until it is correctly received.

    If, for any reason, the MW20 receives a character different from
    ACK and NACK, it will send a NACK to the host requiring the
    trasmission of the acknowledge character. After a certain number
    of consecutive NACK (about 30), the trasmission will be aborted
    and and error is issued on the host console.

    When the ACK-NACK protocol is selected, the RTS and CTS signals are
    ignored by the MW20 and therefore only two wires (TX and RX) plus
    the ground signal are used for the comunication.

    The last block of the trasmission is always "-0000FF" (without
    the quotes).

    [Protocol description excerpt from Datalogic DW20 User's Manual]
    [Copyright Datalogic. All rights reserved] }

{ Constructor }
constructor TMW20Driver.Create( AOwner: TComponent );
begin
  { Call ancestor }
  inherited Create( AOwner );
  { Init properties }
  Protocol := mwpACKNACK;
end;

{ Destructor }
destructor TMW20Driver.Destroy;
begin
  { Call ancestor }
  inherited Destroy;
end;

{ Handle component deletions (design-time only) }
procedure TMW20Driver.Notification( AComponent: TComponent; Operation: TOperation );
begin
  { Call ancestor }
  inherited Notification( AComponent, Operation );
  { If user removed the TCommPortDriver component then
    set COMDriver property to nil }
  if (AComponent = FCOMDriver) and (Operation = opRemove) then
    FCOMDriver := nil;
end;

{ Download data from the MW20 pen }
function TMW20Driver.Download( dest: TStringList ): TMW20DownloadError;
var wasOpen: boolean;
begin
  { Check COM driver }
  if (FCOMDriver = nil) or not (FCOMDriver is TCommPortDriver) then
  begin
    Result := mwdeCOMError;
    exit;
  end;
  { Open COM port }
  wasOpen := FCOMDriver.Connected;
  if not wasOpen and not FCOMDriver.Connect then
  begin
    Result := mwdeCOMTimeout;
    exit;
  end;
  { Download data }
  case FProtocol of
    mwpNative: { MW20 Native }
      Result := DownloadNative( dest );
    mwpACKNACK: { Generic ACK-NACK PC32 }
      Result := DownloadACKNACK( dest );
  end;
  { Close COM port }
  if not wasOpen then
    FCOMDriver.Disconnect;
end;

{ Download data using the MW20 Native protocol }
function TMW20Driver.DownloadNative( dest: TStringList ): TMW20DownloadError;
begin
  raise Exception.Create( 'Native protocol not implemented yet!' );
end;

{ Download data using the MW20 ACK-NACK PC32 protocol }
function TMW20Driver.DownloadACKNACK( dest: TStringList ): TMW20DownloadError;
const ACK = chr( $06 );
      NACK = chr( $15 );
      CR = chr( $0D );
      HEXDIGITS = '0123456789ABCDEF';
var savedRXTimeout: UINT;
    lastACode, c,
    s1, s2, id, ct, c1, c2: char;
    nRetries, dataSz, i, ckSum: integer;
    data: string;
begin
  try
    { Stop COM polling }
    FCOMDriver.PausePolling;
    { Save COM port input timeout }
    savedRXTimeout := FCOMDriver.InputTimeout;
    { Set RX timeout to 5 seconds }
    FCOMDriver.InputTimeout := 5000; { ms }
    { Clear the destination string list }
    dest.Clear;
    { Send initial ACK - starts download }
    lastACode := ACK;
    if not FCOMDriver.SendChar( ACK ) then
    begin
      Result := mwdeCOMTimeout;
      exit;
    end;
    { Receive data blocks }
    nRetries := 0;
    repeat
      { Get next character }
      if not FCOMDriver.ReadChar( c ) then
      begin
        Result := mwdeCOMTimeout;
        exit;
      end;
      { If NACK reveived then resend last acknowledge code
        (abort after 30 retries) }
      if c = NACK then
      begin
        if nRetries > 30 then
        begin
          { Cannot resume handshaking with the MW20.
            Stop downloading data. }
          Result := mwdeAborted;
          exit;
        end;
        { Resend last acknowledge code }
        if not FCOMDriver.SendChar( lastACode ) then
        begin
          Result := mwdeCOMTimeout;
          exit;
        end;
        continue;
      end;
      { [st] Synchronize on the first character of the block }
      if c <> '-' then
        continue;
      { [s1,s2] Read character count }
      if not FCOMDriver.ReadChar( s1 ) and
         not FCOMDriver.ReadChar( s2 ) then
      begin
        Result := mwdeCOMTimeout;
        exit;
      end;
      { Check character count }
      if (pos(s1,HEXDIGITS)=0) or (pos(s2,HEXDIGITS)=0) then
      begin
        FCOMDriver.FlushBuffers( true, true );
        if nRetries > 30 then
        begin
          { Cannot resume handshaking with the MW20.
            Stop downloading data. }
          Result := mwdeAborted;
          exit;
        end;
        { Ask the MW20 to resend the block }
        lastACode := NACK;
        if not FCOMDriver.SendChar( lastACode ) then
        begin
          Result := mwdeCOMTimeout;
          exit;
        end;
        continue;
      end;
      { [id] Read the ID which identifies the contents of the block }
      if not FCOMDriver.ReadChar( id ) then
      begin
        Result := mwdeCOMTimeout;
        exit;
      end;
      { [data] Read the data }
      dataSz := pos(s1,HEXDIGITS) * 16 + pos(s2,HEXDIGITS);
      data := '';
      while dataSz > 0 do
      begin
        if not FCOMDriver.ReadChar( c ) then
        begin
          Result := mwdeCOMTimeout;
          exit;
        end;
        data := data + c;
        dec( dataSz );
      end;
      { [ct] Read the block counter }
      if not FCOMDriver.ReadChar( ct ) then
      begin
        Result := mwdeCOMTimeout;
        exit;
      end;
      { [c1,c2] Read the checksum }
      if not FCOMDriver.ReadChar( c1 ) and
         not FCOMDriver.ReadChar( c2 ) then
      begin
        Result := mwdeCOMTimeout;
        exit;
      end;
      { Check the checksum }
      if (pos(c1,HEXDIGITS)=0) or (pos(c2,HEXDIGITS)=0) then
      begin
        FCOMDriver.FlushBuffers( true, true );
        if nRetries > 30 then
        begin
          { Cannot resume handshaking with the MW20.
            Stop downloading data. }
          Result := mwdeAborted;
          exit;
        end;
        { Ask the MW20 to resend the block }
        lastACode := NACK;
        if not FCOMDriver.SendChar( lastACode ) then
        begin
          Result := mwdeCOMTimeout;
          exit;
        end;
        continue;
      end;
      { [cr] Read the block terminator flag }
      if not FCOMDriver.ReadChar( c ) then
      begin
        Result := mwdeCOMTimeout;
        exit;
      end;
      { Check the value of the block terminator flag }
      if c <> CR then
      begin
        FCOMDriver.FlushBuffers( true, true );
        if nRetries > 30 then
        begin
          { Cannot resume handshaking with the MW20.
            Stop downloading data. }
          Result := mwdeAborted;
          exit;
        end;
        { Ask the MW20 to resend the block }
        lastACode := NACK;
        if not FCOMDriver.SendChar( lastACode ) then
        begin
          Result := mwdeCOMTimeout;
          exit;
        end;
        continue;
      end;
      { If is the last block the we have terminated }
      if (s1='0') and (s2='0') and (id='0') and (ct='0') and
         (c1='F') and (c2='F') then
        break;
      { Verify if the block has been received with no errors }
      ckSum := integer(s1) + integer(s2) + integer(id) +
               integer(ct);
      for i := 1 to length(data) do
        ckSum := ckSum + ord(data[i]);
      ckSum := ckSum and 255;
      if IntToHex(ckSum,2) <> (c1+c2) then
      begin
        FCOMDriver.FlushBuffers( true, true );
        if nRetries > 30 then
        begin
          { Cannot resume handshaking with the MW20.
            Stop downloading data. }
          Result := mwdeAborted;
          exit;
        end;
        { Ask the MW20 to resend the block }
        lastACode := NACK;
        if not FCOMDriver.SendChar( lastACode ) then
        begin
          Result := mwdeCOMTimeout;
          exit;
        end;
        continue;
      end;
      { Data is ok. Send ACK. }
      if not FCOMDriver.SendChar( ACK ) then
      begin
        Result := mwdeCOMTimeout;
        exit;
      end;
      { Data is ok. Store it into the destination list }
      dest.Add( id + ':' + data );
    until false;
    Result := mwdeOk;
  finally
    { Restore COM port input timeout }
    FCOMDriver.InputTimeout := savedRXTimeout;
    { Resume COM polling }
    FCOMDriver.ContinuePolling;
  end;
end;

procedure Register;
begin
  RegisterComponents('System', [TMW20Driver]);
end;

end.
