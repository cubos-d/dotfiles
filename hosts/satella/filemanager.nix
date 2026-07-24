{ pkgs, inputs, ... }:

{
  programs.dconf.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.tumbler.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin 
      thunar-volman 
      thunar-media-tags-plugin 
    ];
  };
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "wezterm"; # Change to your preferred terminal
  };
  environment.systemPackages = with pkgs; [
    file-roller
    nautilus
  ];
}