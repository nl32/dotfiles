{
  config,
  pkgs,
  ...
}: {
  imports = [./binds.nix];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
  };
  home.packages = with pkgs; [
    wl-clip-persist
    wl-clipboard
    cliphist
  ];
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };
  gtk = {
    enable = true;
  };
}
