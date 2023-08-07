# WineASIO4RocksmithGentooBuildScripts
## Description
I just did this because I don't want k\*\*\* myself everytime when there is new Proton version or easy setup or just to reach the mental peace.
## Use
- Clone wineAsio, Copy this two files.
- Install Rocksmith2014 and Pipewire (or Jack)
- Get copy of ASIOHeaders, and replace the content of variable ASIO2DIR with your directory
- Set the PROTON Directory and SteamLibrary Variables
- run the script
- Maybe It's needed `WINEPREFIX=$STEAMLIBRARY/steamapps/compatdata/221680/pfx $PROTON/bin/wine regsvr32 /usr/lib32/wine/i386-windows/wineasio.dll`
- You finished and you can reach the mental peace.
