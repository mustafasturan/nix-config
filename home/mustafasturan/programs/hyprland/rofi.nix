{ config, pkgs, ... }: {
  programs.rofi = {
    enable = true;
    theme = "gruvbox-dark";
    extraConfig = {
      show-icons = true;
      modi = "drun,run";
    };
  };
}
