{ config, pkgs, inputs, ... }:
{
  services.hyprpaper = {
  enable = true;
  settings = {
    ipc = "on";
    preload = [
      "/home/cubos/Pictures/Caratulas/emilia4.jpg"
    ];
    wallpaper = [
      "/home/cubos/Pictures/Caratulas/emilia4.jpg"
    ];
  };
};

}