@echo off
echo ===============================================================================
CertUtil -hashfile "User\GC\USA\Card A\01-GMPE-MARIPA4BOX0.gci" | find /i "26 6d bf 6b 52 a1 8d 88 6e 93 4e 61 35 9b d2 7c 15 ff 19 73"
if not errorlevel 1 (
	echo Your Mario Party 4 save is correct!
	goto CheckMp5
) else (
	set GCSLOTA="n"
	set /p GCSLOTA=Your Mario Party 4 save has been changed. Replace? )
	if /I "%GCSLOTA%"=="yes" goto ReplaceMp4
	if /I "%GCSLOTA%"=="y" goto ReplaceMp4
	if /I "%GCSLOTA%"=="no" goto CheckMp5
	if /I "%GCSLOTA%"=="n" goto CheckMp5
)

:ReplaceMp4
copy /y "User\Backup\01-GMPE-MARIPA4BOX0.gci" "User\GC\USA\Card A"
CertUtil -hashfile "User\GC\USA\Card A\01-GMPE-MARIPA4BOX0.gci" | find /i "26 6d bf 6b 52 a1 8d 88 6e 93 4e 61 35 9b d2 7c 15 ff 19 73"
if not errorlevel 1 (
	echo You now have the correct Mario Party 4 file!
) else (
	color 4F
	echo There was an error replacing the Mario Party 4 file...
	pause
)

:CheckMp5
echo ===============================================================================
CertUtil -hashfile "User\GC\USA\Card A\01-GP5E-MARIPA5.gci" | find /i "c7 43 22 46 6c 71 39 65 11 ed 76 80 ba 47 92 4b 70 39 d7 51"
if not errorlevel 1 (
	echo Your Mario Party 5 save is correct!
	goto CheckMp6
) else (
	set GCSLOTA="n"
	set /p GCSLOTA=Your Mario Party 5 save has been changed. Replace? )
	if /I "%GCSLOTA%"=="yes" goto ReplaceMp5
	if /I "%GCSLOTA%"=="y" goto ReplaceMp5
	if /I "%GCSLOTA%"=="no" goto CheckMp6
	if /I "%GCSLOTA%"=="n" goto CheckMp6
)

:ReplaceMp5
copy /y "User\Backup\01-GP5E-MARIPA5.gci" "User\GC\USA\Card A"
CertUtil -hashfile "User\GC\USA\Card A\01-GP5E-MARIPA5.gci" | find /i "c7 43 22 46 6c 71 39 65 11 ed 76 80 ba 47 92 4b 70 39 d7 51"
if not errorlevel 1 (
	echo You now have the correct Mario Party 5 file!
) else (
	color 4F
	echo There was an error replacing the Mario Party 5 file...
	pause
)

:CheckMp6
echo ===============================================================================
CertUtil -hashfile "User\GC\USA\Card A\01-GP6E-MARIPA6.gci" | find /i "91 82 ab dd 1e b1 3b 6e f7 8a 26 d9 47 a5 ea f9 4b 04 53 f0"
if not errorlevel 1 (
	echo Your Mario Party 6 save is correct!
	goto CheckMp7
) else (
	set GCSLOTA="n"
	set /p GCSLOTA=Your Mario Party 6 save has been changed. Replace? )
	if /I "%GCSLOTA%"=="yes" goto ReplaceMp6
	if /I "%GCSLOTA%"=="y" goto ReplaceMp6
	if /I "%GCSLOTA%"=="no" goto CheckMp7
	if /I "%GCSLOTA%"=="n" goto CheckMp7
)

:ReplaceMp6
copy /y "User\Backup\01-GP6E-MARIPA6.gci" "User\GC\USA\Card A"
CertUtil -hashfile "User\GC\USA\Card A\01-GP6E-MARIPA6.gci" | find /i "91 82 ab dd 1e b1 3b 6e f7 8a 26 d9 47 a5 ea f9 4b 04 53 f0"
if not errorlevel 1 (
	echo You now have the correct Mario Party 6 file!
) else (
	color 4F
	echo There was an error replacing the Mario Party 6 file...
	pause
)

:CheckMp7
echo ===============================================================================
CertUtil -hashfile "User\GC\USA\Card A\01-GP7E-MARIPA7.gci" | find /i "e9 2e a0 cb 00 88 fd 72 aa 0f 19 26 9a 15 a9 19 58 58 d6 39"
if not errorlevel 1 (
	echo Your Mario Party 7 save is correct!
	goto CheckRest
) else (
	set GCSLOTA="n"
	set /p GCSLOTA=Your Mario Party 7 save has been changed. Replace? )
	if /I "%GCSLOTA%"=="yes" goto ReplaceMp7
	if /I "%GCSLOTA%"=="y" goto ReplaceMp7
	if /I "%GCSLOTA%"=="no" goto CheckRest
	if /I "%GCSLOTA%"=="n" goto CheckRest
)

:ReplaceMp7
copy /y "User\Backup\01-GP7E-MARIPA7.gci" "User\GC\USA\Card A"
CertUtil -hashfile "User\GC\USA\Card A\01-GP7E-MARIPA7.gci" | find /i "e9 2e a0 cb 00 88 fd 72 aa 0f 19 26 9a 15 a9 19 58 58 d6 39"
if not errorlevel 1 (
	echo You now have the correct Mario Party 7 file!
) else (
	color 4F
	echo There was an error replacing the Mario Party 7 file...
	pause
)

:CheckRest
echo ===============================================================================
xcopy "User\Backup\others" "User\GC\USA\Card A" /s /y /e /q
echo Your other GC saves are correct!

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
CertUtil -hashfile "User\Wii\title\00010000\53535145\data\save.dat" | find /i "b5 ad 58 34 06 7d e2 6b 04 e2 01 8b 19 f3 8a ab af 02 a4 5e"
if errorlevel 1 (
	xcopy "User\Backup\title\00010000\53535145" "User\Wii\title\00010000\53535145" /s /y /e
	echo Your Mario Party 9 save was incorrect, but is now correct!
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