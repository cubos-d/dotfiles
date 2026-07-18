{ config, pkgs, ... }:

{
  # 1. Enable KVM kernel modules
  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];
  boot.binfmt.emulatedSystems = [
    "aarch64-linux"
    "riscv64-linux"
  ];
  systemd.tmpfiles.rules = [ "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware" ];
  # 4. Install virt-manager (GUI) and other QEMU tools
  environment.systemPackages = with pkgs; [
    qemu
    spice-gtk
    virt-viewer
  ];
}
