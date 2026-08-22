{ config, ... }:

{
  home.file = {
    # This creates the directory structure and the symlink automatically
    "Cubos3.0/ML_projects/pyproject.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/development/ML/pyproject.toml";
    };
  }; 
  home.file = {
    ".local/share/themes/.keep" = {
      text = "";
    };
  };
  home.file = {
    ".local/share/icons/.keep" = {
      text = "";
    };
  };
}