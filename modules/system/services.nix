{ pkgs, ... }:
{

  services.mysql = {
    enable = false;
    package = pkgs.mariadb;
  };

  services.openssh.enable = true;

  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [
      xterm
    ];
    xkb = {
      layout = "us";
      variant = "";
    };
    videoDrivers = [ "nvidia" ];
  };

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    autoLogin = {
      enable = true;
      user = "trobukan";
    };
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.flatpak.enable = true;
  users.users.trobukan = {
    isNormalUser = true;
    description = "trobukan";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

}
