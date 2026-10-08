{ pkgs, ... }:

{
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    environmentVariables = {
      HSA_OVERRIDE_GFX_VERSION = "10.3.0";
    };
    loadModels = [
      "gemma4:latest"
      "huihui_ai/qwen3.5-abliterated:9b"
    ];
  };
}
