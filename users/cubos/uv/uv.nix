{ ... }:

{
  programs.uv = {
    enable = true;

    python = {
      versions = [ "3.14" "3.13"];
      default = [ "3.14" ];
      prune = true;
    };

    tool = {
      packages = [ "ruff" "posting" ];
      prune = true;
    };

  };
}
