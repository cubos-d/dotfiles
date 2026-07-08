{ config, pkgs, inputs, ... }:

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
    waybar
    wl-clipboard
    hyprpaper
    fastfetch
    htop
    starship
    wlogout
    nerd-fonts.comic-shanns-mono
    eza
    starship
    discord
    nwg-look
    nwg-displays
    nwg-wrapper
    file-roller
    awww
    yazi
    mate.eom
  ];
  
}
