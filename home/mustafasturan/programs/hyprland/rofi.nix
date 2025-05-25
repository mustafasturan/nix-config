{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    rofi-power-menu
  ];
  
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "gruvbox-dark";
    
    extraConfig = {
      show-icons = true;
      modi = "drun,run";
      font = "JetBrainsMono Nerd Font 12";
      display-drun = " Launch:";
      drun-display-format = "{name}";
      terminal = "kitty";
    };
  };
}
