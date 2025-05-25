{ config, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;

    settings = [{
      layer = "top";
      position = "top";
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "pulseaudio" "network" "battery" "tray" ];

      "clock" = {
        format = "{:%Y-%m-%d %H:%M}";
        tooltip = true;
        tooltip-format = "{:%A, %d %B %Y}";
      };

      "pulseaudio" = {
        format = "{volume}% ";
        format-muted = "";
        tooltip = false;
        scroll-step = 5;
      };

      "battery" = {
        format = "{capacity}% {icon}";
        format-icons = [ "" "" "" "" "" ];
        critical-threshold = 15;
        interval = 60;
      };

      "network" = {
        format-wifi = " {essid}";
        format-ethernet = " {ipaddr}";
        format-disconnected = "⚠ Disconnected";
        tooltip = true;
      };

      "hyprland/workspaces" = {
        format = "{icon}";
        on-click = "activate";
      };
    }];

    style = ''
      * {
        font-family: JetBrainsMono Nerd Font;
        font-size: 14px;
        border: none;
        padding: 2px 6px;
      }

      window#waybar {
        background-color: rgba(30, 30, 46, 0.9);
        color: #cdd6f4;
      }

      #clock, #battery, #pulseaudio, #network {
        margin: 0 6px;
      }

      #battery.warning {
        color: #f9e2af;
      }

      #battery.critical {
        color: #f38ba8;
      }
    '';
  };
}
