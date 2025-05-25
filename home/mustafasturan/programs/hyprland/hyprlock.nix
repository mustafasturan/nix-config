{ config, pkgs, ... }: {
  xdg.configFile."hypr/hyprlock.conf".text = ''
    general {
      blur = true
      blur_size = 6
      blur_passes = 4
      noise = false
    }

    background {
      monitor = eDP-1
      path = ""
      blur = true
      color = rgba(0, 0, 0, 0.5)
    }

    input-field {
      monitor = eDP-1
      size = 450, 100
      outline_thickness = 4
      outer_color = rgba(255, 255, 255, 0.3)
      inner_color = rgba(20, 20, 20, 0.8)
      font_color = rgba(255, 255, 255, 1.0)
      placeholder_text =  Enter Password…
      fade_on_empty = true
      dots_center = true
      position = 0, -100
      halign = center
      valign = center
      font_family = "JetBrainsMono Nerd Font"
      font_size = 32
    }

    label {
      monitor = eDP-1
      text = cmd[update:1000] echo  $(date '+%H:%M:%S')
      font_size = 64
      font_family = "JetBrainsMono Nerd Font"
      position = 0, 80
      halign = center
      valign = center
      font_color = rgba(255, 255, 255, 1.0)
    }

    label {
      monitor = eDP-1
      text = cmd[update:60000] echo  $(date '+%A, %B %d')
      font_size = 32
      font_family = "JetBrainsMono Nerd Font"
      position = 0, 160
      halign = center
      valign = center
      font_color = rgba(200, 200, 200, 1.0)
    }

    label {
      monitor = eDP-1
      text = cmd[update:600000] bash -c "curl -s 'https://wttr.in/Kadikoy?format=1'"
      font_size = 28
      font_family = "JetBrainsMono Nerd Font"
      position = 0, 220
      halign = center
      valign = center
      font_color = rgba(180, 180, 180, 1.0)
    }
  '';
}
