TASKKILL /IM Dolphin.exe /F
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Divaddd/dolphin-mpn/master/mpn-codes.zip', 'mpn-codes.zip')"
7z e mpn-codes.zip -oUser\GameSettings * -y
del "mpn-codes.zip"