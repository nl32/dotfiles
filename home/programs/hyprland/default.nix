{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.enable = true;
  home.packages = with pkgs; [
    wl-clip-persist
    wl-clipboard
    cliphist
  ];
}
