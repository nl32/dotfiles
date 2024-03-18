{pkgs, ...}: {
  imports = [./gtk.nix ./browsers/firefox.nix ./anyrun ./transient-services.nix];
}
