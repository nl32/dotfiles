{pkgs, ...}: {
  services = {
    dbus.implementation = "broker";
  };
  psd = {
    enable = true;
    resysncTImer = "10m";
  };
}
