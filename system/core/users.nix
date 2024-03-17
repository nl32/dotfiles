{pkgs, ...}: {
  users.users.ebickel = {
    isNormalUser = true;
    description = "Ethan Bickel";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };
}
