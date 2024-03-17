{
  imports = [
    ./core/boot.nix
    ./core/default.nix
    ./network
    ./network/avahi.nix

    ./programs

    ./services
    ./services/greetd.nix
    ./services/pipewire.nix
  ];
}
