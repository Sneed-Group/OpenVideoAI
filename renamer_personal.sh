#!/bin/zsh

# Directory path (replace with your actual directory)
directory="/home/sbaka/yt-drive"


cd $directory
# Check if there are any .mp4 files in the directory
if [[ ! *.mp4 ]]; then
  echo "No .mp4 files found in $directory"
  exit 0
fi

# Loop through .mp4 files with parameter expansion
for file in *.mp4; do
  # Get base filename and remove extension in one step
  base_filename=${file%.*}

  # Limit base filename to 17 characters (use parameter expansion)
  trimmed_filename=${base_filename[1,47]}

  # Create new filename
  new_filename="${trimmed_filename}.mp4"

  # Rename the file (optional, uncomment to rename files)
  mv "$file" "$directory/$new_filename"

  # Print the new filename (optional)
  echo "$new_filename"
done
