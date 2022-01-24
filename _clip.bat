@echo off

set file=%1

if not exist "%file%" (
	echo File does not exist, press any key to exit...
	pause > nul
	exit
)

set filename=%~n1_clip
set filetype=%~x1





:backtostart
echo Please enter what time to clip from:
set /p renderseek=

echo Please enter what time to clip to:
set /p renderto=

echo Enter a name for the clip to rename it,
echo otherwise leave blank:
set /p newfilename=
if /i not "%newfilename%"=="" set filename=%newfilename%

echo Enter a filetype for the clip (including the '.'),
echo otherwise leave blank:
set /p newfiletype=
if /i not "%newfiletype%"=="" set filetype=%newfiletype%

set rendering=copy
echo Do you want to rerender the video? (y/n):
set /p rerender=
if /i "%rerender%"=="y" set rendering=libx265

echo -------------------
echo Input file: %file% 
echo Cut from %renderseek% to %renderto%
echo export %filename%%filetype% with codec %rendering%, 
echo is that correct? (y/n):
set /p confirmation=
if /i not "%confirmation%"=="y" goto backtostart

ffmpeg.exe -ss %renderseek% -to %renderto% -i %file% -c:v %rendering% -c:a copy %filename%%filetype%
echo Render finished, press any key to exit...
pause > nul
exit


