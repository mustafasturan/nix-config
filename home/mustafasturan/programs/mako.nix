{ config, pkgs, ... }: {
  home.packages = with pkgs; [ jetbrains-mono-nerdfont ];
  
  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    backgroundColor = "#1e1e2e";
    borderColor = "#89b4fa";
    textColor = "#ffffff";
    font = "JetBrainsMono Nerd Font 12";
    borderSize = 2;
    padding = "10";
    maxVisible = 5;
    anchor = "top-right";
  };
}
