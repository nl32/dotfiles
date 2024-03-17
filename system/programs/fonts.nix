{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      material-symbols
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      roboto
      (google-fonts.override {fonts = ["Inter"];})

      jetbrains-mono

      (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
    ];
    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = ["Noto Serif" "Noto Color Emoji"];
      sansSerif = ["Inter" "Noto Color Emoji"];
      monospace = ["JetBrains Mono" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
