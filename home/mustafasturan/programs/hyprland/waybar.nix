{ config, pkgs, ... }: {
  programs.waybar = {
    enable = true;

    settings = [{
      layer = "top";
      position = "top";
      height = 34;
      spacing = 6;

      modules-left = [ "hyprland/workspaces" "hyprland/window" ];
      modules-center = [ "clock" ];
      modules-right =
        [ "tray" "pulseaudio" "network" "cpu" "custom/gpu" "memory" ];

      "tray" = { spacing = 10; };

      "clock" = {
        format = " {:%H:%M}";
        tooltip = true;
        tooltip-format = ''
          <big>{:%Y %B}</big>
          <tt><small>{calendar}</small></tt>'';
        format-alt = "{:%Y-%m-%d}";
      };

      "cpu" = {
        format = "{usage}% ";
        tooltip = false;
      };

      "custom/gpu" = {
        exec =
          "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits";
        interval = 5;
        format = "GPU: {}%";
      };

      "memory" = { format = "{}% "; };

      "pulseaudio" = {
        format = "{volume}% {icon}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          "hands-free" = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ "" "" "" ];
        };
        on-click = "pavucontrol";
      };

      "network" = {
        format-wifi = " {essid}";
        format-ethernet = " {ipaddr}";
        format-disconnected = "⚠ Disconnected";
        tooltip = true;
      };
    }];

    style = ''
      /* Tokyo Night */
      @define-color background #1a1b26;
      @define-color background-light #24283b;
      @define-color foreground #c0caf5;
      @define-color black #15161e;
      @define-color red #f7768e;
      @define-color green #9ece6a;
      @define-color yellow #e0af68;
      @define-color blue #7aa2f7;
      @define-color magenta #bb9af7;
      @define-color cyan #7dcfff;
      @define-color white #a9b1d6;
      @define-color orange #ff9e64;


      /* Everforest Dark Colors */
      @define-color background #2b3339;
      @define-color background-light #323c41;
      @define-color foreground #d3c6aa;
      @define-color black #3c474d;
      @define-color red #e67e80;
      @define-color green #a7c080;
      @define-color yellow #dbbc7f;
      @define-color blue #7fbbb3;
      @define-color magenta #d699b6;
      @define-color cyan #83c092;
      @define-color white #d3c6aa;
      @define-color orange #e69875;

      /* Pastel TTY Colors */
      @define-color background #212121;
      @define-color background-light #3a3a3a;
      @define-color foreground #e0e0e0;
      @define-color black #5a5a5a;
      @define-color red #ff9a9e;
      @define-color green #b5e8a9;
      @define-color yellow #ffe6a7;
      @define-color blue #63a4ff;
      @define-color magenta #dda0dd;
      @define-color cyan #a3e8e8;
      @define-color white #ffffff;
      @define-color orange #ff8952;


      /* Gruvbox Dark Colors */
      @define-color background #282828;
      @define-color background-light #3c3836;
      @define-color foreground #ebdbb2;
      @define-color black #32302f;
      @define-color red #cc241d;
      @define-color green #98971a;
      @define-color yellow #d79921;
      @define-color blue #458588;
      @define-color magenta #b16286;
      @define-color cyan #689d6a;
      @define-color white #ebdbb2;
      @define-color orange #d65d0e;

      /* Modules */
      @define-color bg @background;
      @define-color fg @foreground;
      @define-color ws-focused-bg @red;
      @define-color ws-focused-fg @black;
      @define-color window-bg @orange;
      @define-color window-fg @black;
      @define-color audio-bg @blue;
      @define-color audio-fg @black;
      @define-color tray-bg rgba(0,0,0,0);
      @define-color network-bg @magenta;
      @define-color network-fg @black;
      @define-color backlight-bg @yellow;
      @define-color backlight-fg @black;
      @define-color battery-bg @green;
      @define-color battery-fg @black;
      @define-color clock-bg @cyan;
      @define-color clock-fg @black;

      * {
          font-family: "JetBrainsMono Nerd Font";
          font-size: 14px;
      }

      window#waybar {
          background-color: @bg;
          color: @fg;
          border-bottom: none;
          transition-property: background-color;
          transition-duration: .5s;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      window#waybar > box {
          padding: 4px;
      }

      button {
          /* Use box-shadow instead of border so the text isn't offset */
          box-shadow: inset 0 -3px transparent;
          /* Avoid rounded borders under each button name */
          border: none;
          border-radius: 0;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      button:hover {
          background: inherit;
          box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces button {
          padding: 0 10px;
          background-color: transparent;
          border-radius: 4px;
          color: @fg;
          border-radius: 4px;
      }

      #workspaces button:hover {
          background: rgba(0, 0, 0, 0.2);
      }

      #workspaces button.focused {
          background-color: @ws-focused-bg;
          color: @ws-focused-fg;
      }

      #workspaces button.urgent {
          background-color: @green;
      }

      #mode {
          background-color: #64727D;
          box-shadow: inset 0 -3px #ffffff;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #power-profiles-daemon,
      #mpd {
          padding: 0 10px;
          border-radius: 4px;
          color: #ffffff;
      }

      #window,
      #workspaces {
          margin: 0 4px;
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
      }

      #clock {
          background-color: @clock-bg;
          color: @clock-fg;
      }

      #battery {
          background-color: @battery-bg;
          color: @battery-fg;
      }

      @keyframes blink {
          to {
              background-color: #ffffff;
              color: #000000;
          }
      }

      /* Using steps() instead of linear as a timing function to limit cpu usage */
      #battery.critical:not(.charging) {
          background-color: #f53c3c;
          color: #ffffff;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: steps(12);
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      #backlight {
          background-color: @backlight-bg;
          color: @backlight-fg;
      }

      #network {
          background-color: @network-bg;
          color: @network-fg;
      }

      #network.disconnected {
          background-color: @red;
      }

      #pulseaudio {
          background-color: @audio-bg;
          color: @audio-fg;
      }



      #tray {
          background-color: @tray-bg;
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: #eb4d4b;
      }
    '';
  };
}
