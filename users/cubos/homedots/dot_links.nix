{ config, ... }:

{
  # *=_=_=_=_=_=_=_=_=_=_= hyprland =_=_=_=_=_=_=_=_=_=_=*
  xdg.configFile."hypr/hyprland.lua".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/hyprland/hyprland.lua";
  # *=_=_=_=_=_=_=_=_=_=_= waybar =_=_=_=_=_=_=_=_=_=_=*
  xdg.configFile."waybar/config".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/waybar/config";
  xdg.configFile."waybar/style.css".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/waybar/style.css";
  # *=_=_=_=_=_=_=_=_=_=_= menu =_=_=_=_=_=_=_=_=_=_=*
  xdg.configFile."wofi/config".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/wofi/config";
  xdg.configFile."wofi/style.css".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/wofi/style.css";
  # *=_=_=_=_=_=_=_=_=_=_= terminal utils =_=_=_=_=_=_=_=_=_=_=*
  xdg.configFile."starship.toml".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/starship/starship.toml";
  xdg.configFile."wezterm/wezterm.lua".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/wezterm/wezterm.lua";
  # *=_=_=_=_=_=_=_=_=_=_= file manager =_=_=_=_=_=_=_=_=_=_=*
  xdg.configFile."xfce4/xfconf/xfce-perchannel-xml/thunar.xml".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/thunar/thunar.xml";
  xdg.configFile."Thunar/uca.xml".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/thunar/uca.xml";
  # *=_=_=_=_=_=_=_=_=_=_= quickshell =_=_=_=_=_=_=_=_=_=_=*
  xdg.configFile."quickshell/".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/quickshell";
  # *=_=_=_=_=_=_=_=_=_=_= screenshot utilities =_=_=_=_=_=_=_=_=_=_=*
  xdg.configFile."swappy/config".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/recording/swappy/config.txt";
  # *=_=_=_=_=_=_=_=_=_=_= gtk4.0 stuff =_=_=_=_=_=_=_=_=_=_=*
  xdg.configFile."gtk-4.0/gtk.css".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/homedots/gtk-4.0/gtk.css";
  xdg.configFile."gtk-4.0/gtk-dark.css".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/homedots/gtk-4.0/gtk-dark.css";
}