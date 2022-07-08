@echo off

set file=%1
set filename=%~n1
set filetype=%~x1

mkdir frames_%filename%

ffmpeg -i %filename%%filetype% frames_%filename%\%filename%-%%04d.png