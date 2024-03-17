{config, ...}: let
  pointer = config.home.pointerCursor;
in {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    env = ["QT_WAYLAND_DISABLE_WINDOWDECORATION,1"];
    exec-once = [
      "hyprctl setcursor ${pointer.name} ${toString pointer.size}"
      "hyprlock"
    ];
    input = {
      kb_options = "caps:escape";
    };
  };
}
