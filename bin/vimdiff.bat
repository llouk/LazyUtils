@echo off
rem -- Run Vim --
rem # uninstall key: vim82 #

setlocal
set VIM_EXE_DIR=C:\Program Files\vim82
if exist "%VIM%\vim82\vim.exe" set VIM_EXE_DIR=%VIM%\vim82
if exist "%VIMRUNTIME%\vim.exe" set VIM_EXE_DIR=%VIMRUNTIME%

if not exist "%VIM_EXE_DIR%\vim.exe" (
    echo "%VIM_EXE_DIR%\vim.exe" not found
    goto :eof
)

"%VIM_EXE_DIR%\vim.exe" -d %*
