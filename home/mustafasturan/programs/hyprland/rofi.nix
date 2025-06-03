{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ rofi-power-menu ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    extraConfig = {
      show-icons = true;
      modi = "drun,run";
      display-drun = " Launch:";
      drun-display-format = "{name}";
      terminal = "kitty";
    };
  };
}
