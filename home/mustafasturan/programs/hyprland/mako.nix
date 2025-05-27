{ config, pkgs, ... }: {
  services.mako = {
    enable = true;
    settings = {
      default-timeout = 5000;
      background-color = "#1e1e2e";
      border-color = "#89b4fa";
      border-size = 2;
      padding = "10";
      text-color = "#ffffff";
      max-visible = 5;
      anchor = "top-right";
    };
  };
}
