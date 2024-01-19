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

# Resize images in img folder to 4k.
for image in img/*; do
    # Resize the image to 4k.
    convert "$image" -resize "3840x2160" "$image"
    echo "Resized $image to 3840x2160"
done
