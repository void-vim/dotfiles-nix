{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    #  Global bash script
    (writeShellScriptBin "nix-clean" (builtins.readFile ../../home/script/cleanup.sh))
    (writeShellScriptBin "nix-clean-node" (builtins.readFile ../../home/script/cleanup-node.sh))
    (writeShellScriptBin "powermenu" (builtins.readFile ../../home/script/powermenu.sh))
    (writeShellScriptBin "volume" (builtins.readFile ../../home/script/volume.sh))
    (writeShellScriptBin "brightness" (builtins.readFile ../../home/script/brightness.sh))
    (writeShellScriptBin "screenshots" (builtins.readFile ../../home/script/screenshots.sh))
    (writeShellScriptBin "workspace" (builtins.readFile ../../home/script/workspace.sh))

    # CLI Utilities
    cron
    ripgrep
    nh
    wget
    fastfetch
    htop
    htop-vim
    btop
    openconnect
    dconf
    libnotify
    brightnessctl
    wl-clipboard
    grim
    slurp
    zip
    unzip
    p7zip
    gzip
    bzip2
    file
    pm2
    wlroots # Wayland support
    wf-recorder # Opsional, alternatif record for Wayland
    gst_all_1.gstreamer # OBS feature
    v4l-utils # virtual camera support
    bluetui
    jq
    yt-dlp

    # Audio Management
    pavucontrol # gui
    pamixer # cli

    # Development Tools
    neovim
    python3
    nodejs_22
    pnpm
    bun
    typescript
    typescript-language-server
    lua-language-server
    astro-language-server
    vue-language-server
    # flutter
    # dart
    # docker-compose
    nixd # nix lang server
    alejandra # nix formatter
    inputs.zig.packages.${pkgs.stdenv.hostPlatform.system}.master
    inputs.zls.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
