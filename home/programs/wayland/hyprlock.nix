{config, ...}: let
  font_family = "Inter";
in {
  programs.hyprlock = {
    enable = true;
    general = {
      disable_loading_bar = true;
      hide_cursor = false;
      no_fade_in = true;
    };
    input-fields = [
      {
        monitor = "DP-2";
        size = {
          width = 300;
          height = 50;
        };
        outline_thickness = 2;
        fade_on_empty = false;
        placeholder_text = ''<span font_family="${font_family}">Password...</span>'';

        dots_spacing = 0.3;
        dots_center = true;
      }
    ];
    labels = [
      {
        monitor = "";
        text = "$TIME";
        inherit font_family;
        font_size = 50;
        position = {
          x = 0;
          y = 80;
        };
        valign = "center";
        halign = "center";
      }
    ];
  };
}
