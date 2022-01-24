@echo off

set file1=%1
set file2=%2

if not exist "%file1%" (
	echo File 1 does not exist, press any key to exit...
	pause > nul
	exit
)

set filename1=%~n1
set filetype1=%~x1

if not exist "%file2%" (
	echo File 2 does not exist, press any key to exit...
	pause > nul
	exit
)

set filename2=%~n2
set filetype2=%~x2

if /i not "%filetype1%"=="%filetype2%" (
	echo Filetypes do not match, exiting...
	pause > nul
	exit
)

set rendering=copy
echo Do you want to rerender the video? (y/n):
set /p rerender=
if /i "%rerender%"=="y" set rendering=libx265

(echo file '%file1%' & echo file '%file2%' )>concatlist.txt
ffmpeg -f concat -safe 0 -i concatlist.txt -c:v %rendering% -c:a copy %filename1%_concat_%filename2%%filetype1%
del concatlist.txt > nul

echo Render finished, press any key to exit...
pause > nul
exit