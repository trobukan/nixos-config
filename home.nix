{
  config,
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
    zig
    upx
    cargo
    rustc
    gnumake
    nodejs
    pnpm
    tsx
    typescript
    python3
    sqlite
    love
    luajitPackages.luarocks_bootstrap
    luajit_2_0
    trash-cli
    openssl

    blockbench
    blender
    bruno
    posting
    typtea
    nautilus
    kdePackages.kdenlive
    handbrake
    godot
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

    benhsm-minesweeper
    minefair
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

  home.sessionVariables = {
    EDITOR = "nvim";
    GOPATH = "$HOME/go";
    GDTOOLCHAIN = "local";
    GDPATH = "$HOME";
  };

  home.sessionPath = [
    "$HOME/go/bin"
    "$HOME/.cargo/bin"
    "$HOME/.npm-global/bin"
  ];

  home.stateVersion = "25.11";

}
