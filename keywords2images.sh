while IFS= read -r line; do
    ./image-finder.sh "$line"
done < script-keywords.txt

# Navigate to the img/ directory
cd img/

# Find files with 0 size
find . -type f -size 0 -delete

# Return to the original directory
cd ..

# Add our images to the concat file.
ls -1v img/* | while IFS= read -r file; do
  echo "file '$(echo "$file" | sed "s/'/\\\'/g")'"
done > concat.txt
sed -i '/\\/d' concat.txt 

# Resize images in img folder to multiple of 2.

for image in img/*; do
    # Use identify to get the width and height of the image
    width=$(identify -format "%w" "$image")
    height=$(identify -format "%h" "$image")

    # Calculate the nearest multiple of 2 for width and height
    new_width=$((width + (2 - (width % 2)) % 2))
    new_height=$((height + (2 - (height % 2)) % 2))

    # Resize the image to the nearest multiple of 2
    convert "$image" -resize "${new_width}x${new_height}" "$image"

    echo "Resized $image to ${new_width}x${new_height}"
done