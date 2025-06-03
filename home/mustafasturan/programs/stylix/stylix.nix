{ pkgs, ... }:
{
  stylix = {
    autoEnable = true;
    base16Scheme = "gruvbox-dark-medium";

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      serif = {
        package = pkgs.inter;
        name = "Inter";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        desktop = 16;
        popups = 18;
        terminal = 16;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 18;
    };

    targets = {
      gtk.enable = true;
      qt.enable = true;
      kitty.enable = true;
      waybar.enable = true;
      vscode.enable = true;
      neovim.enable = true;
    };
  };
}
