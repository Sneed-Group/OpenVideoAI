ollama run "sparksammy/samantha-v3-uncensored" "Write a video script about $1. Do NOT include title or description. Do not include scene transitions, either. Make yourself anonymous. Do not state your name. Also, do not ask for replies, and do not specify that you are an assistant. Also, and perhaps most importantly, DO NOT DESCRIBE ACTIONS IN THE VIDEO, JUST ACT AS A NARRATOR." > script.txt
awk '{ print $2 }' script.txt > script-keywords.txt
awk '{ print $4 }' script.txt >> script-keywords.txt
awk '{ print $6 }' script.txt >> script-keywords.txt

mkdir img
rm img/*
