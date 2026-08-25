let
  settings = import ../settings.nix;
in {
  services.mako = {
    enable = true;

    settings = {
      background-color = settings.color.background;
      text-color = settings.color.foreground;
      border-color = settings.color.primary;
      progress-color = settings.color.primary;
      border-size = 2;
      default-timeout = 5000;
      font = "JetBrainsMono Nerd Font 10";
      width = 350;
      height = 120;
      margin = 10;
      padding = 15;
      anchor = "top-center";
      layer = "overlay";

      # Optional extras
      icons = true;
      markup = true;
      group-by = "app-name";
    };
  };
}
