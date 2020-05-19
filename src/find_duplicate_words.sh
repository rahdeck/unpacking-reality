#!/bin/zsh

echo "Findind single repeated consecutive words" >&2
egrep --color=always -oz "\b([^\b]+)\b[ ]*\b(\1)\b" $*

echo
echo "Findind double repeated consecutive words" >&2
egrep --color=always -oz "\b([^\b]+)\b +\b([^\b]+)\b +\b(\1)\b +\b(\2)\b" $*
#egrep --color=always -o "\b(.+)\b \b(\1)\b" $*
