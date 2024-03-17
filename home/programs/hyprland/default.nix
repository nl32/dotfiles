{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, Q, exec, kitty"
        "$mod, C, killactive"
      ];
    };
  };
  home.packages = with pkgs; [
    wl-clip-persist
    wl-clipboard
    cliphist
  ];
}
