# mf-install
Media Foundation workaround for Wine

Easily add Media Foundation support to a Wine prefix. Just set WINEPREFIX and run.

Example usage:

`WINEPREFIX="/home/gaben/.local/share/Steam/steamapps/compatdata/{appid}/pfx" ./mf-install.sh`

Optionally you can use Proton's Wine instead of your system:

```
export WINEPREFIX="/home/gaben/.local/share/Steam/steamapps/compatdata/{appid}/pfx"
export PROTON="/home/gaben/.local/share/Steam/steamapps/common/Proton 4.11"
./mf-install.sh -proton
```

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
