@echo off
setlocal

:::  ________  _______   ________   _______   ___      ___ ________  ___       _______   ________   ________  _______      
::: |\   __  \|\  ___ \ |\   ___  \|\  ___ \ |\  \    /  /|\   __  \|\  \     |\  ___ \ |\   ___  \|\   ____\|\  ___ \     
::: \ \  \|\ /\ \   __/|\ \  \\ \  \ \   __/|\ \  \  /  / | \  \|\  \ \  \    \ \   __/|\ \  \\ \  \ \  \___|\ \   __/|    
:::  \ \   __  \ \  \_|/_\ \  \\ \  \ \  \_|/_\ \  \/  / / \ \  \\\  \ \  \    \ \  \_|/_\ \  \\ \  \ \  \    \ \  \_|/__  
:::   \ \  \|\  \ \  \_|\ \ \  \\ \  \ \  \_|\ \ \    / /   \ \  \\\  \ \  \____\ \  \_|\ \ \  \\ \  \ \  \____\ \  \_|\ \ 
:::    \ \_______\ \_______\ \__\\ \__\ \_______\ \__/ /     \ \_______\ \_______\ \_______\ \__\\ \__\ \_______\ \_______\
:::     \|_______|\|_______|\|__| \|__|\|_______|\|__|/       \|_______|\|_______|\|_______|\|__| \|__|\|_______|\|_______|
::: 
:::  _____ ______   _______   ________   ________  ___  ________  ___  ___     
::: |\   _ \  _   \|\  ___ \ |\   ____\ |\   ____\|\  \|\   __  \|\  \|\  \    
::: \ \  \\\__\ \  \ \   __/|\ \  \___|_\ \  \___|\ \  \ \  \|\  \ \  \\\  \   
:::  \ \  \\|__| \  \ \  \_|/_\ \_____  \\ \_____  \ \  \ \   __  \ \   __  \  
:::   \ \  \    \ \  \ \  \_|\ \|____|\  \\|____|\  \ \  \ \  \ \  \ \  \ \  \ 
:::    \ \__\    \ \__\ \_______\____\_\  \ ____\_\  \ \__\ \__\ \__\ \__\ \__\
:::     \|__|     \|__|\|_______|\_________\\_________\|__|\|__|\|__|\|__|\|__|
:::                             \|_________\|_________|
::: ___  ________   ________  _________  ________  ___       ___       _______   ________     
::: |\  \|\   ___  \|\   ____\|\___   ___\\   __  \|\  \     |\  \     |\  ___ \ |\   __  \    
::: \ \  \ \  \\ \  \ \  \___|\|___ \  \_\ \  \|\  \ \  \    \ \  \    \ \   __/|\ \  \|\  \   
:::  \ \  \ \  \\ \  \ \_____  \   \ \  \ \ \   __  \ \  \    \ \  \    \ \  \_|/_\ \   _  _\  
:::   \ \  \ \  \\ \  \|____|\  \   \ \  \ \ \  \ \  \ \  \____\ \  \____\ \  \_|\ \ \  \\  \| 
:::    \ \__\ \__\\ \__\____\_\  \   \ \__\ \ \__\ \__\ \_______\ \_______\ \_______\ \__\\ _\ 
:::     \|__|\|__| \|__|\_________\   \|__|  \|__|\|__|\|_______|\|_______|\|_______|\|__|\|__|
:::                    \|_________|

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

:: Play background music from audio
cd audio
set "file=New D2.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..

timeout /t 3

:: Download the code
echo As-salamu alaykum!!
echo detecting presence of repo, git cloning if not detected...
echo ---------------------------------------------------------------
if exist app\ goto Menu1
git clone https://github.com/BenevolenceMessiah/ComfyUI.git
cd ComfyUI
git pull
echo ---------------------------------------------------------------

:Menu1
echo Please choose from the following options:
echo Note: These options are all case sensitive.
echo Press Ctrl+c to exit at any time!
echo ---------------------------------------------------------------
echo 1 Install
echo 2 Download (some of the best) image generation AI models!
echo 3 Run
echo C) Exit
echo F) Fix. Run this to fix the program.
echo U) Update all downloaded models, ComfyUI, and any corresponding dependencies.
echo S) Play music via standalone cmd console while you wait for things to install/download!
echo ---------------------------------------------------------------

set /P option=Enter your choice:
if %option% == 1 goto Install
if %option% == 2 goto Menu3
if %option% == 2 goto Run
if %option% == C goto End
if %option% == F goto Fix
if %option% == U goto Updater
if %option% == S goto Music

:Menu3
echo Please choose from the following options:
echo ---------------------------------------------------------------
echo 1. Download ThePhotographer
echo 2. Download DreamPlace_ArchiGEN
echo 3. Download ATouchOfColor_ATC (LoRA)
echo 4. Download Brutalis (LoRA)
echo C) Exit
echo M) Main Menu
echo U) Update all downloaded models

set /P option=Enter your choice: 

if %option% == 1 goto option8
if %option% == 2 goto option9
if %option% == 3 goto option10
if %option% == 4 goto option11
if %option% == C goto end
if %option% == M goto Menu1
if %option% == U goto Updater

:option8
echo Downloading ThePhotographer
echo ---------------------------------------------------------------
cd models
if not exist checkpoints mkdir checkpoints
cd checkpoints
git lfs install
git clone https://huggingface.co/Human23/ThePhotographer
cd ..
cd ..
echo ---------------------------------------------------------------
:: Play background music from audio
cd audio
set "file=New D2.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
goto Menu1

:option9
echo Downloading DreamPlace_ArchiGEN
echo ---------------------------------------------------------------
cd models
if not exist checkpoints mkdir checkpoints
cd checkpoints
git lfs install
git clone https://huggingface.co/Human23/DreamPlace_ArchiGEN
cd ..
cd ..
echo ---------------------------------------------------------------
:: Play background music from audio
cd audio
set "file=New D2.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
goto Menu1

:option10
echo Downloading ATouchOfColor_ATC
echo ---------------------------------------------------------------
cd models
if not exist loras mkdir loras
cd loras
git lfs install
git clone https://huggingface.co/Human23/ATouchOfColor_ATC
cd ..
cd ..
echo ---------------------------------------------------------------
:: Play background music from audio
cd audio
set "file=New D2.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
goto Menu1

:option11
echo Downloading Brutalis
echo ---------------------------------------------------------------
cd models
if not exist loras mkdir loras
cd loras
git lfs install
git clone https://huggingface.co/Human23/Brutalis
cd ..
cd ..
echo ---------------------------------------------------------------
:: Play background music from audio
cd audio
set "file=New D2.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
goto Menu1

:Music
echo Installing music dependencies if not installed...
echo ---------------------------------------------------------------
if not exist Audio_Assets git clone https://github.com/BenevolenceMessiah/Audio_Assets.git
cd Audio_Assets
echo 
start call launch_in_standalone_console.bat
cd ..
cd ..
go to Menu1

:Updater
echo Updating all models!
ls | xargs -I{} git -C {} pull
echo ---------------------------------------------------------------
goto Menu1


:: Create and activate a Python virtual environment
:Install
echo Creating virtual environment
echo ---------------------------------------------------------------
if not exist venv (
    py -3.10 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
echo ---------------------------------------------------------------

:: Step B: Install Dependencies
echo ---------------------------------------------------------------
echo Installing python requirements from requirements.txt and extra junk to make this work on Windows in one file.
echo ---------------------------------------------------------------
pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu124
:: pip install --upgrade torch torchvision
pip install -r requirements.txt
echo installed!
echo ---------------------------------------------------------------
goto Menu1

:Fix
echo running the fix-it!
echo Creating virtual environment
echo ---------------------------------------------------------------
if not exist venv (
    py -3.10 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
echo ---------------------------------------------------------------
pip uninstall torch
pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu124
pip install -r requirements.txt
Fix applied! Run it again!
goto Menu1

:Run
echo Running ComfyUI!
echo ---------------------------------------------------------------
if not exist venv (
    py -3.10 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
echo ---------------------------------------------------------------
call python main.py
goto Menu1


:End 
echo ---------------------------------------------------------------
echo As-salamu alaykum!!
echo ---------------------------------------------------------------
pause