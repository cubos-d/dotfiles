{ pkgs, inputs, ... }:

let
  pkgs-unstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
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
    inputs.nvf.homeManagerModules.default
    ./homedots/bash.nix
    ./homedots/python-stuff.nix
    ./vscode/vscode.nix
    ./homedots/gtk.nix
    ./homedots/dot_links.nix
    ./homedots/homefiles.nix
    ./nautilus/nautilus.nix
    ./sec/gnupass.nix
    ./nvim/nvf.nix
    ./nvim/dev_start.nix
    ../../vms/miku-ubuntu-mate/miku-mate1.nix
  ];

  #xdg.portal = {
  #  enable = true;
  #  extraPortals = [ 
  #    pkgs.xdg-desktop-portal-gtk 
  #    inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland 
  #  ];
  #  config.common.default = [ "hyprland" "gtk" ];
  #};

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    xwayland.enable = true;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  # User specific packages go here instead of configuration.nix
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    wezterm
    wofi
    fastfetch
    htop
    starship
    nerd-fonts.comic-shanns-mono #Beautiful font
    eza
    discord
    nwg-look
    nwg-displays
    eom
    vlc
    candy-icons
    sweet-folders
    sweet
    papers
    evince
    libreoffice-still
    hunspellDicts.es_MX
    hunspellDicts.es_CO
    hunspellDicts.es_ES
    hunspellDicts.en_US
    gscan2pdf
    remmina
    grim
    swappy
    slurp
    cm_unicode #ugly fonts for publications
    newcomputermodern #ugly font for publications
    zip
    unzip
    _7zz
    pkgs-unstable.noctalia
    pluma
    amberol
    planify
  ];
  
}
