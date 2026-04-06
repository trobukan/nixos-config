{
  _config,
  pkgs,
  ...
}:

{
  imports = [
    ./modules/home/sh.nix
    ./modules/home/kitty.nix
    ./modules/home/nvim.nix
    ./modules/home/fuzzel.nix
    ./modules/home/cursor.nix

    ./modules/home/niri/niri.nix
    ./modules/home/yazi/yazi.nix
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
    nodejs
    python3
    sqlite
    love
    luajitPackages.luarocks_bootstrap
    luajit_2_0
    trash-cli

    obsidian
    qpwgraph
    imagemagick
    discord
    librewolf
    steam
    zathura
    ncpamixer
    awww

    ghostscript
    tectonic
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "trobukan";
        email = "trobukan@gmail.com";
      };
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };

  home.stateVersion = "25.11";

}
