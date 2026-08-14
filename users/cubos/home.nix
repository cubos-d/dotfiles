{ pkgs, inputs, ... }:

let
  pkgs-unstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    #config.allowUnfree = true; # match your main config if needed
  };
in
{
  home.username = "cubos";
  home.homeDirectory = "/home/cubos";
  home.stateVersion = "26.05"; # Match your system's stateVersion

  # Let Home Manager manage itself (necessary)
  programs.home-manager.enable = true;
  # Imports user-specific modular apps
  imports = [
    ./homedots/bash.nix
    ./homedots/python-stuff.nix
    ./vscode/vscode.nix
    ./homedots/gtk.nix
    ./homedots/dot_links.nix
    ./homedots/homefiles.nix
    ./nautilus/nautilus.nix
    ./sec/gnupass.nix
    ../../vms/miku-ubuntu-mate/miku-mate1.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    xwayland.enable = true;
  };

  # User specific packages go here instead of configuration.nix
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    btop
    wezterm
    wofi
    quickshell
    wl-clipboard
    fastfetch
    htop
    starship
    wlogout
    nerd-fonts.comic-shanns-mono #Beautiful font
    eza
    discord
    nwg-look
    nwg-displays
    nwg-wrapper
    awww
    eom
    vlc
    candy-icons
    sweet-folders
    sweet
    atril
    libreoffice-still
    hunspellDicts.es_MX
    hunspellDicts.es_CO
    hunspellDicts.es_ES
    hunspellDicts.en_US
    pluma
    gscan2pdf
    remmina
    grim
    swappy
    slurp
    cm_unicode #ugly fonts for publications
    newcomputermodern #ugly font for publications
    llvmPackages.openmp
    zip
    unzip
    _7zz
    pkgs-unstable.noctalia
  ];
  
}
