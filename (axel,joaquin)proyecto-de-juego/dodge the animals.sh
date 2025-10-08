#!/bin/sh
echo -ne '\033c\033]0;(AXEL,JOAQUIN)Proyecto de Juego\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/dodge the animals.x86_64" "$@"
