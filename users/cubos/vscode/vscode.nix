{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
          ms-vscode.cmake-tools
          ms-python.python
          ms-python.vscode-pylance
          llvm-vs-code-extensions.vscode-clangd
          twxs.cmake
          ms-vscode.makefile-tools
          ms-toolsai.jupyter
          rust-lang.rust-analyzer
          saoudrizwan.claude-dev
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
          "nix.enableLanguageServer" = true;
          "nix.serverPath"= "nil";
          "workbench.colorTheme" = "Amethyst Dark (Higher Contrast)";
          "editor.fontSize" = 14;
          "editor.fontFamily" = "ComicShannsMono Nerd Font";
          "terminal.integrated.fontFamily" = "ComicShannsMono Nerd Font";
          "terminal.integrated.fontSize" = 14;
          "editor.tabSize" = 2;
          "editor.insertSpaces" = true;
          "terminal.integrated.cursorStyle"= "line";
          "workbench.iconTheme" = "material-icon-theme";
          "material-icon-theme.folders.color" = "#a9a108";
          "material-icon-theme.rootFolders.color" = "#de3a08";
          "cmake.exportCompileCommandsFile" = true;
          "workbench.startupEditor" = "none";
          "python.languageServer" = "Pylance";
          "telemetry.telemetryLevel" = "off";
          "errorTelemetry.enabled" = false;
          "crashReporter.enabled" = false;
          "workbench.enableExperiments" = false;
          "github.copilot.enable" =  { "*" = false; };
          "workbench.welcomePage.walkthroughs.enabled" = false;
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
  home.packages = with pkgs; [
    nil
    llvmPackages.clang-tools
    gdb
    rust-analyzer
  ];
}
