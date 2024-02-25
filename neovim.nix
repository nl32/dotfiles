{pkgs, ...}: let
  treesitterWithGrammars = (
    pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
      p.bash
      p.c
      p.diff
      p.html
      p.javascript
      p.jsdoc
      p.json
      p.jsonc
      p.luadoc
      p.luap
      p.markdown
      p.comment
      p.css
      p.typescript
      p.tsx
      p.astro
      p.lua
      p.make
      p.python
      p.rust
      p.toml
      p.yaml
    ])
  );
in {
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
    source = ./assets/nvim;
    recursive = true;
  };
}
