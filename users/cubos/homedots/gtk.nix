{ pkgs, ... }:

let
  themeName = "ChromeOS-Darker-UltraViolet-Rounded";
  chrome-os-dark = import ./gtk-theme.nix { inherit pkgs; }; 
in
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
    platformTheme.name = "gtk";
  };
}