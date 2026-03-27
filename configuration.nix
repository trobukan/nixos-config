{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  hardware.graphics = {
    enable = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  services.xserver = {
    enable = true;
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

  services.openssh.enable = true;

  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    unzip
  ];

  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
    fontconfig = {
      enable = true;
      defaultFonts.monospace = [
        "JetbrainsMonoNL Nerd Font"
      ];
    };
  };

  system.stateVersion = "25.11";

}
