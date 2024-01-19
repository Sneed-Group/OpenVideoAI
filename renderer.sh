# Specify the directory containing your images
image_directory="img/"

# Iterate over each image in the directory
for image in "$image_directory"/*; do
    # Use identify to get the width of the image
    width=$(identify -format "%w" "$image")

    # Check if the width is not divisible by 2
    if [ $((width % 2)) -ne 0 ]; then
        echo "Deleting $image (width: $width)"
        rm "$image"
    fi
done

total_frames=$(wc -l < concat.txt)  # Count the total number of frames in concat.txt
voice_length=$(ffprobe -i voice.wav -show_entries format=duration -v quiet -of csv="p=0")  # Get the length of voice.wav

# Calculate the correct duration of each frame
duration=$(echo "$voice_length / $total_frames" | bc)

fps=$(echo "scale=2; $total_frames / $voice_length" | bc)

# Use the corrected duration in the FFmpeg command
ffmpeg -r $fps -f concat -safe 0 -i concat.txt -i voice.wav -c:v libx264 -c:a aac -vf "setpts=PTS/1" -pix_fmt yuv420p -shortest output_video.mp4

