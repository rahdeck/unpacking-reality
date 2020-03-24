#!/bin/zsh

grep --color=always -Pz "\b(.+)\b[ ]*\b($1)\b" $*
#egrep --color=always -o "\b(.+)\b \b(\1)\b" $*
