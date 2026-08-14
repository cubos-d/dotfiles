{ ... }:

{
  boot.loader.systemd-boot.enable = false;
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      extraConfig = ''
        set keymap=la
      '';
      configurationLimit = 15;
    };
  };
}