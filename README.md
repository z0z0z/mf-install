# mf-install
Media Foundation workaround for Wine
Test
Easily add Media Foundation support to a Wine prefix. Just set WINEPREFIX to a valid Wine prefix and run.

Example usage:

`WINEPREFIX="/home/$USER/.steam/steamapps/compatdata/$STEAM_ID/pfx" ./mf-install.sh`

Steam stores Proton Wine prefixes as `<STEAM FOLDER>/steamapps/compatdata/<GAME ID>/pfx`

Optionally you can use Proton's Wine instead of your system's Wine. The commands are then as shown below:

`WINEPREFIX="/home/$USER/.steam/steamapps/compatdata/$STEAM_ID/pfx" PROTON="/home/$USER/.steam/steamapps/common/Proton X.XX" ./mf-install.sh -proton`

Remember to change $USER, $STEAM_ID and Proton X.XX to their appropiate names, numbers and folders on your system. Also keep in mind that the paths shown in this readme are only examples of the most common locations. Your WINEPREFIX and Proton folder may be at very different locations depending on your distribution and how you installed Steam.

### Some known working games:
- American Fugitive
- Blasphemous
- BlazBlue: Central Fiction
- Breathedge
- Call of Cthulu 2018
- Car Mechanic Simulator 2018
- Children of Morta
- Danganronpa V3: Killing Harmony
- Dauntless
- Devotion
- FINAL FANTASY TYPE-0 HD
- GRIS
- Monster Hunter World
- Obduction
- PC Building Simulator
- Postal 4
- Stranded Sails - Explorers of the Cursed Islands
- Team Sonic Racing
- The Outer Worlds
- Yaga

And many more

### Resident Evil 2 and others that don't work:
See the repository below for an installcab based Media Foundation workaround that works with Resident Evil 2:

https://github.com/z0z0z/mf-installcab
