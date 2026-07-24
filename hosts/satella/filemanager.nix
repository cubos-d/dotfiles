{ pkgs, ... }:

{
  programs.dconf.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "wezterm"; # Change to your preferred terminal
  };
  nixpkgs.overlays = [
    (final: prev: {
      nautilus = prev.nautilus.overrideAttrs (nprev: {
        buildInputs =
          nprev.buildInputs
          ++ (with pkgs.gst_all_1; [
            gst-plugins-good
            gst-plugins-bad
          ]);
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    nautilus
    libheif
    libheif.out
  ];
  environment.pathsToLink = [ "share/thumbnailers" ];
}