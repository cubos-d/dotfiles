{ pkgs, ... }:

let
  themeName = "ChromeOS-Darker-Ultraviolet-Rounded";
  chrome-os-dark = import ./custom-gtk-theme.nix { inherit pkgs; };
in
{
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Amber";
    size = 16;
  };
  gtk = {
    enable = true;
    theme = {
      name = themeName; 
      package = chrome-os-dark;
    };
    iconTheme = {
      name = "Sweet-Yellow-Filled";
      package = pkgs.sweet-folders;
    };
    font = {
      name = "ComicShannsMono Nerd Font";
      size = 11; # Specify your preferred default font size
    };
    gtk3 = {
      extraConfig = {
        gtk-font-name = "ComicShannsMono Nerd Font";
      };
    };
    gtk4.extraConfig = {
      gtk-font-name= "ComicShannsMono Nerd Font";
      gtk-application-prefer-dark-theme = 0;
    };
  };
  
  home.file.".local/share/themes/${themeName}" = {
    source = "${chrome-os-dark}/share/themes/${themeName}";
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
  };
}
