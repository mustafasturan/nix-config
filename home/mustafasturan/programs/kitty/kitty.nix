{ pkgs, ... }:
{
  home.packages = [ pkgs.yazi ];
  programs.kitty = {
    enable = true;
    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 0;
      scrollback_lines = 10000;
      tab_bar_style = "powerline";
      hide_window_decorations = "yes";
    };
  };
}
