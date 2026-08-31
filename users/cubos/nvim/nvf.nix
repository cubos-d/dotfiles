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
        clipboard = {
          enable = true;
          registers = "unnamedplus"; # Sync standard yank/paste with system clipboard
        };
        globals = {
          mapleader = " ";
        };
        lsp = {
          enable = true;
          lspconfig.enable = true;
        };
        ui.noice.enable = true;
        theme = {
          enable = true;
          name = "rose-pine";
          style = "moon";
          transparent = true;
        };
        filetree = {
          neo-tree = {
            enable = true;
            setupOpts = {
              window = {
                position = "left"; 
                width = 30;
              };
            };
          };
        };
        tabline = {
          nvimBufferline = {
            enable = true;
          };
        };
        maps.normal = {
          "<C-b>" = {
            action = ":Neotree toggle<CR>";
            silent = true;
            desc = "Toggle File Explorer Sidebar";
          };
          "<M-1>" = { action = "<Cmd>BufferLineGoToBuffer 1<CR>"; silent = true; desc = "Go to tab 1"; };
          "<M-2>" = { action = "<Cmd>BufferLineGoToBuffer 2<CR>"; silent = true; desc = "Go to tab 2"; };
          "<M-3>" = { action = "<Cmd>BufferLineGoToBuffer 3<CR>"; silent = true; desc = "Go to tab 3"; };
          "<M-4>" = { action = "<Cmd>BufferLineGoToBuffer 4<CR>"; silent = true; desc = "Go to tab 4"; };
          "<M-5>" = { action = "<Cmd>BufferLineGoToBuffer 5<CR>"; silent = true; desc = "Go to tab 5"; };
          "<M-6>" = { action = "<Cmd>BufferLineGoToBuffer 6<CR>"; silent = true; desc = "Go to tab 6"; };
          "<M-7>" = { action = "<Cmd>BufferLineGoToBuffer 7<CR>"; silent = true; desc = "Go to tab 7"; };
          "<M-8>" = { action = "<Cmd>BufferLineGoToBuffer 8<CR>"; silent = true; desc = "Go to tab 8"; };
          "<M-9>" = { action = "<Cmd>BufferLineGoToBuffer 9<CR>"; silent = true; desc = "Go to tab 9"; };
          "<M-Right>" = { action = "<Cmd>BufferLineCycleNext<CR>"; silent = true; desc = "Next tab"; };
          "<M-Left>"  = { action = "<Cmd>BufferLineCyclePrev<CR>"; silent = true; desc = "Previous tab"; };
          "<M-w>" = { 
            action = "<Cmd>bp | bd #<CR>"; 
            silent = true; 
            desc = "Close current tab cleanly"; 
          };
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

        luaConfigPost = ''
          vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
              -- 1. Open the file tree
              vim.cmd("Neotree show")
              -- 2. Optional: Shift focus back to the file you opened
              -- Without this line, your cursor will stay inside the file tree sidebar
              vim.cmd("wincmd p") 
            end
          })
        '';
      };
    };
  };
}
