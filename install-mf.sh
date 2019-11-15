#!/bin/bash

[ -z "$WINEPREFIX" ] && echo "WINEPREFIX not set" && exit 1

set -e

overrideDll() {
  wine reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v $1 /d native /f
}

declare -a arr=("syswow64" "system32")
for i in "${arr[@]}"; do
  cd $(dirname "$0")
  if [ -d "$WINEPREFIX/drive_c/windows/$i" ]; then
    cp -v $i/* "$WINEPREFIX/drive_c/windows/$i"
    overrideDll "mf"
    overrideDll "mferror"
    overrideDll "mfplat"
    overrideDll "mfplay"
    overrideDll "mfreadwrite"
    overrideDll "msmpeg2adec"
    overrideDll "msmpeg2vdec"
    overrideDll "sqmapi"
    export WINEDEBUG="-all"
    if [[ $i == "syswow64" ]]; then
      wine64 start regedit.exe mf.reg
      wine64 start regedit.exe wmf.reg
      wine64 regsvr32 msmpeg2vdec.dll
      wine64 regsvr32 msmpeg2adec.dll
      wine64 regsvr32 colorcnv.dll
    elif [[ $i == "system32" ]]; then
      wine start regedit.exe mf.reg
      wine start regedit.exe wmf.reg
      wine regsvr32 msmpeg2vdec.dll
      wine regsvr32 msmpeg2adec.dll
      wine regsvr32 colorcnv.dll
    fi
  fi
done
