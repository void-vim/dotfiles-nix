{...}: let
in {
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      color.ui = "auto";
      push = {
        default = "current";
      };
      merge = {
        conflictstyle = "diff3";
        stat = "true";
      };
    };
    ignores = [
      "*~"
      "*.swp"
      "*.cache"
      "*result*"
      "**dist"
      "*output*"
      "**.cache"
      ".cache"
      "dist"
      ".direnv"
      ".env"
      ".venv"
      ".next"
      "__pycache__"
      "node_modules"
    ];
  };
}
