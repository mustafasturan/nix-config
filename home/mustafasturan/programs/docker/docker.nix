{ pkgs, ... }: {
  home.packages = [ pkgs.docker pkgs.docker-compose pkgs.lazydocker ];
}
