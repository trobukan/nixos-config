{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.blex-mono
      nerd-fonts._0xproto
      nerd-fonts._3270
      nerd-fonts.terminess-ttf
    ];
    fontconfig = {
      enable = true;
    };
  };
}
