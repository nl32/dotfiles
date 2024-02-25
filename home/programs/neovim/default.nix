{pkgs, ...}: {
  home.packages = with pkgs; [
    ripgrep
    fd
    lua-language-server
    rust-analyzer-unwrapped
    fzf
    alejandra
  ];
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = [
      pkgs.vimPlugins.lazy-nvim
      pkgs.vimPlugins.telescope-fzf-native-nvim
    ];
  };
  home.file.".config/nvim/" = {
    source = ./nvim;
    recursive = true;
  };
}
