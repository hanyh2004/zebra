 1),TARGET_OS=NATIVE_WINDOWS make libleveldb.a libmemenv.a
 2),qmake "USE_QRCODE=1" "USE_UPNP=1" "USE_IPV6=1" zerba-win.pro
 3),mingw32-make -f Makefile.Release
 
 

updated full guide for new version of photon --- 8.9.6

use virtual box and the necessary iso image to build a new windows 7 system
(Strongly recommended)

Install msys shell from here http://sourceforge.net/projects/mingw/files/Installer/mingw-get-setup.exe/download

When you launch the installer check only after the initial install msysbase.bin(automake,autoconf,libtool)

Apply that and let the installer download the necessary files.

Install this version of the mingw builds project toolchain

http://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win32/Personal%20Builds/mingw-builds/4.9.2/threads-posix/dwarf/i686-4.9.2-release-posix-dwarf-rt_v3-rev1.7z/download

Use 7z to unpack it and put it on the root or c drive in a folder called mingw32

In the win 7 control pannel go to user accounts -- change user account settings--- pull the lever all the way down, setting it to never notify you when software makes changes to the system.

Right click on 'mycomputer' and click properties, then click advanced system settings, and environment variables,
carefully edit your

Path

put this first with a semicolen after it in front of what is allready there

C:\mingw32\bin;%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\

NOW ----------  unpack / place the following items to a folder on your c drive called 'deps'

OpenSSL

download open ssl 1.0.2e here

https://www.openssl.org/source/openssl-1.0.2e.tar.gz

open the folder C:\MinGW\msys\1.0\msys.bat and double click on the bat file to open a msy shell (a way of running a unix/linux type shell on win)

cd /c/deps/

tar xvfz openssl-1.0.2e.tar.gz

cd openssl-1.0.2e

./Configure no-zlib no-shared no-dso no-krb5 no-camellia no-capieng no-cast no-dtls1 no-gost no-gmp no-heartbeats no-idea no-jpake no-md2 no-mdc2 no-rc5 no-rdrand no-rfc3779 no-rsax no-sctp no-seed no-sha0 no-static_engine no-rc2 no-rc4 no-ssl2 no-ssl3 no-test mingw  

make depend

make

Next download Berkeley DB (version 4.8.30)

http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz

cd /c/deps/


tar xvfz db-4.8.30.NC.tar.gz


cd db-4.8.30.NC/build_unix


../dist/configure --enable-mingw --enable-cxx --disable-shared --disable-replication


make

===== download boost 1_55_0

from a msdos box with admin privliges --- you will put it together ---

http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.7z/download

cd C:\deps\boost_1_55_0\

bootstrap.bat mingw

b2 --build-type=complete --with-chrono --with-filesystem --with-program_options --with-system --with-thread toolset=gcc variant=release link=static threading=multi runtime-link=static stage

-----miniupnpc-1.9.20150206-----------

you build this also from dos box but unpack from msys command box

one little trick is necessary here ---- download it here http://miniupnp.free.fr/files/download.php?file=miniupnpc-1.9.20150206.tar.gz

from msys prompt

tar xvfz miniupnpc-1.9.20150206.tar.gz

change the folder in deps miniupnpc-1.9.20150206 to be named miniupnpc

now from a dos prompt

cd C:\deps\miniupnpc

mingw32-make -f Makefile.mingw init upnpc-static

*********note the trick is to copy everything inside this folder and make a new folder inside the folder cd C:\deps\miniupnpc called miniupnpc and copy everything from the  C:\deps\miniupnpc to C:\deps\miniupnpc\miniupnpc

------------

next libpng and qrencode http://download.sourceforge.net/libpng/libpng-1.6.16.tar.gzand http://fukuchi.org/works/qrencode/qrencode-3.4.4.tar.gz 

now from a msys command prompt

cd /c/deps/libpng-1.6.16

configure --disable-shared

make

cp .libs/libpng16.a .libs/libpng.a

cd /c/deps/qrencode-3.4.4

LIBS="../libpng-1.6.16/.libs/libpng.a ../../mingw32/i686-w64-mingw32/lib/libz.a" \

png_CFLAGS="-I../libpng-1.6.16" \

png_LIBS="-L../libpng-1.6.16/.libs" \

configure --enable-static --disable-shared --without-tools

make

))))))

qt open source everywhere 4.8.6  http://download.qt-project.org/official_releases/qt/4.8/4.8.6/qt-everywhere-opensource-src-4.8.6.zip

use 7z to put the contents of this zip file to a folder called c:\qt\4.8.6

cd C:\Qt\4.8.6

configure -release -opensource -confirm-license -static -no-sql-sqlite -no-qt3support -no-opengl -qt-zlib -no-gif -qt-libpng -qt-libmng -no-libtiff -qt-libjpeg -no-dsp -no-vcproj -no-openssl -no-dbus -no-phonon -no-phonon-backend -no-multimedia -no-audio-backend -no-webkit -no-script -no-scripttools -no-declarative -no-declarative-debug -qt-style-windows -qt-style-windowsxp -qt-style-windowsvista -no-style-plastique -no-style-cleanlooks -no-style-motif -no-style-cde -nomake demos -nomake examples

mingw32-make

-----------------go for a coffee this takes a while to build and even longer on a virtual machine ---------------

get the source code of Photon from github at this point of the tree  

https://github.com/photonproject/photon/tree/2f10beca59449cec3a4592a92e90e088f314abac

unpack it and place it in a folder called photon on your root drive

in the photon-qt.pro file

edit it with any basic text editing file as follows

'uncomment' (delete the # sign at the start of the line)  

line 35-47 78, 80,81 and 83

comment out line 145

NOW

TO BUILD THE WALLET -- restart your virtual machine after you did all of the above ------

from a win command prompt


cd C:\photon\

set PATH=%PATH%;C:\Qt\4.8.6\bin

qmake "USE_QRCODE=1" "USE_UPNP=1" "USE_IPV6=1" photon-qt.pro

mingw32-make -f Makefile.Release

the wallet will be in the release folder of photon and ready to use

happy new year // cc