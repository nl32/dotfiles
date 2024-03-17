{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      inter
      jetbrains-mono
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];
  };
}
