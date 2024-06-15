TITLE=$(ollama run "sparksammy/samantha-v3-uncensored" "create exactly 1 topic for a nerdy tech youtube video")
./scripter.sh "$TITLE"
./keywords2images.sh
espeak -f script.txt -w voice.wav
./renderer_personal.sh "$TITLE"
