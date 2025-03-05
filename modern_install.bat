@setlocal enableextensions
@cd /d "%~dp0"
echo off
cls
echo "Adding registry entries..."
set backslash=
if not "%cd:~-1%" == "\" set backslash=\
REG.EXE ADD "HKLM\Software\Sierra OnLine" /V SIGSPAT /T REG_SZ /D "C:\Program Files\Sierra OnLine\SIGSPAT.EXE" /f
REG.EXE ADD "HKLM\Software\Sierra OnLine" /V MachineID /T REG_SZ /D "{FB954500-F948-11EF-A854-BB4824FE3306}" /f
REG.EXE ADD "HKLM\Software\Sierra OnLine\SODA Off-Road Racing" /f
REG.EXE ADD "HKLM\Software\Sierra OnLine\SODA Off-Road Racing\1.01.001" /f
REG.EXE ADD "HKLM\Software\Sierra OnLine\Setup" /f
REG.EXE ADD "HKLM\Software\Sierra OnLine\Setup\SODA" /V Directory /T REG_SZ /D "%CD%%backslash%"
REG.EXE ADD "HKLM\Software\Sierra OnLine\Setup\SODA" /V "Full Name" /T REG_SZ /D "SODA Off-Road Racing" /f
REG.EXE ADD "HKLM\Software\Software Allies" /f
REG.EXE ADD "HKLM\Software\Software Allies\SCOR" /f
REG.EXE ADD "HKLM\Software\Software Allies\SCOR\version 1.0" /V InstallType /T REG_SZ /D "1" /f
REG.EXE ADD "HKLM\Software\Software Allies\SCOR\version 1.0" /V CDpath /T REG_SZ /D "D:" /f
REG.EXE ADD "HKLM\Software\Software Allies\SCOR\version 1.0" /V HomeDir /T REG_SZ /D "%CD%%backslash%"
echo "Configuring compatibilty mode..."
REG.EXE ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /V "%CD%%backslash%offroad.exe" /T REG_SZ /D "~ RUNASADMIN 256COLOR 640x480 WIN95" /f
REG.EXE ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /V "%CD%%backslash%track.exe" /T REG_SZ /D "~ RUNASADMIN 256COLOR 640x480 WIN95" /f