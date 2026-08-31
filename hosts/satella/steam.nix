{ pkgs, ... }:

{
  programs.steam = {
    enable = true;

    # Keeps Proton-GE available in Steam
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  environment.systemPackages = with pkgs; [
    mangohud
  ];
}