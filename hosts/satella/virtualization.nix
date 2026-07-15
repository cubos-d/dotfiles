{ config, lib, pkgs, inputs, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        # You can uncomment this safely now
        swtpm.enable = true; 
      };
    };
    spiceUSBRedirection.enable = true;
  };
  
  services.spice-vdagentd.enable = true;
  programs.virt-manager.enable = true;

  # ---> ADD THIS BLOCK TO FIX THE TPM ASSERTION CRASH <---
  systemd.services.virt-secret-init-encryption = {
    environment = {
      SYSTEMD_CREDENTIAL_TPM2 = "0";
    };
  };

  environment.systemPackages = with pkgs; [
    virt-manager
    qemu
    guestfs-tools
    virtiofsd
    virt-viewer
    spice spice-gtk
    spice-protocol
    virtio-win
    win-spice
    adwaita-icon-theme
  ];
}