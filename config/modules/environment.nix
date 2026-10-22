{pkgs, ...}: {
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
}
