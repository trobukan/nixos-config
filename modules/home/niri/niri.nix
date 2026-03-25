{ _config, pkgs, ... }:

{
  home.packages = with pkgs; [
    xwayland-satellite
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
  xdg.configFile."niri/configs".source = ./configs;

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
