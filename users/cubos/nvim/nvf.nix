{ pkgs, inputs, ... }:
let
  pkgs-nvf = import inputs.nvf {
    system = pkgs.stdenv.hostPlatform.system;
    #config.allowUnfree = true; # match your main config if needed
  };
in
{
  programs.nvf = {
    enable = true;
    package = pkgs-nvf.nvf;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        lsp = {
          enable = true;
        };
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };
      };
    };
  };
}