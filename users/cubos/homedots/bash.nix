{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    
    shellAliases = {
      ls = "eza --group-directories-first --icons -lhg";
      cp = "cp --verbose";
    };

    # Paste your large collection of custom prompts, exports, and scripts here
    bashrcExtra = ''
      # Custom exports
      export VISUAL=vim
      export EDITOR="$VISUAL"
      export HSA_OVERRIDE_GFX_VERSION=10.3.0
      export HSA_ENABLE_SDMA=0
      export ROCM_ENABLE_LOGGING=1
      export AMD_SERIALIZE_KERNEL=3
      
      # Your custom functions or initialization scripts go here safely...
    '';
  };
}
