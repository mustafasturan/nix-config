{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
  };

  # Link config.jsonc
  home.file.".config/waybar/config.jsonc".source = ./config.jsonc;

  # Link style.css
  # home.file.".config/waybar/style.css".source = ./style.css;
}
