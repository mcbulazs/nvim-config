@echo off
setlocal

if "%~1"=="" (
    set "unixPath=~"
) else (
    cd /d %~1
    set "currentDirectory=%cd%"
    set "driveLetter=%currentDirectory:~0,1%"
    set "pathWithoutDrive=%currentDirectory:~3%"
    set "unixPath=/mnt/%driveLetter%/%pathWithoutDrive%"
)

wt.exe new-tab -p Ubuntu -- wsl.exe -d Ubuntu /usr/bin/zsh -ci "cd $(echo '%unixPath%' | tr '[:upper:]' '[:lower:]' | sed 's:\\:/:g') && nvim -c 'Ex'&& zsh -i"
