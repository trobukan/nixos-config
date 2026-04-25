{ lib, ... }:
{
  options.global-settings = {
    font = lib.mkOption {
      type = lib.types.str;
      default = "3720 Nerd Font Mono";
      description = "Set global user font";
    };
  };
}
