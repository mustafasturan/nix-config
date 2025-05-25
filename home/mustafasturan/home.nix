{ config, pkgs, ... }: {
  home.username = "mustafasturan";
  home.homeDirectory = "/home/mustafasturan";
  programs.home-manager.enable = true;

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
}
