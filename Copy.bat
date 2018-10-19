mkdir "%~dp0\TaxiDispatcherProduct\CallRecords"
mkdir "%~dp0\TaxiDispatcherProduct\SoundRecord"
mkdir "%~dp0\TaxiDispatcherProduct\VideoRecords"
mkdir "%~dp0\TaxiDispatcherProduct\TDAppServer2005"
mkdir "%~dp0\TaxiDispatcherProduct\TDAppServer2005\SendSMS"
xcopy "%~dp0\anapamap" "%~dp0\TaxiDispatcherProduct\anapamap" /f /i /s /e /y
xcopy "%~dp0\evolution" "%~dp0\TaxiDispatcherProduct\evolution" /f /i /s /e /y
xcopy "%~dp0\Reports" "%~dp0\TaxiDispatcherProduct\Reports" /f /i /s /e /y
xcopy "%~dp0\Skins" "%~dp0\TaxiDispatcherProduct\Skins" /f /i /s /e /y
xcopy "%~dp0\sql_settings" "%~dp0\TaxiDispatcherProduct\sql_settings" /f /i /s /e /y
copy "%~dp0\adr_sample.cds" "%~dp0\TaxiDispatcherProduct\adr_sample.cds" /y
copy "%~dp0\AllTaxSumm.cds" "%~dp0\TaxiDispatcherProduct\AllTaxSumm.cds" /y
copy "%~dp0\AnswerCommands.atc" "%~dp0\TaxiDispatcherProduct\AnswerCommands.atc" /y
copy "%~dp0\EFFECTIVEDgr.cds" "%~dp0\TaxiDispatcherProduct\EFFECTIVEDgr.cds" /y
copy "%~dp0\HandDownCommand.atc" "%~dp0\TaxiDispatcherProduct\HandDownCommand.atc" /y
copy "%~dp0\midas.dll" "%~dp0\TaxiDispatcherProduct\midas.dll" /y
copy "%~dp0\proba.cds" "%~dp0\TaxiDispatcherProduct\proba.cds" /y
copy "%~dp0\sound.wav" "%~dp0\TaxiDispatcherProduct\sound.wav" /y
copy "%~dp0\TaxiDispatcher.exe" "%~dp0\TaxiDispatcherProduct\TaxiDispatcher.exe" /y
copy "%~dp0\TaxiDispatcher.exe" "%~dp0\TaxiDispatcherProduct\TaxiDispatcher.exe" /y
copy "%~dp0\TaxiDispatcher_default.udl" "%~dp0\TaxiDispatcherProduct\TaxiDispatcher.udl" /y
copy "%~dp0\TaxiDispatcher.ini" "%~dp0\TaxiDispatcherProduct\TaxiDispatcher.ini" /y
copy "%~dp0\UnionDisp_default.udl" "%~dp0\TaxiDispatcherProduct\UnionDisp.udl" /y
copy "%~dp0\UnionDisp.ini" "%~dp0\TaxiDispatcherProduct\UnionDisp.ini" /y
copy "%~dp0\ServerModules\TDAppServer2005\midas.dll" "%~dp0\TaxiDispatcherProduct\TDAppServer2005\midas.dll" /y
copy "%~dp0\ServerModules\TDAppServer2005\MSG_TABLE_BACKUP.cds" "%~dp0\TaxiDispatcherProduct\TDAppServer2005\MSG_TABLE_BACKUP.cds" /y
copy "%~dp0\ServerModules\TDAppServer2005\MSG_TABLE_BAKUP.adgt" "%~dp0\TaxiDispatcherProduct\TDAppServer2005\MSG_TABLE_BAKUP.adgt" /y
copy "%~dp0\ServerModules\TDAppServer2005\RemoteControl.udl" "%~dp0\TaxiDispatcherProduct\TDAppServer2005\RemoteControl.udl" /y
copy "%~dp0\ServerModules\TDAppServer2005\RemoteControlAlt1.udl" "%~dp0\TaxiDispatcherProduct\TDAppServer2005\RemoteControlAlt1.udl" /y
copy "%~dp0\ServerModules\TDAppServer2005\RemoteControlAlt2.udl" "%~dp0\TaxiDispatcherProduct\TDAppServer2005\RemoteControlAlt2.udl" /y
copy "%~dp0\ServerModules\TDAppServer2005\TaxiAppServer_default.ini" "%~dp0\TaxiDispatcherProduct\TDAppServer2005\TaxiAppServer.ini" /y
copy "%~dp0\ServerModules\TDAppServer2005\TaxiDispatcherServer_default.udl" "%~dp0\TaxiDispatcherProduct\TDAppServer2005\TaxiDispatcherServer.udl" /y
copy "%~dp0\ServerModules\TDAppServer2005\TDAppServer.exe" "%~dp0\TaxiDispatcherProduct\TDAppServer2005\TDAppServer.exe" /y
copy "%~dp0\ServerModules\TDAppServer2005\SendSMS\Stack.cds" "%~dp0\TaxiDispatcherProduct\TDAppServer2005\SendSMS\Stack.cds" /y