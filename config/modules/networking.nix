{
  networking = {
    hostName = "Nix";
    nameservers = ["127.0.0.1"];
    firewall = {
      enable = true;
      allowPing = false;
    };
    networkmanager = {
      enable = true;
      dns = "none";
    };
  };

  services.dnscrypt-proxy = {
    enable = true;
    settings = {
      require_dnssec = true;
      require_nolog = true;
      require_nofilter = false;
      server_names = ["cloudflare" "quad9-dnscrypt-ip4-filter-pri" "mullvad-adblock-doh"];
      cache = true;
    };
  };
}
