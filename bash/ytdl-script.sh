@echo off

set /p link="Enter YouTube Link: "

set /p playlist="Is this a playlist? (y/n): "

if /i "%playlist%"=="y" (
    set /p format="Do you want to download the playlist in MP4 or MP3 format? (mp4/mp3): "
    if /i "%format%"=="mp4" (
        youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" "%link%"
    ) else (
        youtube-dl -x --audio-format mp3 "%link%"
    )
) else (
    set /p format="Do you want to download the video in MP4 or MP3 format? (mp4/mp3): "
        youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" "%link%"
    if /i "%format%"=="mp4" (
    ) else (
        youtube-dl -x --audio-format mp3 "%link%"
    )
)

pause
