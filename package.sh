#!/bin/bash


# "settings."
VER=1.0
DISTNAME=infolab21beamer-$VER
DIRNAME=/tmp
DD=$DIRNAME/$DISTNAME

# Create a nice structure
echo Creating working directory at $DD
mkdir -p $DD/{color,outer,theme,images}
mkdir $DD

# Copy things into a nice structure
echo Packaging to $DD.
cp beamercolorthemeinfolab21.sty $DD/color
cp beamerouterthemeinfolab21.sty $DD/outer
cp beamerthemeInfolab21.sty $DD/theme
cp -rv images/*.png $DD/images
cp install.sh sample.tex INSTALL README TODO LICENCE $DD
make
cp sample.pdf $DD/readme.pdf
make clean

# Tar things up
echo Tar-ing into $DISTNAME.tar.gz
OLDDIR=`pwd`
cd $DIRNAME
tar -cvzf $DISTNAME.tar.gz $DISTNAME
cd $OLDDIR
mv $DIRNAME/$DISTNAME.tar.gz .

# Clean up
echo Removing dist folder.
rm -rf $DD

echo Done.
