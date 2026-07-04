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
          vscode-extensions.ms-python.vscode-pylance
          vscode-extensions.ms-vscode.cmake-tools
          vscode-extensions.ms-vscode.cpptools
          vscode-extensions.ms-vscode.cpptools-extension-pack
          vscode-extensions.ms-vscode.makefile-tools
          vscode-extensions.ms-toolsai.jupyter
          vscode-extensions.ms-toolsai.jupyter-keymap
          vscode-extensions.ms-toolsai.jupyter-renderers
          vscode-extensions.ms-toolsai.vscode-jupyter-cell-tags
          vscode-extensions.ms-toolsai.vscode-jupyter-slideshow
          vscode-extensions.rust-lang.rust-analyzer
          vscode-extensions.llvm-vs-code-extensions.vscode-clangd
          vscode-extensions.continue.continue
          vscode-extensions.davidanson.vscode-markdownlint
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
          "editor.tabSize" = 4;
          "editor.insertSpaces" = true;
        };
      };
    };
  };
}
