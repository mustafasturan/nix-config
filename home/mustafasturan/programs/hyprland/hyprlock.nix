{ config, pkgs, ... }:
{
  xdg.configFile."hypr/hyprlock.conf".text = ''
    general {
      blur = true
      blur_size = 6
      blur_passes = 4
      noise = false
    }

    background {
      path = ""
      blur = true
    }

    input-field {
      size = 450, 100
      outline_thickness = 4
      placeholder_text =  Enter Password…
      fade_on_empty = true
      dots_center = true
      position = 0, -100
      halign = center
      valign = center
      font_size = 32
    }

    label {
      text = cmd[update:1000] echo  $(date '+%H:%M:%S')
      font_size = 64
      position = 0, 80
      halign = center
      valign = center
    }

    label {
      text = cmd[update:60000] echo  $(date '+%A, %B %d')
      font_size = 32
      position = 0, 160
      halign = center
      valign = center
    }

    label {
      text = cmd[update:600000] bash -c "curl -s 'https://wttr.in/Kadikoy?format=1'"
      font_size = 28
      position = 0, 220
      halign = center
      valign = center
    }
  '';
}
