# Remove node_modules/, .next/, and dist/ from all subdirectories
find . -mindepth 1 -maxdepth 1 -type d | while read -r dir; do
    [ -d "$dir/node_modules" ] && rm -rf "$dir/node_modules" && echo "Removed node_modules from $dir"
    [ -d "$dir/.next" ] && rm -rf "$dir/.next" && echo "Removed .next from $dir"
    [ -d "$dir/dist" ] && rm -rf "$dir/dist" && echo "Removed dist from $dir"
done
