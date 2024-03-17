{
  imports = [
    ./core/boot.nix
    ./core/default.nix
    ./services
    ./services/greetd.nix
    ./services/pipewire.nix
    ./network
  ];
}
