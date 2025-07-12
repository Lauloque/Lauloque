@echo off
setlocal enabledelayedexpansion

:: Detect whether we run from double-clicking the bat file in the file exporer or from the terminal.
:: In the latter case, we can skip the pauses since we don't need them from the terminal.
for %%x in (%cmdcmdline%) do if /i "%%~x"=="/c" set DOUBLECLICKED=1

:: Check if GitHub CLI is installed
gh --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [91mError: GitHub CLI is not installed or not in PATH[0m
    echo [91mPlease install GitHub CLI from https://cli.github.com/[0m
    if defined DOUBLECLICKED pause
    exit /b 1
) else (
    echo [92mFound Github CLI[0m
)

:: Set theme (you can change this)
set THEME=catppuccin_mocha

:: Get current authenticated username
for /f "tokens=*" %%u in ('gh api user --jq ".login"') do set USERNAME=%%u

echo [96mFetching owned, unarchived repositories for user: %USERNAME%[0m
echo [96mGenerating GitHub Readme Stats cards...[0m
echo.

:: Get list of owned, unarchived repositories and generate cards
for /f "tokens=*" %%R in ('gh repo list --limit 1000 --json name^,isArchived^,isFork --jq ".[] | select(.isArchived == false and .isFork == false) | .name"') do (
    call :generate_card "%%R"
)

echo [92mDone! Copy the markdown above to your README.md file.[0m
if defined DOUBLECLICKED pause
exit /b 0

:generate_card
setlocal disabledelayedexpansion
set REPO_NAME=%~1
echo [![Repo Card](https://github-readme-stats.vercel.app/api/pin/?username=%USERNAME%^&repo=%REPO_NAME%^&theme=%THEME%)](https://github.com/%USERNAME%/%REPO_NAME%)
endlocal
goto :eof
