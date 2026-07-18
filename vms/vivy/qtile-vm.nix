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
    
    # Enable lightdm as a simple display manager
    # displayManager.lightdm.enable = true;
    
    # Declare Qtile
    windowManager.qtile.enable = true;
  };

  # Audio support
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  # Define VM-specific hardware overrides using vmVariant
  virtualisation.vmVariant = {
    # Allocate system specs for smooth anime playback & UI snappiness
    virtualisation.memorySize = 6144; # 4GB RAM
    virtualisation.cores = 6;        # 4 CPU Cores
    
    # Enable VirtIO graphics with OpenGL acceleration
    virtualisation.qemu.options = [
      "-device virtio-vga-gl,xres=1920,yres=1080"
      "-display spice-app,gl=on"
    ];
  };

  system.stateVersion = "26.05";
}