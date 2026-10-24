{...}: {
  programs.firefox.profiles.default = {
    search = {
      force = true;
      default = "DuckDuckGo";
      privateDefault = "DuckDuckGo";
      order = ["DuckDuckGo"];
      engines = {
        "DuckDuckGo" = {
          urls = [
            {
              template = "https://duckduckgo.com/?q={searchTerms}";
            }
          ];
          icon = "https://duckduckgo.com/favicon.ico";
          definedAliases = ["@ddg"];
        };
      };
    };
    settings = {
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "browser.startup.homepage" = "chrome://browser/content/blanktab.html";
      "browser.search.region" = "US";
      "browser.uidensity" = "1";
      "doh-rollout.home-region" = "US";
      "sidebar.verticalTabs" = true;
      "sidebar.main.tools" = "bookmarks";
    };

    userChrome = builtins.readFile ./user-chrome.css;
  };
}
