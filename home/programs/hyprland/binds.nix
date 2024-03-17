{
  config,
  lib,
  ...
}: let
  mod = "SUPER";
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "${mod}, Q, exec, kitty"
      "${mod}, C, killactive"
    ];
  };
}
