let
  workspaces = builtins.concatLists (builtins.genList (
      x: let
        ws = let
          c = (x + 1) / 10;
        in
          builtins.toString (x + 1 - (c * 10));
      in [
        "$mod, ${ws}, workspace, ${toString (x + 1)}"
        "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}}"
      ]
    )
    10);
in {
  wayland.windowManager.hyprland.settings = {
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
    bind = [
      "$mod SHIFT, E, exec, pkill Hyprland"
      "$mod, Return, exec,kitty"
      "$mod, Q, killactive"

      # move focus
      "$mod, h, movefocus, l"
      "$mod, j, movefocus, d"
      "$mod, k, movefocus, u"
      "$mod, l, movefocus, r"
    ];
    bindr = [
      "$mod, space, exec, pkill .anyrun-wrapped || run-as-service anyrun"
    ];
  };
}
