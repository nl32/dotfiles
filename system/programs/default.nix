{
  imports = [./fonts.nix ./home-manger.nix ./xdg.nix];
  programs = {
    dconf.enable = true;
    kdeconnect.enable = true;
  };
}
