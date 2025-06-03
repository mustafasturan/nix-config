{ config, pkgs, ... }:
{
  services.mako = {
    enable = true;
    settings = {
      default-timeout = 5000;
      border-size = 2;
      padding = "10";
      max-visible = 5;
      anchor = "top-right";
    };
  };
}
