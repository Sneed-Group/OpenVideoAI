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

cd img
# Resize images in img folder to 4k.
magick * -resize "3840x2160" *
cd ..
