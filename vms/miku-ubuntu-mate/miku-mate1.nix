{ pkgs, ... }:

let
  isoPath = "/home/cubos/VMS/ISOS/ubuntu-mate-24.04.4-desktop-amd64.iso";
  diskPath = "/home/cubos/VMS/Images/ubuntu-mate.qcow2";
in
{
  home.packages = [
    (pkgs.writeShellScriptBin "run-miku-ubuntu-mate" ''
      DRI_PRIME=1 qemu-system-x86_64 \
        -name "AnimeVM" \
        -enable-kvm \
        -cpu host \
        -smp cores=6,threads=1,sockets=1 \
        -m 6144 \
        -drive file=${diskPath},format=qcow2,if=virtio \
        -cdrom ${isoPath} \
        -boot c \
        -net nic,model=virtio \
        -net user \
        -vga none \
        -device virtio-vga-gl,xres=1920,yres=1080 \
        -spice unix=on,addr=/tmp/spice.sock,gl=on,disable-ticketing=on \
        -device virtio-serial-pci \
        -device virtio-balloon-pci \
        -device ich9-intel-hda \
        -device hda-output \
        -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
        -chardev spicevmc,id=spicechannel0,name=vdagent &

      sleep 3
      DRI_PRIME=1 remote-viewer spice+unix:///tmp/spice.sock
    '')
  ];
}

