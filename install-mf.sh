#!/bin/sh

[ -z "$WINEPREFIX" ] && echo "WINEPREFIX not set" && exit 1

set -e

overrideDll() {
  wine reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v $1 /d native /f
}

scriptdir=$(dirname "$0")
cd "$scriptdir"

cp -v syswow64/* "$WINEPREFIX/drive_c/windows/syswow64"
cp -v system32/* "$WINEPREFIX/drive_c/windows/system32"

overrideDll "mf"
overrideDll "mferror"
overrideDll "mfplat"
overrideDll "mfplay"
overrideDll "mfreadwrite"
overrideDll "msmpeg2adec"
overrideDll "msmpeg2vdec"
overrideDll "sqmapi"

export WINEDEBUG="-all"

wine start regedit.exe mf.reg
wine start regedit.exe wmf.reg
wine64 start regedit.exe mf.reg
wine64 start regedit.exe wmf.reg

wine64 regsvr32 msmpeg2vdec.dll
wine64 regsvr32 msmpeg2adec.dll
wine64 regsvr32 colorcnv.dll

wine regsvr32 msmpeg2vdec.dll
wine regsvr32 msmpeg2adec.dll
wine regsvr32 colorcnv.dll
