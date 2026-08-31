{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Sweet-Dark-v40"; 
      package = pkgs.sweet;
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

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };
}