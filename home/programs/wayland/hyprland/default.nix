{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hyprland.homeMangerModules.default
    ./binds.nix
    ./rules.nix
    ./settings.nix
  ];
  home.packages = [
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];
  wayland.windowManger.hyprland = {
    enable = true;
  };
  systemd = {
    variables = ["--all"];
    extraCommands = [
      "systemctl --user stop graphical-session.target"
      "systemctl --user start hyprland-session.target"
    ];
  };
}
