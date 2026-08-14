{ pkgs, ... }:

{
  # 1. Install uv system-wide
  environment.systemPackages = [
    pkgs.uv
  ];
  systemd.tmpfiles.rules = [
    "L+ /usr/include - - - - ${pkgs.glibc.dev}/include"
  ];
  # 2. Enable nix-ld to bridge the gap for unpatched pre-compiled binaries
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # Standard fundamental requirements for common pip wheels
      stdenv.cc.cc.lib
      glibc
      glibc.dev
      zlib
      openssl
      libffi
      stdenv.cc.cc 
      rocmPackages.clr
      rocmPackages.hipblas
      rocmPackages.rocblas
      # Additional libraries helpful for ML/Data-Science utilities
      gcc-unwrapped.lib
    ];
  };
}
