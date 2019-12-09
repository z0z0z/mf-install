#!/bin/sh

check_env() {
    [ -z "$1" ] && echo "$2 is not set" && exit 1
}

check_sanity() {
    [ ! -d "$1/$2" ] && echo "$1 isn't a valid path" && exit 1
}

check_env "$WINEPREFIX" WINEPREFIX
check_sanity "$WINEPREFIX" drive_c

if [ "$1" == "-proton" ]; then

    check_env "$PROTON" PROTON
    check_sanity "$PROTON" dist/bin

    export WINE=""$PROTON"/dist/bin/wine"
    export WINE64=""$PROTON"/dist/bin/wine64"
    export WINESERVER=""$PROTON"/dist/bin/wineserver"
    export WINEDLLPATH=""$PROTON"/dist/lib/wine:"$PROTON"/dist/lib64/wine"
    export PATH=""$PROTON"/dist/bin:$PATH"

else

    export WINE="$(which wine)"
    export WINE64="$(which wine64)"
    check_env "$WINE" WINE
    check_env "$WINE64" WINE64

fi

set -e
export WINEDEBUG="-all"

overrideDll() {
    "$WINE" reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v $1 /d native /f
}

scriptdir=$(dirname "$0")
cd "$scriptdir"

cp -v syswow64/* "$WINEPREFIX/drive_c/windows/syswow64"
cp -v system32/* "$WINEPREFIX/drive_c/windows/system32"

overrideDll "colorcnv"
overrideDll "mf"
overrideDll "mferror"
overrideDll "mfplat"
overrideDll "mfplay"
overrideDll "mfreadwrite"
overrideDll "msmpeg2adec"
overrideDll "msmpeg2vdec"
overrideDll "sqmapi"

"$WINE" start regedit.exe mf.reg
"$WINE" start regedit.exe wmf.reg

"$WINE64" start regedit.exe mf.reg
"$WINE64" start regedit.exe wmf.reg

"$WINE" regsvr32 colorcnv.dll
"$WINE" regsvr32 msmpeg2adec.dll
"$WINE" regsvr32 msmpeg2vdec.dll

"$WINE64" regsvr32 colorcnv.dll
"$WINE64" regsvr32 msmpeg2adec.dll
"$WINE64" regsvr32 msmpeg2vdec.dll

