{ pkgs, ... }: {
  home.packages = [ pkgs.jetbrains.rider ];

  home.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
  };
}
