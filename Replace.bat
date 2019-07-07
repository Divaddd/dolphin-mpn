@echo off
echo ===============================================================================
CertUtil -hashfile "User\GC\MPN-A.USA.raw" | find /i "18 58 79 d9 42 ce 98 90 84 fe 85 a1 58 51 2a ad 88 71 0d 70"
if not errorlevel 1 (
	echo Your GameCube Slot A Memory Card is correct!
	goto CheckGcB
) else (
	set GCSLOTA="n"
	set /p GCSLOTA=Your GameCube Slot A Memory Card has been changed. Replace? )
	if /I "%GCSLOTA%"=="yes" goto ReplaceGcA
	if /I "%GCSLOTA%"=="y" goto ReplaceGcA
	if /I "%GCSLOTA%"=="no" goto CheckGcB
	if /I "%GCSLOTA%"=="n" goto CheckGcB
)

:ReplaceGcA
copy /y User\Backup\MPN-A.USA.raw User\GC
CertUtil -hashfile "User\GC\MPN-A.USA.raw" | find /i "18 58 79 d9 42 ce 98 90 84 fe 85 a1 58 51 2a ad 88 71 0d 70"
if not errorlevel 1 (
	echo You now have the correct GameCube Slot A files!
) else (
	color 4F
	echo There was an error replacing the GameCube Slot A files...
	pause
)

:CheckGcB

:CheckWii
echo ===============================================================================
CertUtil -hashfile "User\Wii\title\00010000\524d3845\data\mp8save.bin" | find /i "1f 7f 16 9f 96 4a 62 69 fa 5f d1 fd 16 39 d0 13 1f 44 f3 7a"
if not errorlevel 1 (
	echo Your Wii saves are correct!
	goto CheckRest
) else (
	set WII="n"
	set /p WII=Your Wii saves have been changed. Replace? )
	if /I "%WII%"=="yes" goto ReplaceWii
	if /I "%WII%"=="y" goto ReplaceWii
	if /I "%WII%"=="no" goto CheckRest
	if /I "%WII%"=="n" goto CheckRest
)

:ReplaceWii
xcopy "User\Backup\title\00010000" "User\Wii\title\00010000" /s /y /e
CertUtil -hashfile "User\Wii\title\00010000\524d3845\data\mp8save.bin" | find /i "1f 7f 16 9f 96 4a 62 69 fa 5f d1 fd 16 39 d0 13 1f 44 f3 7a"
if not errorlevel 1 (
	echo You now have the correct Wii files!
) else (
	color 4F
	echo There was an error replacing the Wii files...
	pause
)

:CheckRest
echo ===============================================================================
CertUtil -hashfile "User\Wii\title\00010000\53535145\data\save.dat" | find /i "36 9a e1 07 f7 28 99 e2 d7 dd 77 8f 1d 6a f1 bd 1a 8a 73 9e"
if errorlevel 1 (
	xcopy "User\Backup\title\00010000\53535145" "User\Wii\title\00010000\53535145" /s /y /e
	echo Your Mario Party 9 save has been replaced!
)
CertUtil -hashfile "User\Wii\title\00010001\4e415a45\data\EEP_NMWE" | find /i "96 7c bd 79 f7 a0 59 b4 63 80 31 e7 e1 5b 13 bc 80 24 b1 82"
if errorlevel 1 (
	xcopy "User\Backup\title\00010001\4e415a45" "User\Wii\title\00010001\4e415a45" /s /y /e
	echo Your MP2 Virtual Console save was incorrect, but is now correct!
)
echo ===============================================================================
color 2F
echo The check is done!
pause
start Dolphin
exit