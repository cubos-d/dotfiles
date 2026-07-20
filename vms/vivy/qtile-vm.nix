# qtile-vm.nix
{ config, pkgs, lib, modulesPath, ... }: {
  imports = [
    # Built-in profiles optimized for automated QEMU guest environments
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  # Basic network and user setup
  networking.hostName = "vivy";
  
  users.users.cubos = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" ]; # wheel enables sudo
    initialPassword = "anime"; # Set an initial password for testing
  };

  # Enable the X11 server and the Qtile window manager
  services.xserver = {
    enable = true;
    # "modesetting" is perfect here; inside the guest, it hooks right into VirGL
    videoDrivers = [ "modesetting" ];
    windowManager.qtile.enable = true;
  };
  services.displayManager.ly.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;

  environment.sessionVariables = {
    DRI_PRIME = 1;
  };
  # Define VM-specific hardware overrides using vmVariant
  virtualisation.vmVariant = {
    virtualisation.memorySize = 6144; # 6GB RAM
    virtualisation.cores = 6;        # 6 CPU Cores

    virtualisation.diskImage = "/home/cubos/VMS/Images/vivy.qcow2";
    virtualisation.diskSize = 50000; # IN MB

    virtualisation.qemu.drives = []; # Optional helper placeholder
    
    # Apply our corrected rendering and device stack configuration
    virtualisation.qemu.options = [
      "-vga" "none"
      "-device" "virtio-vga-gl,xres=1920,yres=1080"
      "-spice" "unix=on,addr=/tmp/vm_spice.socket,gl=on,disable-ticketing=on"
      "-device" "virtio-serial-pci"
      "-device" "virtio-balloon-pci"
      "-device" "ich9-intel-hda"
      "-device" "hda-output"
    ];
  };

  system.stateVersion = "26.05";
}
