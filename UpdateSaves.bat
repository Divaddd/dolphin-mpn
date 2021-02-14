TASKKILL /IM Dolphin.exe /F
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Divaddd/dolphin-mpn/master/mpn-saves.zip', 'mpn-saves.zip')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Divaddd/dolphin-mpn/master/Replace.bat', 'Replace.bat')"
7z x mpn-saves.zip -oUser\Backup * -r -y
del "mpn-saves.zip"