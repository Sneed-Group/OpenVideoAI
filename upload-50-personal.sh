#!/bin/bash

# Generate 50 videos
for ((i = 1; i <= 50; i++)); do
    # Replace 'make_video_personal.sh' with the name of your script and any arguments it may need
    ./make_video_personal.sh
done

#!/bin/bash

# Directory path (replace with your actual directory)
directory="~/yt-drive"

# Iterate over files in the directory
for file in "$directory"/*; do
    # Get the base filename
    filename=$(basename "$file")
    
    # Limit filename to 17 characters
    trimmed_filename="${filename:0:17}"

    # Add .mp4 extension
    new_filename="${trimmed_filename}.mp4"

    # Print the new filename (optional, you can remove this line if not needed)
    echo "$new_filename"
done
