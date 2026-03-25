{
  _config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./modules/home/sh.nix
    ./modules/home/kitty.nix
    ./modules/home/niri/niri.nix
    ./modules/home/waybar/waybar.nix
  ];

  home.username = "trobukan";
  home.homeDirectory = "/home/trobukan";

  home.packages = with pkgs; [
    btop
    fzf
    fd
    ripgrep
    gcc
    go
    cargo
    gnumake
    nodejs_24
    python311
    sqlite
    love
    luajitPackages.luarocks_bootstrap
    luajit_2_0
    trash-cli

    imagemagick
    yazi
    librewolf
    zathura
    ncpamixer
    inputs.fsel.packages.${pkgs.stdenv.hostPlatform.system}.default

    swww

    ghostscript
    tectonic
  ];

  programs.git = {
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
