{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.hyprlock = {
    enable = true;
    general = {
      disable_loading_bar = true;
      hide_cursor = false;
    };
  };
}
