while IFS= read -r line; do
    ./image-finder.sh "$line"
done < script-keywords.txt

# Navigate to the img/ directory
cd img/

# Find and delete images not divisible by 2
find . -type f -exec bash -c 'if [ $(identify -format "%h" "{}")%2 -ne 0 ]; then rm "{}"; fi' \;


# Find files with 0 size
find . -type f -size 0 -delete

# Return to the original directory (optional)
cd ..
