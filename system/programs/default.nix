{
  imports = [./fonts.nix ./home-manager.nix ./xdg.nix];
  programs = {
    dconf.enable = true;
    kdeconnect.enable = true;
  };
}
