{ pkgs, ... }:

{
  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium.fhsWithPackages (ps: with ps; [
      # --- Your Original Additions ---
      rustup
      zlib
      # --- C/C++ Developer Environment Tools ---
      gcc            # Compilers for standard binary compilation
      gnumake        # Base requirement for 'makefile-tools' extension
      cmake          # Base requirement for 'cmake-tools' extension
      glibc          # Critical header references for C library compilation
      # --- Python & General Language Tooling ---
      python3        # Underlying python execution environment
      stdenv.cc.cc   # Essential libstdc++.so.6 references for Pylance/Rust-analyzer
      # --- Graphic Tooling / Vibrancy Support ---
      mesa           # Handles hardware-accelerated rendering layers under Wayland/X11
      libGL          # Graphics library access for Electron transparency layers
      icu            # Text/Unicode layout parsing tools used by Electron extensions
    ]);
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
          ms-python.python
          ms-vscode.cmake-tools
          llvm-vs-code-extensions.vscode-clangd
          twxs.cmake
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
          {
            name = "qt-core";
            publisher = "TheQtCompany";
            version = "1.15.1";
            sha256 = "sha256-KOQPOsoEbNkdSTbLAVmCQiy9G3bguxU+ZMNC761PzPw=";
          }
          {
            name = "qt-qml";
            publisher = "TheQtCompany";
            version = "1.15.1";
            sha256 = "sha256-pHWqTvuWJKm6Mmt5ycR9C69v+ANgu1tXCNtzliR/dHA=";
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
          "python.languageServer" = "Jedi";
          "cmake.exportCompileCommandsFile" = true;
          "workbench.editorAssociations" = {
            "*.qrc" = "qt-core.qrcEditor";
          };
          "qt-qml.doNotAskForQmllsDownload" = true;
          "qt-core.showWelcomePageOnActivation" = false;
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
