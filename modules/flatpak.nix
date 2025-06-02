{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    flatseal
  ];

  services.flatpak.enable = true;
  xdg.portal.enable = true;
}
