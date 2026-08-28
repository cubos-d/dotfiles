{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "dev-start" ''
      MAIN_PANE="''${WEZTERM_PANE}"

      # 1. Create the right pane and capture its returned ID (e.g., 26)
      RIGHT_PANE=$(wezterm cli split-pane --right --percent 25 --pane-id "$MAIN_PANE")

      # 2. Create the bottom pane and capture its returned ID (e.g., 27)
      BOTTOM_PANE=$(wezterm cli split-pane --bottom --percent 20 --pane-id "$MAIN_PANE")
      
      printf "nvim %s\n" | wezterm cli send-text --pane-id "$MAIN_PANE"

      # 3. If packages are defined, type the nix-shell command into both new panes
      if [ -n "$IN_NIX_SHELL" ]; then
          # \n at the end simulates pressing Enter
          printf "nix-shell %s\n" | wezterm cli send-text --pane-id "$RIGHT_PANE"
          printf "nix-shell %s\n" | wezterm cli send-text --pane-id "$BOTTOM_PANE"
      fi
      printf "opencode . %s\n" | wezterm cli send-text --pane-id "$RIGHT_PANE"
    '')
  ];
}
