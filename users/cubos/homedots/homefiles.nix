{ config, pkgs, inputs, ... }:

{
  home.file = {
    # This creates the directory structure and the symlink automatically
    "Cubos3.0/ML_projects/pyproject.toml" = {
      source = ./development/ML/pyproject.toml;
    };
  }; 
  home.file = {
    # This creates the directory structure and the symlink automatically
    ".continue/config.yaml" = {
      source = ./vscode/continue/config.yaml;
    };
  }; 
}