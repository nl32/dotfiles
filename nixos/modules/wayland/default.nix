{pkgs, ...}: {
  imports = [./fonts.nix ./services.nix ./pipewire.nix];

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
