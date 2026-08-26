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
      font = "JetBrainsMono Nerd Font 10";
      default-timeout = 5000;
      border-size = 0;
      width = 350;
      height = 120;
      margin = 0;
      padding = 10;
      anchor = "top-center";
      layer = "overlay";

      icons = true;
      markup = true;
      group-by = "app-name";
    };
  };
}
