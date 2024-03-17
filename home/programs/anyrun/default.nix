{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [inputs.anyrun.homeManagerModules.default];
  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        application
        randr
        rink
        shell
        symbols
      ];
    };
  };
}
