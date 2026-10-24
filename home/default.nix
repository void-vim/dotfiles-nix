{pkgs, ...}: let
  package = import ./package.nix {inherit pkgs;};
  setting = import ./settings.nix;
in {
  imports = [
    ./sway
    ./terminal
    ./browser
    ./rofi
    ./theme.nix
  ];

  home.username = setting.user.username;
  home.homeDirectory = setting.homeDir;
  home.packages = package;
  # home.sessionVariables = {
  #   # [INFO] Keep dart and flutter sharing one pub cache
  #   PUB_CACHE = "${setting.homeDir}/.pub-cache";
  # };
  dconf.enable = true;

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
