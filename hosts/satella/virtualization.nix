{ config, lib, pkgs, inputs, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
        swtpm.enable = true;
      }
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
  users.groups.libvirtd.members = ["cubos"];
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [
    qemu
    guestfs-tools
    virtiofsd
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
    adwaita-icon-theme
  ];

  systemd.tmpfiles.rules = [ "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware" ];

  boot.binfmt.emulatedSystems = [
    "aarch64-linux"
    "riscv64-linux"
  ];

}