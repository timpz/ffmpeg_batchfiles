echo off

set file=%1

if not exist "%file%" (
	echo File does not exist, press any key to exit...
	pause > nul
	exit
)

set filename=%~n1
set filetype=%~x1

ffmpeg -i %file% -vcodec libx265 -fs 7500k %filename%_discord%filetype%
