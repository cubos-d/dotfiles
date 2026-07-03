{ config, pkgs, ... }:

{
  # Configure automated garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d"; # Automatically drops generations older than 7 days
  };

  # Optimize storage by hard-linking identical files automatically
  nix.settings.auto-optimise-store = true;
}
