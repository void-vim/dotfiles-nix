{inputs, ...}: let
in {
  imports = [
    ./host.nix
  ];
  security.acme = {
    acceptTerms = true;
  };
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
  };
  networking.firewall.allowedTCPPorts = [80 443];
}
