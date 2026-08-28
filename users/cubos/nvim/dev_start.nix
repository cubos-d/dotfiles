{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "dev-start" ''
      # Use a bash array for safe argument passing (avoiding quote-stripping bugs)
      cmd=()
      if [ -z "$IN_NIX_SHELL" ] && [ -n "$NIX_SHELL_PACKAGES" ]; then
          cmd=(-- bash -c "nix-shell -p $NIX_SHELL_PACKAGES")
      fi

      # Capture the original pane ID (the main left pane) at script launch
      # Note: We use ''$ in Nix multi-line strings to escape the dollar sign for bash
      MAIN_PANE="''${WEZTERM_PANE}"

      # 1. Split the main pane to the right (25%)
      wezterm cli split-pane --right --percent 25 --pane-id "$MAIN_PANE" "''${cmd[@]}"

      # 2. Split the main pane to the bottom (20%)
      wezterm cli split-pane --bottom --percent 20 --pane-id "$MAIN_PANE" "''${cmd[@]}"
    '')
  ];
}
