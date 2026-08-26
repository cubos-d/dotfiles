{ ... }:

{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        options = {
          number = true;
          relativenumber = true;
          expandtab = true;
          tabstop = 2;
          softtabstop = 2;
          shiftwidth = 2;
          backspace = "indent,eol,start";
          showcmd = true;
          ruler = true;
          showmatch = true;
          laststatus = 2;
          mouse = "a";
          numberwidth = 1;
        };
        globals = {
          mapleader = " ";
        };
        lsp = {
          enable = true;
        };
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };
        languages = {
          enableTreesitter = true;
          clang = {
            enable = true;
            lsp.enable = true;
          };
          nix = {
            enable = true;
            lsp.enable = true;
          };
          python = {
            enable = true;
            lsp.enable = true;
            format.type = [ "ruff" ];
          };
          rust = {
            enable = true;
            lsp.enable = true;
          };
          css.enable = true;
          bash = {
            enable = true;
            lsp.enable = true;
          };
          docker = {
            enable = true;
            lsp.enable = true;
          };
          json = {
            enable = true;
            lsp.enable = true;
          };
          json5.enable = true;
          lua.enable = true;
          markdown = {
            enable = true;
            lsp.enable = true;
          };
          make.enable = true;
          toml = {
            enable = true;
            lsp.enable = true;
          };
          yaml = {
            enable = true;
            lsp.enable = true;
          };
        };
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
      };
    };
  };
}