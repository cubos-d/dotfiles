{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    # This makes it easy to add extensions without manual installation
    profiles = {
      default = {
        extensions = with pkgs; [
          vscode-extensions.bbenoist.nix
          vscode-extensions.ms-python.python
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "amethyst-theme";
            publisher = "amodio";
            version = "2025.1.1516";
            sha256 = "sha256-tqJ0N4lEG+4OV1ZqyUrL/0OD/eM9uXmqSAdWYlpauDU=";
          }
        ];
        userSettings = {
          "workbench.colorTheme" = "Amethyst Dark (Higher Contrast)";
          "editor.fontSize" = 14;
          "editor.fontFamily" = "ComicShannsMono Nerd Font";
          "terminal.integrated.fontFamily" = "ComicShannsMono Nerd Font";
          "terminal.integrated.fontSize" = 14;
        };
      };
    };
  };
}
