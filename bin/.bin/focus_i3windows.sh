#!/usr/bin/env bash

i3windows.py | fzf --with-nth 2 -d'\|' | sed 's/|.*//ig' | xargs -I{} i3-msg '[con_id="{}"]' focus
