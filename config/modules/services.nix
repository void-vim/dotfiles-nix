{pkgs, ...}: {
  services.flatpak.enable = true;
  services.ollama.enable = true;
  services.cron.enable = true;
  services.libinput.enable = true;
  services.printing.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "no";
    };
  };
  services.dbus.packages = with pkgs; [
    dconf
    gcr
  ];
  services.blueman.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = 50;
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };
  services.searx = {
    enable = true;
    package = pkgs.searxng;

    settings = {
      server = {
        port = 8080;
        bind_address = "127.0.0.1";
        # Set to true to allow raw curl queries to return JSON
        secret_key = "generate_a_random_string_here";
      };

      search = {
        safe_search = 0;
        autocomplete = "";
        formats = ["html" "json"];
      };

      engines = [
        {
          name = "duckduckgo";
          engine = "duckduckgo";
          disabled = false;
        }
        {
          name = "google";
          engine = "google";
          disabled = false;
        }
        {
          name = "brave";
          engine = "brave";
          disabled = false;
        }
        {
          name = "bing";
          engine = "bing";
          disabled = false;
        }
      ];
    };
  };
}
