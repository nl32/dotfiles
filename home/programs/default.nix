{pkgs, ...}: {
  imports = [./gtk.nix ./browsers/firefox.nix ./anyrun];
}
