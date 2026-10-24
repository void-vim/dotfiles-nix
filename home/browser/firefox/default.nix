{...}: {
  imports = [
    ./tridactyl.nix
    ./styling.nix
  ];
  programs.firefox = {
    enable = true;
    languagePacks = ["en-US"];

    # preferences = {
    #   "browser.startup.homepage" = "../blank-page.html";
    #   "browser.search.region" = "US";
    #   "browser.uidensity" = "1";
    #   "sidebar.verticalTabs" = true;
    #   "sidebar.main.tools" = "bookmarks";
    # };

    policies = {
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;
      DisableBuiltinPDFViewer = true;
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxScreenshots = true;
      DisableForgetButton = true;
      DisableMasterPasswordCreation = true;
      DisableProfileImport = true;
      DisableProfileRefresh = true;
      DisableSetDesktopBackground = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFormHistory = true;
      DisablePasswordReveal = true;
      BlockAboutConfig = false;
      BlockAboutProfiles = true;
      BlockAboutSupport = true;
      DisplayMenuBar = "never";
      DontCheckDefaultBrowser = true;
      HardwareAcceleration = false;
      OfferToSaveLogins = false;

      # Force install uBlock, NoScript, and Tridactyl
      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        "*".installation_mode = "blocked";

        "uBlock0@raymondhill.net" = {
          install_url = moz "ublock-origin";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        "{73a6fe31-595d-460b-a920-fcc0f8843232}" = {
          install_url = moz "noscript";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        "tridactyl.vim@cmcaine.co.uk" = {
          install_url = moz "tridactyl-vim";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
      };
    };
  };
}
