{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./programs/dotnet/dotnet.nix
    ./programs/firefox/firefox.nix
    ./programs/git/git.nix
    ./programs/hyprland/hyprland.nix
    ./programs/kitty/kitty.nix
    ./programs/neovim/neovim.nix
    ./programs/nodejs/nodejs.nix
    ./programs/rider/rider.nix
    ./programs/vscode/vscode.nix
    ./programs/zsh/zsh.nix
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

  # Enable home-manager
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.nixfmt-rfc-style
    pkgs.nwg-look
    pkgs.gsimplecal
  ];

  home = {
    username = "mustafasturan";
    homeDirectory = "/home/mustafasturan";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
