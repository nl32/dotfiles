{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    ignorealpha = [
      "anyrun"
    ];
  };
}
