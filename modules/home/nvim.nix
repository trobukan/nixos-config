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
    tree-sitter
    rustfmt
    rust-analyzer
    typescript-language-server
    prettier
    vscode-langservers-extracted
    biome
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
        ts_ls.enable = true;
        html.enable = true;
        cssls.enable = true;
        biome.enable = true;
      };

      keymaps = {
        diagnostic = {
          "<leader>j" = "goto_next";
          "<leader>k" = "goto_prev";
        };
        lspBuf = {
          "gd" = "definition";
          "gD" = "references";
          "gt" = "type_definition";
          "gi" = "implementation";
          "K" = "hover";
        };
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
          rust = [ "rustfmt" ];
          javascript = [ "biome" ];
          typescript = [ "biome" ];
          css = [ "biome" ];
          html = [ "biome" ];
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

    plugins.mini-cmdline = {
      enable = true;
      settings = {
        autocomplete.enable = true;
        autocorrect.enable = true;
        autopeek.enable = false;
      };
    };

    plugins.treesitter = {
      enable = true;
      highlight.enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        vim
        vimdoc
        lua
        bash
        query

        javascript
        typescript
        tsx
        rust
        go
        gomod
        gowork
        templ
        nix
        markdown
        html
        css

        json
        yaml
        toml
        dockerfile
        make
      ];
    };

    plugins.lspsaga = {
      settings = {
        lightbulb.enable = false;
        implement.enable = false;
      };
    };

    plugins.toggleterm = {
      enable = true;
      settings = {
        direction = "float";
        height = 30;
        width = 130;
        highlights = {
          FloatBorder.guifg = "#5a93d8";
        };
        open_mapping = "[[<C-.>]]";
      };
    };

    plugins.mini-notify.enable = true;
    plugins.mini-starter.enable = true;
    plugins.mini-pairs.enable = true;
    plugins.mini-files.enable = true;

    plugins.none-ls.enable = true;
    plugins.telescope.enable = true;
    plugins.web-devicons.enable = true;
    plugins.which-key.enable = true;
    plugins.markview.enable = true;

    plugins.rustaceanvim.enable = true;
    plugins.crates.enable = true;

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
        action = "<cmd>lua MiniFiles.open()<CR>";
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
      }
      {
        mode = "n";
        key = "<leader>fd";
        action = "<cmd>Telescope diagnostics<CR>";
      }
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>noh<CR><Esc>";
      }
    ];
  };
}
