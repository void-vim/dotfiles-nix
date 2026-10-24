{...}: {
  programs.firefox.profiles.default = {
    search = {
      force = true;
      default = "DuckDuckGo";
      privateDefault = "DuckDuckGo";
    };
    settings = {
      # Required for Firefox to load custom CSS
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    };

    # Pulls in the separate userChrome.css file from the same directory
    userChrome = builtins.readFile ./user-chrome.css;
  };
}
