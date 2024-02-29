@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
    set "unixPath=~"
) else (
    cd /d %~1
    if errorlevel 1 (
        set "unixPath=~"
    ) else (
        set "workingDir=!cd!"
        set "workingDir=!workingDir:\=/!"
        set "unixPath=/mnt/!workingDir:~0,1!/!workingDir:~3!"
        
    )
)
wt.exe new-tab -p Ubuntu -- wsl.exe -d Ubuntu /usr/bin/zsh -ci "cd $(echo '!unixPath!' | tr '[:upper:]' '[:lower:]' | sed 's:\\:/:g') && nvim -c 'Ex'&& zsh -i"
endlocal