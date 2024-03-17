{pkgs, ...}: {
  home.packages = with pkgs; [
    kitty
    curl
    gnumake
    ripgrep
    gnugrep
    wget
    tree
    neofetch
    obsidian
    libgcc
  ];
  imports = [
    ../../programs/neovim
    ../../programs/zsh.nix
    ../../programs/git.nix
    ../../programs/gh.nix
    ../../programs/ssh.nix
    ../../programs/browsers/firefox.nix
    ../../programs/wayland
    ../../programs
    ../../services/system/polkit-agent.nix
  ];
}
