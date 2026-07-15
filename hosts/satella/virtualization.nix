{ config, pkgs, ... }:

{
  # 1. Enable KVM kernel modules
  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];

  # 2. Add your user to the necessary groups (replace "YOUR_USERNAME")
  users.users.cubos.extraGroups = [ "libvirtd" "kvm" ];

  # 3. Enable virtualization services
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      swtpm.enable = true;
    };
  };

  # 4. Install virt-manager (GUI) and other QEMU tools
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    qemu
  ];
}
