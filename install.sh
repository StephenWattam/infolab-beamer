#!/bin/bash

# "settings"
VERSION=1.0
DISTNAME=infolab21beamer-$VER


echo Install script for infolab21 theme for LaTeX beamer v$VERSION
echo


# Check we have stuff to work on
if [ $# != 1 ];
then
    echo "*** Please provide the path of the latex-beamer theme directory, ie:";
    echo "    sudo ./install.sh /usr/lib/beamer/themes";
    exit 1
fi

TARGETDIR=$1

# If folder doesn't exist then don't even bother trying
if [ ! -d "color" ]; then
    echo Missing the colour theme!
    exit 1
fi
if [ ! -d "theme" ]; then
    echo Missing the theme itself!
    exit 1
fi
if [ ! -d "outer" ]; then
    echo Missing the outer theme!
    exit 1
fi
if [ ! -d "images" ]; then
    echo Missing the images!
    exit 1
fi

# Summarise and allow for quitting for the paranoid
echo About to copy stuff to $TARGETDIR
echo 
echo ^C now or enter to continue.
read

# Copy stuff
echo "copying."
cp -v color/*.sty $TARGETDIR/color
cp -v outer/*.sty $TARGETDIR/outer
cp -v theme/*.sty $TARGETDIR/theme
mkdir -p /usr/share/infolab21beamer/images/
cp -v images/*.png /usr/share/infolab21beamer/images/

echo Building tex hash
texhash

echo "Done.  Have a nice day."
