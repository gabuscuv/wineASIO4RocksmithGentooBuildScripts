## Based on https://github.com/theNizo/linux_rocksmith/blob/main/guides/setup/arch-pipewire.md
## This highly oriented to Gentoo, Notice (gentoo)lib == (others)lib32, lib64 == (others)lib

git reset --hard
git pull

STEAMLIBRARY=$HOME/steam
PROTON="$STEAMLIBRARY/compatibilitytools.d/GE-Proton8-4/files"
ROOT="/usr"
ASIO2DIR="/opt/ASIOSDK2"


commonPath="/lib/wine"
commonPath64="/lib64/wine"

x86unix="$commonPath/i386-unix"
x86windows="$commonPath/i386-windows"

x64unix="$commonPath64/x86_64-unix"
x64windows="$commonPath64/x86_64-windows"

patch Makefile.mk < includepatch.patch

cp $ASIO2DIR/common/asio.h ./

make 32

./prepare_64bit_asio.sh

make 64

cp build32/wineasio.dll "$PROTON$x86windows/wineasio.dll"
cp build64/wineasio.dll "$PROTON$x64windows/wineasio.dll"


cp build32/wineasio.dll.so "$PROTON$x86unix/wineasio.dll.so"
cp build64/wineasio.dll.so "$PROTON$x64unix/wineasio.dll.so"

cp build32/wineasio.dll $STEAMLIBRARY/steamapps/compatdata/221680/pfx/drive_c/windows/system32/
cp build32/wineasio.dll $STEAMLIBRARY/steamapps/compatdata/221680/pfx/drive_c/windows/syswow64/

sudo sh -c "
cp build32/wineasio.dll "$ROOT$x86windows/wineasio.dll"
cp build64/wineasio.dll "$ROOT$commonPath/x86_64-unix/wineasio.dll"
cp build32/wineasio.dll.so "$ROOT$x86unix/wineasio.dll.so"
cp build64/wineasio.dll.so "$ROOT$commonPath/x86_64-unix/wineasio.dll.so"
"