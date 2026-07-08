{ config, pkgs, inputs, ... }:

{
  programs.dconf.enable = true;

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita"; # Replace with your theme name
      package = pkgs.gnome-themes-extra; # Replace with your theme package
    };
    #iconTheme = {
    #  name = "Papirus";
    #  package = pkgs.papirus-icon-theme;
    #};
  };

  qt = {
    enable = true;
    qt.platformTheme = "gtk";
  };
}