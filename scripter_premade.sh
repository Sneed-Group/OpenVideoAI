cat "$1" > script.txt
awk '{ print $2 }' script.txt > script-keywords.txt
awk '{ print $4 }' script.txt >> script-keywords.txt
awk '{ print $6 }' script.txt >> script-keywords.txt

mkdir img
rm img/*
