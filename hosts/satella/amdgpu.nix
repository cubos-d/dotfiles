{ config, pkgs, ... }:

{
  # 1. Enable standard OpenCL/HIP hardware injection layers
  hardware.amdgpu.opencl.enable = true;

  # 2. Fix hardcoded library search paths for external compute tools
  systemd.tmpfiles.rules = [
    "L+ /opt/rocm/hip - - - - ${pkgs.rocmPackages.clr}"
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
}
