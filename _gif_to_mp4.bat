echo off

set file=%1
set filename=%~n1
set filetype=%~x1

ffmpeg -i %file% -pix_fmt yuv420p %filename%_gif.mp4