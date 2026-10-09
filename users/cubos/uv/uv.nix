{ ... }:

{
  programs.uv = {
    enable = true;

    python = {
      versions = [ "3.15" "3.14" ];
      default = [ "3.15" ];
      prune = true;
    };

    tool = {
      packages = [ "ruff" "posting" ];
      prune = true;
    };

  };
}
