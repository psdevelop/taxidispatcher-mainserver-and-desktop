Set ProcessName=TDAppServer.exe
TaskList /FI "ImageName EQ %ProcessName%" 2>nul|Find /I "%ProcessName%">nul||(
Start "" /D "G:\DATA\YandexDisk\Operate\TD\TDDesktop\TaxiManager\ServerModules\TDAppServer2005" "G:\DATA\YandexDisk\Operate\TD\TDDesktop\TaxiManager\ServerModules\TDAppServer2005\TDAppServer.exe")
nul||(Start "DISPATCHERS SERVER" "C:\Users\Public\Documents\PRFILES\nodejs\node.exe" "C:\Users\Public\Documents\PRFILES\nodejs\td_app\dispatch_index.js")
nul||(Start "CLIENTS SERVER" "C:\Users\Public\Documents\PRFILES\nodejs\node.exe"  "C:\Users\Public\Documents\PRFILES\nodejs\td_app\index.js")