{ config, pkgs, ... }: {
  imports = [
    ../../modules/amd.nix
    ../../modules/bluetooth.nix
    ../../modules/bootloader.nix
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
  
  # Networking
  networking = {
    networkmanager.enable = true;
    hostName = "nixpc";
  };

  users.users.mustafasturan = {
    isNormalUser = true;
    description = "Mustafa Turan";
    extraGroups = [ "wheel" "audio" "video" "networkmanager" "docker" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      #PasswordAuthentication = false;
    };

  services.xserver.enable = false;
  services.displayManager.enable = false;
  
  services.getty.autoLogin.enable = true;
  services.getty.autoLogin.user = "mustafasturan";

   system.stateVersion = "25.05";
}
