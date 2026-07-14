{ config, lib, pkgs, inputs, ... }:

{
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraPkgs = pkgs': with pkgs'; [
        libXcursor
        libXi
        libXinerama
        libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib # Provides libstdc++.so.6
        libkrb5
        keyutils
        # Add other libraries as needed
      ];
      extraArgs = "-cef-disable-gpu-compositing";
    };

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  environment.systemPackages = with pkgs; [
    steam-run
  ];
}