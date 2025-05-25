{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [  
    ./programs/docker.nix
    ./programs/dotnet.nix
    ./programs/git.nix
    ./programs/hypridle.nix
    ./programs/hyprlock.nix
    ./programs/kitty.nix
    ./programs/neovim.nix
    ./programs/nodejs.nix
    ./programs/rider.nix
    ./programs/vscode.nix
    ./programs/zsh.nix
  ];

  nixpkgs = {
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "mustafasturan";
    homeDirectory = "/home/mustafasturan";
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

}
