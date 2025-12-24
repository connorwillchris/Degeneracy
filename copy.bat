:: Mostly used by ConnorWillChris


:: your computer's username
set USER_NAME=Connor

:: where the mod folder is located on your system
set USER_MOD_PROJECT="C:\Users\%USER_NAME%\Documents\Projects\Balatro Modding\myMods"
set COPY_DIR="C:\Users\Connor\AppData\Roaming\Balatro\Mods"
set PROJECT_NAME=Degeneracy

cd %COPY_DIR%
rmdir %PROJECT_NAME% /S /Q
mkdir %PROJECT_NAME%
robocopy %USER_MOD_PROJECT%\%PROJECT_NAME%\ %COPY_DIR%\%PROJECT_NAME%\ * /E /XD .vscode /XF copy.bat
