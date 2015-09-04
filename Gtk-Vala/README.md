# Colors for Linux
This app has been created using GTK and Vala.

## Compiling
If you only want to try it, you can just compile it and run it:

```shell
valac --pkg gtk+-3.0 Colors.vala palette.vala colorsPalette.vala
./Colors
```

## Build and Install

To build and install, type:

```shell
./autogen.sh --prefix=/home/your_username/.local
make
make install
```
-------------
Running the first line above creates the following files:

aclocal.m4

autom4te.cache

config.log

config.status

configure

depcomp

Colors

Colors.c

Colors.desktop

Colors-Colors.o

Colors_vala.stamp

install-sh

missing

Makefile.in

Makefile

Running "make" links all the appropriate libraries.

Running "make install", installs the application in /home/your_username/.local/bin and installs the hello-world.desktop file in /home/your_username/.local/share/applications

You can now run the application by typing "Hello World" in the Overview.

----------------
## Uninstalling
To uninstall, type:

```shell
make uninstall
```
----------------

## Tarball
To create a tarball type:

```shell
make distcheck
```
This will create Colors-1.0.tar.xz