{
  config,
    pkgs,
    ...
}: let
shellExtras = {
  sessionVariables = {EDITOR = "nvim";};
};
in {
  programs = {
    zsh = {
      enable = true;
      oh-my-zsh.enable = true;
      shellAliases = {
        vim = "nvim";
      };
      inherit (shellExtras) sessionVariables;
    };
    fzf = {
      enable = true;
    };
    git = {
      enable = true;
    };
  };
}
