{ config, ... }:

let
  style = import ./waybar-style.nix {
    font = config.global-settings.font;
  };
  formats = {
    clock = "[{:%d.%m.%Y | %H:%M}]";
    niri-language = "[{short}]";
    niri-workspaces = "[{value}]";
    pulseaudio = "[audio {volume}%]";
    memory = "[ram {percentage}%]";
    network = {
      ethernet = "[lan on]";
      disconnected = "[net off]";
    };
  };
in
{
  programs.waybar = {
    enable = true;

    style = style;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 26;
        spacing = 7;
        modules-left = [
          "niri/workspaces"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "niri/language"
          "memory"
          "pulseaudio"
          "network"
        ];
        "niri/workspaces" = {
          format = formats.niri-workspaces;
          sort-by-number = true;
        };
        "niri/language" = {
          format = formats.niri-language;
        };
        clock = {
          format = formats.clock;
        };
        pulseaudio = {
          format = formats.pulseaudio;
          max-volume = 100;
          scroll-step = 5;
        };
        memory = {
          interval = 1;
          format = formats.memory;
        };
        network = {
          format = "";
          format-ethernet = formats.network.ethernet;
          format-wifi = "{icon}";
          format-disconnected = formats.network.disconnected;
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          tooltip-format-ethernet = "{ifname}";
          tooltip-format-disconnected = "Disconnected";
        };
      };
    };
  };

}
