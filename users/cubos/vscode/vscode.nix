{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    # This makes it easy to add extensions without manual installation
    profiles = {
      cubos = {
        extensions = with pkgs.vscode-extensions; [
          bbenoist.nix
          ms-python.python
          ms-python.vscode-pylance
          ms-vscode.cmake-tools
          ms-vscode.cpptools
          ms-vscode.cpptools-extension-pack
          ms-vscode.makefile-tools
          ms-toolsai.jupyter
          ms-toolsai.jupyter-keymap
          ms-toolsai.jupyter-renderers
          ms-toolsai.vscode-jupyter-cell-tags
          ms-toolsai.vscode-jupyter-slideshow
          rust-lang.rust-analyzer
          continue.continue
          davidanson.vscode-markdownlint
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "amethyst-theme";
            publisher = "amodio";
            version = "2025.1.1516";
            sha256 = "sha256-tqJ0N4lEG+4OV1ZqyUrL/0OD/eM9uXmqSAdWYlpauDU=";
          }
          {
            name = "material-icon-theme";
            publisher = "PKief";
            version = "5.36.1";
            sha256 = "sha256-1yxTjIsyj8o97VlvDlWqPCNIxd6XgbjpqF5qNbVtEwg=";
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
          "terminal.integrated.cursorStyle"= "line";
          "workbench.iconTheme" = "material-icon-theme";
          "material-icon-theme.folders.color" = "#a9a108";
          "material-icon-theme.rootFolders.color" = "#de3a08";
        };
        keybindings = [
          {
            key = "ctrl+down";
            command = "workbench.action.terminal.focus";
            when = "editorTextFocus";
          }
          
          {
            key = "ctrl+up";
            command = "workbench.action.focusActiveEditorGroup";
            when = "!editorTextFocus";
          }
        ];
      };
    };
  };
}
