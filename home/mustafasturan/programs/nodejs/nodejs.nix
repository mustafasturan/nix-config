{ pkgs, ... }: {
  home.packages = [ 
    nodejs_20
    pnpm
    nodePackages.typescript
    nodePackages.eslint
    nodePackages.prettier
    nodePackages.vitest
  ];

  home.sessionVariables = {
    NODE_ENV = "development";
  };
}
