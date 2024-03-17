{
  config,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "dbus-update-activation-environment --systemd WALAND_DISPLAY XDG_CURRENT_DESKTOP"
        "hyprctl setcursor ${config.home.pointerCursor.name} ${toString config.home.pointerCursor.size}"
      ];
      input = {
        kb_options = "caps:escape";
      };
    };
  };
}
