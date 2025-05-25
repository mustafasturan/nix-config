{ config, pkgs, ... }: {
  xdg.configFile."hypr/hypridle.conf".text = ''
    general {
      before_sleep_cmd = brightnessctl set 100%
      after_sleep_cmd = brightnessctl set 100%
      ignore_dbus_inhibit = false
    }

    listener {
      timeout = 60
      on-timeout = brightnessctl set 10%
      on-resume = brightnessctl set 100%
    }

    listener {
      timeout = 300
      on-timeout = hyprlock
    }

    listener {
      timeout = 600
      on-timeout = hyprctl dispatch dpms off
      on-resume = hyprctl dispatch dpms on
    }

    listener {
      timeout = 1800
      before-sleep-cmd = "${pkgs.libnotify}/bin/notify-send 'Suspending in 10s' && sleep 10";
      on-timeout = bash -c "playerctl --player=playerctld,spotify,firefox,chromium,vlc,mpv status 2>/dev/null | grep -q Playing || systemctl suspend"
    }
  '';
}
