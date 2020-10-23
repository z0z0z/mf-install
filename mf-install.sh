#!/bin/bash

check_env() {
    [ -z "$1" ] && echo "$2 is not set" && exit 1
}

check_sanity() {
    [ ! -d "$1/$2" ] && echo "$1 isn't a valid path" && exit 1
}

override_dll() {
    wine reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v $1 /d native /f
}

check_env "$WINEPREFIX" WINEPREFIX
check_sanity "$WINEPREFIX" drive_c

if [ "$1" = "-proton" ]; then

    check_env "$PROTON" PROTON
    check_sanity "$PROTON" dist/bin

    export PATH="$PROTON/dist/bin:$PATH"
    export WINESERVER="$PROTON/dist/bin/wineserver"
    export WINELOADER="$PROTON/dist/bin/wine"
    export WINEDLLPATH="$PROTON/dist/lib/wine:$PROTON/dist/lib64/wine"

fi

set -e
export WINEDEBUG="-all"

scriptdir="$(dirname "$(realpath "$0")")"
cd "$scriptdir"

cp -v syswow64/* "$WINEPREFIX/drive_c/windows/syswow64"
cp -v system32/* "$WINEPREFIX/drive_c/windows/system32"

override_dll "colorcnv"
override_dll "mf"
override_dll "mferror"
override_dll "mfplat"
override_dll "mfplay"
override_dll "mfreadwrite"
override_dll "msmpeg2adec"
override_dll "msmpeg2vdec"
override_dll "sqmapi"

wine start regedit.exe mf.reg
wine start regedit.exe wmf.reg

wine64 start regedit.exe mf.reg
wine64 start regedit.exe wmf.reg

wine regsvr32 colorcnv.dll
wine regsvr32 msmpeg2adec.dll
wine regsvr32 msmpeg2vdec.dll

wine64 regsvr32 colorcnv.dll
wine64 regsvr32 msmpeg2adec.dll
wine64 regsvr32 msmpeg2vdec.dll

