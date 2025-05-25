{ config, pkgs, ... }: 
let
  wallpaperDir = "${config.home.homeDirectory}/Pictures/wallpapers";
  randomWallpaperScript = pkgs.writeShellScript "random-wallpaper.sh" ''
    WALLPAPER=$(find ${wallpaperDir} -type f \( -iname '*.jpg' -o -iname '*.png' \) | shuf -n 1)
    [ -n "$WALLPAPER" ] && ${pkgs.swww}/bin/swww img "$WALLPAPER" --transition-type any --transition-duration 1
  '';
in {
  imports = [
    ./hypridle.nix
    ./hyprlock.nix
    ./mako.nix
    ./rofi.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    hypridle
    hyprlock
    hyprshot
    brightnessctl
    pavucontrol
    playerctl
    jetbrains-mono-nerdfont
    curl
    jq
    nm-applet
    blueman-applet
    cliphist 
    wl-clipboard
    fzf
    swww
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "${pkgs.swww}/bin/swww-daemon"
        "${randomWallpaperScript}"
        "mako"
        "waybar"
        "nm-applet"
        "blueman-applet"
        "hyprlock"
        "cliphist store" ];
      monitor = ",preferred,auto,1";

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        col.active_border = "rgba(88c0d0ee)";
        col.inactive_border = "rgba(2e3440aa)";
      };

      decoration = {
        rounding = 10;
        blur = true;
        blur_size = 3;
        blur_passes = 2;
      };

      "$mod" = "SUPER";
      bind = [
        "$mod, RETURN, exec, kitty"
        "$mod, D, exec, rofi -show drun"
        "$mod, L, exec, hyprlock"
        "$mod, Q, killactive"
        "$mod, F, fullscreen"
        "$mod, V, exec, cliphist list | fzf | cliphist decode | wl-copy"
        "$mod, W, exec, ${randomWallpaperScript}"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod SHIFT, Q, exit"
        "$mod SHIFT, S, exec, hyprshot -m window -o ~/Pictures/Screenshots"
        "$mod CTRL, S, exec, hyprshot -m region -o ~/Pictures/Screenshots"
      ];
    };
  };
}
