{...}: {
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  hardware.bluetooth.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Asia/Jakarta";
  system.stateVersion = "24.11";
}
