{ _config, _pkgs, ... }:

{
  imports = [
    ./modules/home/sh.nix
    ./modules/home/kitty.nix
    ./modules/home/niri/niri.nix
    ./modules/home/waybar/waybar.nix
  ];

  home.username = "trobukan";
  home.homeDirectory = "/home/trobukan";

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "trobukan";
        email = "trobukan@gmail.com";
      };
      safe.directory = "/etc/nixos";

    };

  };

  home.stateVersion = "25.11";

}
