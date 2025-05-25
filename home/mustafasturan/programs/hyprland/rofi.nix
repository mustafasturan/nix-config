{ config, pkgs, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "gruvbox-dark";
    extraConfig = {
      show-icons = true;
      modi = "drun,run";
    };
  };
}
