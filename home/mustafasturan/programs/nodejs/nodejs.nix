{ pkgs, ... }: {
  home.packages = [ pkgs.nodejs pkgs.pnpm ];

  home.sessionVariables = { NODE_ENV = "development"; };
}
