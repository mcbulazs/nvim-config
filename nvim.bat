@echo off
setlocal
cd /d %~1
set "currentDirectory=%cd%"
set "driveLetter=%currentDirectory:~0,1%"
set "pathWithoutDrive=%currentDirectory:~3%"

wt.exe new-tab -p Ubuntu -- wsl.exe -d Ubuntu /usr/bin/zsh -ci "cd $(echo /mnt/'%driveLetter%/%pathWithoutDrive%' | tr '[:upper:]' '[:lower:]' | sed 's:\\:/:g') && nvim -c 'Ex'&& zsh -i"
