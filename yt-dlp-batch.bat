::
:: yt-dlp Batch
::
:: Copyright (c) 2022 Per-Terra
:: Released under the MIT license
:: https://opensource.org/licenses/mit-license.php
::
:: Check yt-dlp repository for more options
:: https://github.com/yt-dlp/yt-dlp
::

@echo off
setlocal ENABLEDELAYEDEXPANSION

:settings
    :: https://github.com/yt-dlp/yt-dlp#output-template
    :: default: %%(uploader)s\%%(upload_date)s %%(title)s [%%(id)s].%%(ext)s
    set NAME=%%(uploader)s\%%(upload_date)s %%(title)s [%%(id)s].%%(ext)s

    :: https://github.com/yt-dlp/yt-dlp#format-selection
    :: default: bestvideo+bestaudio/best
    set FORMAT=bestvideo+bestaudio/best

    :: yt-dlp path
    :: default: yt-dlp
    set YTDLP=yt-dlp

    :: output path
    :: default: %~dp0yt-dlp
    set OUTPUT=%~dp0yt-dlp

    :: options
    set OPTIONS=--ignore-errors --geo-bypass-country JP --embed-thumbnail --embed-metadata --embed-chapters

    :: use aria2 if available
    where aria2c >nul 2>&1
    if %ERRORLEVEL% equ 0 (set OPTIONS=%OPTIONS% --downloader aria2c --downloader "dash,m3u8:native")

    :: example: save other informations
    ::set OPTIONS=%OPTIONS% --write-description --write-thumbnail --write-subs --sub-langs all,-live_chat --sub-format vtt --embed-subs

    :: example: save other informations, comments and live_chat
    ::set OPTIONS=%OPTIONS% --write-description --write-comments --write-thumbnail --write-subs --sub-langs all --sub-format vtt --embed-subs

    :: use cookies
    if exist "youtube.com_cookies.txt" (
        set OPTIONS=%OPTIONS% --cookies "youtube.com_cookies.txt"
    ) else (
        set OPTIONS=%OPTIONS% --cookies-from-browser chrome
    )

:check
where %YTDLP% >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo yt-dlp not found.
    echo PATH is not set. Check PATH.
    echo Or, you can specify the path of yt-dlp.
    echo Edit this Batch file directly.
    echo Example: set YTDLP=C:\path\to\yt-dlp.exe
)

:initialize
title yt-dlp Batch
echo :::::::::::::::::::::::::::::::::
echo ::                             ::
echo :: yt-dlp Batch                ::
echo :: download video using yt-dlp ::
echo ::                             ::
echo :::::::::::::::::::::::::::::::::
echo.
echo -----------------------------------------------------------
echo OUTPUT PATH:
echo %OUTPUT%
echo.
echo FILENAME TEMPLATE:
echo %NAME%
echo.
echo FORMAT:
if "%USER_FORMAT%" == "" (echo %FORMAT%) else (echo %USER_FORMAT%)
echo.
echo OPTIONS:
echo %OPTIONS%
echo -----------------------------------------------------------
echo You can change these settings by editing this file.
echo.
echo.
echo Commands:
echo f: Change FORMAT  s: Show available formats  u: Update yt-dlp  c: Clear Window  q: Quit

:input
echo.
set /p INPUT="URL/COMMAND: "

if "%INPUT%" == "" goto input

if "%INPUT%" == "f" (
    set USER_FORMAT=
    set /p USER_FORMAT="Enter Format here: "
    if "!USER_FORMAT!" == "" (
        echo Format is not specified.
        echo Default format is used.
    ) else (
        echo FORMAT is changed to !USER_FORMAT!
    )
    goto input
)

if "%INPUT%" == "s" (
    set /p URL="Enter URL to show available formats: "
    echo.
    %YTDLP% --list-formats %OPTIONS% "!URL!"
    goto input
)

if "%INPUT%" == "u" (
    %YTDLP% --update
    goto input
)

if "%INPUT%" == "c" (
    cls
    goto initialize
)

if "%INPUT%" == "q" (
    echo.
    echo Exiting...
    exit /b
)

set URL="%INPUT%"

:process
echo.
echo Download Started...
echo.
if "%USER_FORMAT%" == "" (
    %YTDLP% %OPTIONS% --output "%OUTPUT%\%NAME%" --format %FORMAT% %URL%
) else (
    %YTDLP% %OPTIONS% --output "%OUTPUT%\%NAME%" --format %USER_FORMAT% %URL%
)

:finish
echo.
if %ERRORLEVEL% neq 0 (
    echo Download failed.
    echo Please check the log.
    echo.
    echo Press any key to continue...
    pause >nul
) else (
    echo Download completed.
)
goto input