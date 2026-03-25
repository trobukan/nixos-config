{ inputs, ... }:

{
  imports = [
    (inputs.nix-yazi-plugins.legacyPackages.x86_64-linux.homeManagerModules.default)
  ];

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      yazi = ./yazi.toml;
      theme = ./theme.toml;
    };
  };

  programs.yazi.yaziPlugins = {
    enable = true;
    full-border = {
      enable = true;
    };
  };
}
