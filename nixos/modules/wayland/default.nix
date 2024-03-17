{pkgs, ...}: {
  imports = [./services.nix];
  environment.etc."greetd/environments".text = ''
    Hyprland
  '';

  environment = {
    loginShellInit = ''
      dbus-update-activation-environment --systemd DISPLAY
      eval $(gnome-keyring-daemon --start --components=ssh,secrets)
      eval $(ssh-agent)
    '';
  };

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
  sound = {
    enable = true;
  };
}
