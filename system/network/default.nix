{lib, ...}: {
  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
  };
  services = {
    openssh = {
      enable = true;
    };
    resolved.enable = true;
  };
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
}
