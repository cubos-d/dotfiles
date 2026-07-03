{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    # This makes it easy to add extensions without manual installation
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          bbenoist.nix
          ms-python.python
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
