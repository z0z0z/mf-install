# mf-install
Media Foundation workaround for Wine

Easily add Media Foundation support to a Wine prefix. Just set WINEPREFIX and run.

### Usage:

To run successfully this script requires wine.i686 to be installed.
Replace `<app_id>` below with the number found in the URL in the game links below such as `774361` for Blasphemous.
The game must have been started once for the `pfx` folder to be created before running the `install-mf.sh` script.
`WINEPREFIX=~/.local/share/Steam/steamapps/compatdata/<app_id>/pfx ./install-mf.sh`

### Known working games:

- [Monster Hunter: World](https://www.protondb.com/app/683320)
- [BlazBlue CentralFiction](https://www.protondb.com/app/683320)
- [GRIS](https://www.protondb.com/app/683320)
- [Breathedge](https://www.protondb.com/app/738520)
- [FINAL FANTASY TYPE-0 HD](https://www.protondb.com/app/340170)
- [Car Mechanic Simulator 2018](https://www.protondb.com/app/645630)
- [PC Building Simulator](https://www.protondb.com/app/621060)
- [American Fugitive](https://www.protondb.com/app/934780)
- Dauntless
- [Danganronpa V3: Killing Harmony](https://www.protondb.com/app/567640)
- [Spyro Reignited Trilogy](https://www.protondb.com/app/996580)
- [Blasphemous](https://www.protondb.com/app/774361)
- [Children of Morta](https://www.protondb.com/app/330020)

### Resident Evil 2 and others that don't:
See this repository for an installcab based Media Foundation workaround that works with Resident Evil 2 https://github.com/z0z0z/mf-installcab
