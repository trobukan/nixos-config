{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    shellWrapperName = "y";
    plugins = {
      inherit (pkgs.yaziPlugins) full-border starship;
    };
    initLua = ./init.lua;
    settings = {
      mgr = {
        show_hidden = true;
      };
      opener = {
        edit = [
          {
            run = ''$EDITOR "$@"'';
            block = true;
            for = "unix";
          }
        ];
        open = [
          {
            run = ''zathura "$@"'';
            block = true;
            for = "unix";
          }
        ];
      };

      open = {
        prepend_rules = [
          {
            name = "*.md";
            use = "edit";
          }
        ];
      };
    };
    theme = {
      mgr = {
        find_keyword = {
          fg = "blue";
          bg = "white";
          reversed = true;
        };
        border_style = {
          fg = "blue";
        };
      };
    };
  };
}
