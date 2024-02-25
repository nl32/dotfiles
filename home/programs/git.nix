{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Ethan Bickel";
    userEmail = "notethanbickel@gmail.com";
    extraConfig = {
      commit = {
        gpgsign = true;
      };
      user = {
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGsnhFqJ3bAaR/GUZ+t0pd+ITVCo6qNc5JwJGia+DvQI";
      };
      gpg = {
        format = "ssh";
        ssh.program = "${pkgs._1password-gui}/bin/op-ssh-sign";
      };
    };
  };
}
