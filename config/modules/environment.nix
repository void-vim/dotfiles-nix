{
  pkgs,
  inputs,
  ...
}: {
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
    config = {
      common = {
        default = ["gtk"];
      };
      sway = {
        "org.freedesktop.impl.portal.ScreenCast" = ["wlr"];
        "org.freedesktop.impl.portal.Screenshot" = ["wlr"];
      };
    };
  };

  environment.variables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    XKB_DEFAULT_LAYOUT = "us";
    XKB_DEFAULT_VARIANT = "";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "sway";
    XDG_SESSION_DESKTOP = "sway";
    # DISCORD_USE_WAYLAND = "0";
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
  environment.localBinInPath = true;
  environment.sessionVariables = {
    PATH = [
      "$HOME/.npm-global/bin"
      "$HOME/.foundry/bin"
    ];
  };

  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    #  Global bash script
    (writeScriptBin "nix-clean" (builtins.readFile ../../home/script/cleanup.sh))
    (writeScriptBin "nix-clean-node" (builtins.readFile ../../home/script/cleanup-node.sh))
    (writeScriptBin "powermenu" (builtins.readFile ../../home/script/powermenu.sh))
    (writeScriptBin "volume" (builtins.readFile ../../home/script/volume.sh))
    (writeScriptBin "brightness" (builtins.readFile ../../home/script/brightness.sh))
    (writeScriptBin "screenshots" (builtins.readFile ../../home/script/screenshots.sh))
    (writeScriptBin "workspace" (builtins.readFile ../../home/script/workspace.sh))

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
    # docker-compose
    nixd # nix lang server
    alejandra # nix formatter
    inputs.zig.packages.${pkgs.stdenv.hostPlatform.system}.master
    inputs.zls.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
