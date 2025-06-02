{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/amd.nix
    ../../modules/bluetooth.nix
    ../../modules/bootloader.nix
    ../../modules/docker.nix
    ../../modules/flatpak.nix
    ../../modules/locale.nix
    ../../modules/nvidia.nix
    ../../modules/pipewire.nix
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
      "docker"
    ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
    ];
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
  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

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
