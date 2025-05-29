{ config, pkgs, ... }:
let
  wallpaperDir = "${config.home.homeDirectory}/Pictures/wallpapers";

  randomWallpaperScript = pkgs.writeShellScript "random-wallpaper.sh" ''
    WALLPAPER=$(find ${wallpaperDir} -type f \( -iname '*.jpg' -o -iname '*.png' \) | shuf -n 1)
    [ -n "$WALLPAPER" ] && ${pkgs.swww}/bin/swww img "$WALLPAPER" --transition-type any --transition-duration 1
  '';

  rofiPowerMenu = pkgs.writeShellScriptBin "rofi-power.sh" ''
    ${pkgs.rofi}/bin/rofi -show power-menu -modi power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu
  '';
in
{
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
    hyprpolkitagent
    brightnessctl
    playerctl
    pavucontrol
    networkmanagerapplet
    cliphist
    wl-clipboard
    swww
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1"; # Wayland-native Firefox/Thunderbird
    NIXOS_OZONE_WL = "1"; # Wayland support in Electron/Chromium apps
    SDL_VIDEODRIVER = "wayland"; # SDL games/apps use Wayland
    CLUTTER_BACKEND = "wayland"; # GNOME-based apps fallback (if used)
    XDG_CURRENT_DESKTOP = "Hyprland"; # Set desktop environment
    XDG_SESSION_TYPE = "wayland"; # Set session type to Wayland
    XDG_SESSION_DESKTOP = "hyprland"; # Set session desktop to Hyprland
    QT_AUTO_SCREEN_SCALE_FACTOR = "1"; # Qt apps scale automatically
    QT_QPA_PLATFORM = "wayland"; # Qt apps use Wayland
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1"; # Disable window decorations in Qt apps
    QT_QPA_PLATFORMTHEME = "qt6ct"; # Use qt6ct for Qt apps theming
  };

  wayland.windowManager.hyprland = {
    enable = true;
    # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
    package = null;
    portalPackage = null;

    settings = {
      "$mod" = "SUPER";
      exec-once = [
        "${pkgs.swww}/bin/swww-daemon || true"
        "${randomWallpaperScript} || true"
        "systemctl --user start hyprpolkitagent"
        "mako"
        "waybar"
        "nm-applet"
        "blueman-applet"
        "wl-paste --watch cliphist store &"
      ];

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

      input = {
        kb_repeat_rate = 35;
        kb_repeat_delay = 200;
        accel_profile = adaptive;
      };

      bind =
        [
          "$mod, RETURN, exec, kitty"
          "$mod, SPACE, exec, rofi -show drun"
          "$mod, L, exec, hyprlock"
          "$mod, Q, killactive"
          "$mod, F, fullscreen"
          "$mod, R, exec, hyprctl reload"
          "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
          "$mod, W, exec, ${randomWallpaperScript}"
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"
          "$mod SHIFT, E, exec, ${rofiPowerMenu}"
          "$mod SHIFT, Q, exit"
          "$mod, Print, exec, hyprshot -m output -c"
          "$mod SHIFT, S, exec, hyprshot -m window -o ~/Pictures/Screenshots -n"
          "$mod CTRL, S, exec, hyprshot -m region -o ~/Pictures/Screenshots -n"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (
            builtins.genList (
              i:
              let
                ws = i + 1;
              in
              [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            ) 9
          )
        );
    };
    systemd.variables = [ "--all" ];
  };
}
