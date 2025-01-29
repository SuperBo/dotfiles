#!/bin/bash

BAR_COLOR=0x00ffffff

lock() {
  sketchybar --bar y_offset=-32 \
                   margin=-200 \
                   notch_width=0 \
                   blur_radius=0 \
                   color=0x000000
}

unlock() {
  sketchybar --animate sin 25 \
             --bar y_offset=5 \
                   notch_width=200 \
                   margin=8 \
                   corner_radius=20 \
                   corner_radius=20 \
                   corner_radius=20 \
                   corner_radius=8 \
                   color=0x00000000 \
                   color=0x00000000 \
                   color=$BAR_COLOR \
                   blur_radius=0 \
                   blur_radius=0 \
                   blur_radius=0 \
                   blur_radius=30
}

case "$SENDER" in
  "lock") lock
  ;;
  "unlock") unlock
  ;;
esac
