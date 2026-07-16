{ config, pkgs, ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];
  # 1. Enable standard OpenCL/HIP hardware injection layers
  hardware.amdgpu.opencl.enable = true;
  # 2. Fix hardcoded library search paths for external compute tools
  systemd.tmpfiles.rules =
  let
    rocmEnv = pkgs.symlinkJoin {
      name = "rocm-combined";
      paths = with pkgs.rocmPackages; [
        rocblas
        hipblas
        clr
      ];
    };
  in
  [
    "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  ];
  # 3. Enable Ollama service with ROCm/AMD acceleration
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    environmentVariables = {
      HSA_OVERRIDE_GFX_VERSION = "10.3.0";
    };
  };
  services.lact.enable = true;
  hardware.graphics = {
    ## radv: an open-source Vulkan driver from freedesktop
    enable = true;
    enable32Bit = true;
  };

  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio; 
    plugins = with pkgs.obs-studio-plugins; [
      obs-vaapi          # For AMD AMF/VAAPI encoding
      obs-vkcapture      # For low-overhead Vulkan game capture
      obs-pipewire-audio-capture # Best for system audio
    ];
  };
}
