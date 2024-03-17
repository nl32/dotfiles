{
  pkgs,
  config,
  ...
}: {
  boot = {
    bootspec.enable = true;
    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["ext4"];
    };
    kernelPackages = pkgs.linuxPackages_latest;

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  environment.systemPackages = [config.boot.kernelPackages.cpupower];
}
