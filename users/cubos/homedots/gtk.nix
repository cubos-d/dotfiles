{ config, pkgs, inputs, ... }:

{
  gtk = {
    enable = true;
    #theme = {
      #name = "Adwaita"; # Replace with your theme name
      #package = pkgs.gnome-themes-extra; # Replace with your theme package
    #};
    iconTheme = {
      name = "Sweet-Purple-Filled";
      package = pkgs.sweet-folders;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };
}