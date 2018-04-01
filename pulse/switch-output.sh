#!/bin/bash

if [ $1 == "--hdmi" ]; then
    pactl set-card-profile 0 output:hdmi-stereo+input:analog-stereo
else
    pactl set-card-profile 0 output:analog-stereo+input:analog-stereo

fi

