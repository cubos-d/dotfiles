{ config, pkgs, inputs, ... }:

{
  # Change this line in your home.nix to reference the absolute physical path
  xdg.configFile."hypr/hyprland.lua".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/hyprland/hyprland.lua";
    
  # Do the same for your waybar configs if you are actively tweaking them
  xdg.configFile."waybar/config".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/waybar/config";
  xdg.configFile."waybar/style.css".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/waybar/style.css";
  xdg.configFile."wofi/config".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/wofi/config";
  xdg.configFile."wofi/style.css".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/wofi/style.css";
  xdg.configFile."starship.toml".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/starship/starship.toml";
  xdg.configFile."wezterm/wezterm.lua".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/wezterm/wezterm.lua";
}