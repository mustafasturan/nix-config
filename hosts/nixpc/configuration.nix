{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/amd.nix
    ../../modules/bluetooth.nix
    ../../modules/bootloader.nix
    ../../modules/docker.nix
    ../../modules/flatpak.nix
    ../../modules/journald.nix
    ../../modules/locale.nix
    ../../modules/nvidia.nix
    ../../modules/pipewire.nix
    ../../modules/printing.nix
    ../../modules/steam.nix
    ../../modules/time.nix
    ../../modules/virtualization.nix
  ];

  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Networking
  networking = {
    networkmanager.enable = true;
    hostName = "nixpc";
  };

  programs.zsh.enable = true;
  users.users.mustafasturan = {
    isNormalUser = true;
    description = "Mustafa Turan";
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "networkmanager"
    ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [ ];
  };

  environment.systemPackages = with pkgs; [
    curl
    wget
    fzf
    bat
    git
    btop
    htop
    fastfetch
    jq
    greetd.regreet
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.getty.autologinUser = "mustafasturan";

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "Hyprland";
        user = "mustafasturan";
      };
    };
  };

  # Fonts
  #fonts.packages = with pkgs; [
  #  nerd-fonts.jetbrains-mono
  #];

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      #PasswordAuthentication = false;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk # For GTK dialogs
      pkgs.xdg-desktop-portal-hyprland # For Wayland + Hyprland integration
    ];
  };
  # Ensure dbus is enabled (required for portals to work)
  services.dbus.enable = true;

  services.xserver.enable = false;
  services.displayManager.enable = false;

  system.stateVersion = "25.05";
}
