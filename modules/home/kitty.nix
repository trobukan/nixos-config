{ _config, _pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrainsMono NL Nerd Font";
      font_size = "12";
      cursor_trail = "1";
      cursor_trail_decay = "0.1 0.4";
      cursor_shape = "beam";
      background_opacity = "0.7";

      enable_audio_bell = "no";
      confirm_os_window_close = "0";

      background = "#000000";
      foreground = "#deddda";
      selection_background = "#1c1c1c";
      selection_foreground = "#c0bfbc";
      url_color = "#1a5fb4";
      cursor = "#deddda";
      cursor_text_color = "#000000";

      active_border_color = "#1e1e1e";
      inactive_border_color = "#282828";
      bell_border_color = "#ed333b";
      active_tab_background = "#101010";
      active_tab_foreground = "#fcfcfc";
      inactive_tab_background = "#1c1c1c";
      inactive_tab_foreground = "#b0afac";

      color0 = "#000000";
      color1 = "#ed333b";
      color2 = "#57e389";
      color3 = "#ff7800";
      color4 = "#62a0ea";
      color5 = "#9141ac";
      color6 = "#5bc8af";
      color7 = "#deddda";

      color8 = "#9a9996";
      color9 = "#f66151";
      color10 = "#8ff0a4";
      color11 = "#ffa348";
      color12 = "#99c1f1";
      color13 = "#dc8add";
      color14 = "#93ddc2";
      color15 = "#f6f5f4";
    };
  };
}
