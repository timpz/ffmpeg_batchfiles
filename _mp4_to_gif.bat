@echo off

set file=%1
set filename=%~n1
set filetype=%~x1

echo Please enter the desired framerate:
set /p framerate=

echo Please enter the desired width:
set /p width=

ffmpeg -i %file% -vf "fps=%framerate%,scale=%width%:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 %filename%_gif.gif