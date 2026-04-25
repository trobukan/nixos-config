{ config, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      format = ''
        $directory $git_status$git_branch
        $character
      '';
      character = {
        success_symbol = "[*](bold blue)";
        error_symbol = "[*](bold red)";
      };
      directory = {
        style = "bold blue";
        format = "[$path]($style)";
      };
      git_branch = {
        style = "bold blue";
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      nr = "sudo nixos-rebuild switch --flake '/etc/nixos/#${config.home.username}'";
      nt = "sudo nixos-rebuild test --flake '/etc/nixos/#${config.home.username}'";
      nc = "sudo nixos-rebuild dry-build --flake 'etc/nixos/#${config.home.username}'";
    };
  };
}
