{pkgs, ...}: {
  services = {
    dbus.implementation = "broker";
    psd = {
      enable = true;
      resysncTimer = "10m";
    };
  };
}
