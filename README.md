# May 2020 Notice

For many games this script is not needed anymore, and may soon not be needed at all.

This is largely thanks to work Guy1524 has done in officially implementing Media Foundation support into Wine. I would reccommend trying games with latest Proton-GE first, and only using this as a backup.

# mf-install
Media Foundation workaround for Wine

Easily add Media Foundation support to a Wine prefix. Just set WINEPREFIX to a valid Wine prefix and run.

Example usage:

`WINEPREFIX="/dev/brain/wine prefixes can be anywhere/folder" ./mf-install.sh`

Steam stores Proton Wine prefixes as `<STEAM FOLDER>/steamapps/compatdata/<GAME ID>/pfx`

Optionally you can use Proton's Wine instead of your system's Wine. See the script for how.

For CPUs with more than 8 physical cores see this known issue: https://github.com/z0z0z/mf-install/issues/44

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

### Alternative method:
See the repository below for an installcab based Media Foundation workaround that works with some games that this doesn't, and vice versa:

https://github.com/z0z0z/mf-installcab
