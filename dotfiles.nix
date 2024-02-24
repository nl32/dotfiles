{
  home.file = {
    ".config/nix/nix.conf".source = "./assets/nix/nix.conf";
    ".config/nvim" = {
      source = "./assets/nvim";
      recursive = true;
      };
  };
}
