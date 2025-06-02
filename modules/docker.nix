{
  config,
  pkgs,
  lib,
  ...
}:
{
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    lazydocker
  ];
}
