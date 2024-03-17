{
  imports = [
    ./core/boot.nix
    ./core/default.nix
    ./network

    ./programs

    ./services
    ./services/greetd.nix
    ./services/pipewire.nix
  ];
}
