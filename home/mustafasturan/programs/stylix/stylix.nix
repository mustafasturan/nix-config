{ pkgs, ... }:
{
  stylix = {
    autoEnable = true;
    base16Scheme = "gruvbox-dark-medium";

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrainsMono Nerd Font";
        size = 14;
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
        size = 16;
      };
      serif = {
        package = pkgs.inter;
        name = "Inter";
        size = 16;
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 20;
    };

    targets = {
      gtk.enable = true;
      qt.enable = true;
      kitty.enable = true;
      waybar.enable = true;
      bash.enable = true;
      zsh.enable = true;
      vscode.enable = true;
      neovim.enable = true;
    };
  };
}
