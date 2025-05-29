{ pkgs, ... }:
{
  home.packages = [ pkgs.yazi ];
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    font.size = 18;
    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 0;
      scrollback_lines = 10000;
      background_opacity = "0.90";
      tab_bar_style = "powerline";
      hide_window_decorations = "yes";
    };
  };
}
