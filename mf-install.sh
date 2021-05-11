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

# User instructions:
# Set PROTON to a Proton folder (in common not compatdata) just like WINEPREFIX, pass -proton to script
if [ "$1" = "-proton" ]; then

    check_env "$PROTON" PROTON

    if [ -d "$PROTON/files" ]; then
        prefix="files"
    elif [ -d "$PROTON/dist" ]; then
        prefix="dist"
    fi

    check_sanity "$PROTON" $prefix/bin

    export PATH="$PROTON/$prefix/bin:$PATH"
    export WINESERVER="$PROTON/$prefix/bin/wineserver"
    export WINELOADER="$PROTON/$prefix/bin/wine"
    export WINEDLLPATH="$PROTON/$prefix/lib/wine:$PROTON/$prefix/lib64/wine"

fi

set -e
export WINEDEBUG="-all"

scriptdir="$(dirname "$(realpath "$0")")"
cd "$scriptdir"

cp -vf syswow64/* "$WINEPREFIX/drive_c/windows/syswow64"
cp -vf system32/* "$WINEPREFIX/drive_c/windows/system32"

override_dll "colorcnv"
override_dll "mf"
override_dll "mferror"
override_dll "mfplat"
override_dll "mfplay"
override_dll "mfreadwrite"
override_dll "msmpeg2adec"
override_dll "msmpeg2vdec"
override_dll "sqmapi"

wine regedit.exe mf.reg
wine regedit.exe wmf.reg

wine64 regedit.exe mf.reg
wine64 regedit.exe wmf.reg

wine regsvr32 colorcnv.dll
wine regsvr32 msmpeg2adec.dll
wine regsvr32 msmpeg2vdec.dll

wine64 regsvr32 colorcnv.dll
wine64 regsvr32 msmpeg2adec.dll
wine64 regsvr32 msmpeg2vdec.dll

