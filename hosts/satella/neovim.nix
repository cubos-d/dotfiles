{ pkgs,  ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      xclip
      wl-clipboard
      luajitPackages.lua-lsp
      rnix-lsp
    ];
  };
}