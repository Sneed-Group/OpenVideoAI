./scripter.sh "$1"
./keywords2images.sh
espeak -f script.txt -w voice.wav
./renderer.sh "$1"
