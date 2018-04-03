#!/bin/bash

# Dependencies: imagemagick, i3lock-color-git, scrot

IMAGE=$(mktemp).png
TEXT="Type password to unlock"

# get path where the script is located
# its used for the lock icon
pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd`
popd > /dev/null
 
# l10n support
case $LANG in
    fr_* ) TEXT="Entrez votre mot de passe" ;; # Français
    es_* ) TEXT="Ingrese su contraseña" ;; # Española
esac

VALUE="60" #brightness value to compare to
scrot $IMAGE
COLOR=`convert $IMAGE -colorspace hsb -resize 1x1 txt:- | sed -E '/.*$/ {
                             N
                             s/.*\n.*([0-9]{1,2}[^\.])\.[0-9]+%\)$/\1/
                             }'`;

if [ "$COLOR" -gt "$VALUE" ]; then #white background image and black text
    convert $IMAGE -level 0%,100%,0.6 -filter Gaussian -resize 30.1% -define filter:sigma=2.5 -resize 333.333% -font Liberation-Sans -pointsize 26 -fill black -gravity center -annotate +0+160 "$TEXT" - | composite -gravity center $SCRIPTPATH/lockdark.png - $IMAGE
    i3lock --textcolor=00000000 --insidecolor=0000001c --ringcolor=0000003e --linecolor=00000000 --keyhlcolor=ffffff80 --ringvercolor=ffffff00 --insidevercolor=ffffff1c --ringwrongcolor=ffffff55 --insidewrongcolor=ffffff1c  -i $IMAGE
else #black
    convert $IMAGE -level 0%,100%,0.6 -filter Gaussian -resize 30.1% -define filter:sigma=2.5 -resize 333.333% -font Liberation-Sans -pointsize 26 -fill white -gravity center -annotate +0+160 "$TEXT" - | composite -gravity center $SCRIPTPATH/lock.png - $IMAGE
    i3lock --textcolor=ffffff00 --insidecolor=ffffff1c --ringcolor=ffffff3e --linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 --insidevercolor=0000001c --ringwrongcolor=00000055 --insidewrongcolor=0000001c  -i $IMAGE
fi

rm $IMAGE
