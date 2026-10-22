echo "[INFO] Removing old user generations..."
nix-env --delete-generations old

echo "[INFO] Removing old system generations (older than 14 days)..."
sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +14d

echo "[INFO] Running Nix Garbage Collector..."
sudo nix-collect-garbage -d

echo "[INFO] Optimizing the Nix Store (this links duplicate files)..."
sudo nix-store --optimize

echo "[INFO] Current Disk Usage of /nix:"
df -h /nix
