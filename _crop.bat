@echo off

set file=%1
set filename=%~n1
set filetype=%~x1

echo Please enter the desired width:
set /p width=

echo Please enter the desired height:
set /p height=

echo Please enter the X offset:
set /p offsetX=

echo Please enter the X offset:
set /p offsetY=

ffmpeg -i %file% -filter:v "crop=%width%:%height%:%offsetX%:%offsetY%" %filename%_cropped%filetype%
