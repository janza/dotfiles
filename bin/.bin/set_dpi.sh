#!/bin/bash

passed_dpi=$1
xft_dpi=${passed_dpi:-$DPI}

XFT_SETTINGS="
Xft.dpi:        ${xft_dpi:-96}
Xft.antialias:  1
Xft.autohint:   0
Xft.hinting:    1
Xft.hintstyle:  hintfull
Xft.lcdfilter:  lcddefault
Xft.rgba:       rgb
"

echo "$XFT_SETTINGS" | xrdb -merge > /dev/null 2>&1

# vim:ft=sh:
