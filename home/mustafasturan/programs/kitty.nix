{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    font.size = 18;
    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 0;
    };
  };
}
