find . \( -name "node_modules" -o -name ".next" -o -name "dist" \) -type d -print -prune | while read -r dir; do
    rm -rf "$dir"
    echo "[INFO] Removed $dir"
done
