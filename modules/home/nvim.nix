{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  home.packages = with pkgs; [
    stylua
    gofumpt
    nixfmt
    golines
    gotools
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
      settings.transparent_background = true;
    };

    highlightOverride = {
      NormalFloat.bg = "none";
      FloatBorder.bg = "none";
      FloatBorder.fg = "#5a93d8";

      TelescopeNormal.bg = "none";
      TelescopeBorder.bg = "none";
      TelescopeBorder.fg = "#5a93d8";
    };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      clipboard = "unnamedplus";
    };

    globals.mapleader = " ";

    plugins.lsp = {
      enable = true;
      servers = {
        gopls.enable = true;
        nil_ls.enable = true;
        lua_ls.enable = true;
        marksman.enable = true;
        taplo.enable = true;
        jsonls.enable = true;
      };
    };

    plugins.conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          timeout_ms = 500;
          lsp_format = "fallback";
        };
        formatters_by_ft = {
          lua = [ "stylua" ];
          go = [
            "goimports"
            "gofumpt"
            "golines"
          ];
          nix = [ "nixfmt" ];
        };
      };
    };

    plugins.mini-completion = {
      enable = true;
      settings = {
        delay = {
          completion = 100;
          info = 100;
          signature = 50;
        };

      };
    };

    plugins.mini-starter.enable = true;

    plugins.treesitter = {
      enable = true;
      highlight.enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        vim
        vimdoc
        lua
        bash
        query

        go
        gomod
        gowork
        templ
        nix
        markdown

        json
        yaml
        toml
        dockerfile
        make
      ];
    };

    plugins = {
      none-ls.enable = true;
      bqlink-cmp.enable = true;
      telescope.enable = true;
      web-devicons.enable = true;
      oil.enable = true;
    };

    clipboard = {
      providers.wl-copy = {
        enable = true;
        package = pkgs.wl-clipboard;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Oil<CR>";
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
      }
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>noh<CR><Esc>";
      }
    ];
  };
}
