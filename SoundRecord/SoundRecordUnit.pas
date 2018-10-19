{
Прием и показ звука с одного из входов "Запись"
и запись в файл wav с нормализацией
оригинал: programania.com/sv.zip
}
unit SoundRecordUnit;

interface

uses
 Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
 Dialogs, StdCtrls, ExtCtrls, ComCtrls, MMSystem, Buttons;

type
  TSoundRecForm = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Button3: TButton;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    RecordTimer: TTimer;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure RecordTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SaveSoundFile(FileName: string);
    procedure RecEndSaveFile;
    procedure RecordTalk;
  private
    { Private declarations }
  public
//  другой вариант
//  procedure OnWaveIn(var Msg: TMessage); message MM_WIM_DATA;
    { Public declarations }
  end;

TData16 = array [0..127] of smallint;
PData16 = ^TData16;
tWaveFileHdr = packed record
  riff: array[0..3] of Char;
  len: DWord;
  cWavFmt: array[0..7] of Char;
  dwHdrLen: DWord;
  wFormat: Word;
  wNumChannels: Word;
  dwSampleRate: DWord;
  dwBytesPerSec: DWord;
  wBlockAlign: Word;
  wBitsPerSample: Word;
  cData: array[0..3] of Char;
  dwDataLen: DWord;
end;

const
nc=2;             // число каналов
fo=44100;         // Частота отсчетов в сек
BufSize=fo div 2;

var
SoundRecForm: TSoundRecForm;
RecQuantCount: Integer=0;

implementation

uses ModelDM, MainForm, DateUtils;

var
WaveIn: hWaveIn;
hBuf: THandle;
BufHead: TWaveHdr;
m:array[1..bufSize*nc] of smallInt;//массив для показа
h,w,h2:integer;
zs:boolean=false;   //запущен прием звука
//Для записи в wav
rec:boolean=false;  //идет запись
mz :array of smallInt;
waveHdr:tWaveFileHdr;
qz:integer;  //записано отсчетов звука
maxZ:integer;//максимальный уровень записаного для нормализации

{$R *.DFM}

PROCEDURE iniWav;
begin
with WaveHdr do begin
WaveHdr.riff := 'RIFF';
WaveHdr.cWavFmt := 'WAVEfmt ';
WaveHdr.dwHdrLen := 16;
WaveHdr.wFormat := 1;
WaveHdr.wNumChannels := nc;
WaveHdr.dwSampleRate := fo;
WaveHdr.wBlockAlign := nc*2;
WaveHdr.dwBytesPerSec := fo*2*nc;
WaveHdr.wBitsPerSample := 16;
WaveHdr.cData := 'data';
WaveHdr.len :=qz*2-44100;
WaveHdr.dwDataLen :=WaveHdr.len;
end;
end;

procedure TSoundRecForm.SaveSoundFile(FileName: string);
var i: Integer;
    fw: file;
begin

  if qz>0 then begin

//Нормализация
   if CheckBox2.checked and (maxZ<28000) then
     for i:=1 to qz do mz[i]:=mz[i]*32000 div maxZ;

//вывод в файл wav
    iniWav;
    assignFile(fw,CDP+'\sound.wav');
    rewrite(fw,1);
    blockWrite(fw,waveHdr,sizeOf(waveHdr));
    blockWrite(fw,mz[1],qz*2);
    closeFile(fw);
    //showMessage('Записала в '+FileName);
    CopyFile(PChar(CDP+'\sound.wav'),PChar(FileName),True);//PChar( StringReplace ( PChar(StringReplace(PChar(FileName),':','_',[rfReplaceAll]) ) ,'.','_',[rfReplaceAll])+'.wav'),True);
    label2.visible:=false;
    BitBtn1.caption:='Запись';

end;

end;

procedure TSoundRecForm.RecEndSaveFile;
begin
if not rec then
 begin
  qz:=0;
  maxZ:=0;
  rec:=true;
  label2.visible:=true;
  BitBtn1.caption:='Стой';
 end; 
  try
    RecQuantCount:=
      StrToInt(IniFile.ReadString('BUSINESS_DATA','call_rec_time_quant_count','3'));
  except
    ShowMessage('Проверьте значение параметра call_rec_time_quant_count файла инициаизации, оно должно представлять собой целое число!');
    FirstForm.Close;
  end;
end;
{
другой вариант
procedure TForm1.OnWaveIn;
var
data16: PData16;
begin
data16 := PData16(PWaveHdr(Msg.lParam)^.lpData);
move(data16^[0],m,BufSize*2);
if data16^[0]<>m[1] then showMessage('Не успела');
}
procedure WOutProc(h:HWAVEOUT;Msg:UINT;Inst,par1,par2:Dword);stdcall;
var
i,d,z,s,x,y,xx,max,s0: integer;
begin
d:=1;
if not zs then exit;
//сразу пустим запись дальше чтоб не прерывалась
WaveInAddBuffer(WaveIn, addr(BufHead), sizeof(BufHead));
//перепишем звук из массива в который пишется
//в массив который обрабатывается чтоб запись его не портила
move(BufHead.lpData^,m,BufSize*2*nc);

//Обработка звука
s:=0;
s0:=0;
max:=0;
for i := 1 to BufSize*nc do begin
  z:=m[i];
  if odd(i)or(nc=1) then inc(s0,z);
  z:=abs(z);
  inc(s,z);
  if z>max then max:=z;
end;

if rec then begin
//запись в массив для файла wav
  if max>maxZ then maxZ:=max;
  setLength(mz,qz+bufSize*nc+1);
  move(m[1],mz[qz+1],BufSize*2*nc);
  inc(qz,BufSize*nc);
 if not ExitAttr then
  SoundRecForm.label2.caption:='Записала '+formatFloat('0.00',qz*2*nc/1000000)+' мб';
end;

//показ звука
s:=s div (bufSize*nc);
s0:=s0 div bufSize;
if not ExitAttr then
  SoundRecForm.label1.caption:='среднее='+intToStr(s)+
            '    максимум='+intToStr(max)+
            '    постоянный уровень='+intToStr(s0);

if not ExitAttr then
begin
 with SoundRecForm.image1.Picture.Bitmap.canvas do begin

  fillRect(rect(0,0,w,h));
  pen.color:=$CCCCCC; moveTo(w,h2); lineTo(0,h2);
  pen.color:=0;
 end;
end;
if max<16 then max:=16;
if not ExitAttr then
  if SoundRecForm.checkBox1.checked then d:=BufSize else d:=w;

for x:=1 to w do begin
  xx:=x*BufSize div d;
  y:=h2+(m[xx div nc*nc+nc-1]-s0)*h2 div max;
if not ExitAttr then
  if x=1 then SoundRecForm.image1.Picture.Bitmap.canvas.moveTo(0,y) else
    SoundRecForm.image1.Picture.Bitmap.canvas.lineTo(x,y);
end;


end;

PROCEDURE stop;
begin
  if not zs then Exit;
    WaveInUnPrepareHeader(WaveIn, addr(BufHead), sizeof(BufHead));
  WaveInClose(WaveIn);
  GlobalUnlock(hBuf);
  GlobalFree(hBuf);
  zs:=false;
end;

PROCEDURE start;

var
header: TWaveFormatEx;
BufLen: dword;
buf: pointer;

begin
if zs then exit;
 with header do begin
   wFormatTag := WAVE_FORMAT_PCM;
   nChannels := nc;
   nSamplesPerSec := fo;
   wBitsPerSample := 16;
   nBlockAlign := nChannels * (wBitsPerSample div 8);
   nAvgBytesPerSec := nSamplesPerSec * nBlockAlign;
   cbSize := 0;
 end;
WaveInOpen(Addr(WaveIn), WAVE_MAPPER, addr(header),integer(@WOutProc),0,CALLBACK_FUNCTION);
//Другой вариант
// WaveInOpen(Addr(WaveIn), WAVE_MAPPER, addr(header),Form1.Handle, 0, CALLBACK_WINDOW);

 BufLen := header.nBlockAlign * BufSize;
 hBuf := GlobalAlloc(GMEM_MOVEABLE and GMEM_SHARE, BufLen);
 Buf := GlobalLock(hBuf);
 with BufHead do begin
   lpData := Buf;
   dwBufferLength := BufLen;
   dwFlags := WHDR_BEGINLOOP;
 end;
 WaveInPrepareHeader(WaveIn, Addr(BufHead), sizeof(BufHead));
 WaveInAddBuffer(WaveIn, addr(BufHead), sizeof(BufHead));
 zs:=true;
 WaveInStart(WaveIn);
End;

procedure TSoundRecForm.FormCreate(Sender: TObject);
begin
  w:=image1.width;
  h:=image1.height;
  h2:=h div 2;
  image1.Picture.Bitmap.width:=w;
  image1.Picture.Bitmap.height:=h;
  //start;
end;


procedure TSoundRecForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  stop;
end;

procedure TSoundRecForm.Button3Click(Sender: TObject);
begin
  winExec('SndVol32.exe /r',SW_SHOW);
end;

procedure TSoundRecForm.RecordTalk;
begin
if not rec then
 begin
  qz:=0;
  maxZ:=0;
  rec:=true;
  label2.visible:=true;
  BitBtn1.caption:='Стой';
 end; 
  try
    RecQuantCount:=
      StrToInt(IniFile.ReadString('BUSINESS_DATA','call_rec_time_quant_count','3'));
    FirstForm.StatusBar.Panels[4].Text:=
      'Запись разговора, осталось '+IntToStr(RecQuantCount)+'...';
  except
    ShowMessage('Проверьте значение параметра call_rec_time_quant_count файла инициаизации, оно должно представлять собой целое число!');
    FirstForm.Close;
  end;
end;

procedure TSoundRecForm.BitBtn1Click(Sender: TObject);
var fw:file; i:integer;
begin
if rec then begin
  rec:=false;
  if qz>0 then begin

//Нормализация
   if CheckBox2.checked and (maxZ<28000) then
     for i:=1 to qz do mz[i]:=mz[i]*32000 div maxZ;

//вывод в файл wav
    iniWav;
    assignFile(fw,'sound.wav');
    rewrite(fw,1);
    blockWrite(fw,waveHdr,sizeOf(waveHdr));
    blockWrite(fw,mz[1],qz*2);
    closeFile(fw);
    showMessage('Записала в sound.wav');
    label2.visible:=false;
    BitBtn1.caption:='Запись';

end;
end
else begin
  qz:=0;
  maxZ:=0;
  rec:=true;
  label2.visible:=true;
  BitBtn1.caption:='Стой';
end;
end;

procedure TSoundRecForm.RecordTimerTimer(Sender: TObject);
begin
if RecQuantCount>0  then
  try
   if RecQuantCount=1 then
    if rec then begin
      rec:=false;
      SaveSoundFile(CDP+'\CallRecords\rec'+
        //IntToStr(Integer(YearOf(IncSecond((Today+Time),-5*StrToInt(IniFile.ReadString('BUSINESS_DATA','call_rec_time_quant_count','3'))))))
        IntToStr(Integer(MonthOfTheYear(IncSecond((Today+Time),-5*StrToInt(IniFile.ReadString('BUSINESS_DATA','call_rec_time_quant_count','3'))))))
        +'_'+IntToStr(Integer(DayOfTheMonth(IncSecond((Today+Time),-5*StrToInt(IniFile.ReadString('BUSINESS_DATA','call_rec_time_quant_count','3'))))))
        +'_'+IntToStr(Integer(HourOfTheDay(IncSecond((Today+Time),-5*StrToInt(IniFile.ReadString('BUSINESS_DATA','call_rec_time_quant_count','3'))))))
        +'_'+IntToStr(Integer(MinuteOfTheHour(IncSecond((Today+Time),-5*StrToInt(IniFile.ReadString('BUSINESS_DATA','call_rec_time_quant_count','3'))))))
        +'_'+IntToStr(Integer(SecondOfTheMinute( IncSecond((Today+Time),-5*StrToInt(IniFile.ReadString('BUSINESS_DATA','call_rec_time_quant_count','3')))  )))+

        //DateTimeToStr(IncSecond((Today+Time),-5*StrToInt(IniFile.ReadString('BUSINESS_DATA','call_rec_time_quant_count','3'))) )+' - '+
        //DateTimeToStr(Today+Time)+
        '.wav');
      FirstForm.StatusBar.Panels[4].Text:=
        'Разговор записан';
    end;

  finally
     RecQuantCount:=
       RecQuantCount-1;
    if RecQuantCount>1 then
     FirstForm.StatusBar.Panels[4].Text:=
      'Запись разговора, осталось '+IntToStr(RecQuantCount)+'...';
  end;
end;

procedure TSoundRecForm.BitBtn2Click(Sender: TObject);
begin
  SoundRecForm.RecordTalk;
end;

end.
