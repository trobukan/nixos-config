{ config, pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        icons-enabled = false;
        terminal = "${pkgs.kitty}/bin/kitty";
        layer = "overlay";
        font = "${config.global-settings.font}:size=16";
      };
      border = {
        radius = 0;
      };
      colors = {
        input = "#5a93d8ff";
        prompt = "#5a93d8ff";
        text = "#ffffffff";
        match = "#d4d3deff";
        selection-match = "#d4d3deff";
        selection-text = "#ffffffff";
        selection = "#5a93d8ff";
        border = "#000000b3";
        background = "#000000b3";
      };
    };
  };
}
