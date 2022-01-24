echo off

set file=%1

if not exist "%file%" (
	echo File does not exist, press any key to exit...
	pause > nul
	exit
)

set filename=%~n1
set filetype=%~x1

ffmpeg -i %file% -vcodec libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p %filename%_whatsapp%filetype%
