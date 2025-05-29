{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    profiles.mustafasturan.extensions = with pkgs.vscode-extensions; [
      ms-dotnettools.csdevkit
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
      github.copilot
      github.copilot-chat
      jnoortheen.nix-ide
      catppuccin.catppuccin-vsc
    ];

    profiles.mustafasturan.userSettings = {
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "editor.fontSize" = 16;
      "editor.formatOnSave" = true;
      "workbench.colorTheme" = "Catppuccin Mocha";
      "git.autofetch" = true;
      "nixd" = {
        "formatting" = {
          "command" = [ "nixfmt" ];
        };
        "options" = {
          "nixos" = {
            "expr" = ''(builtins.getFlake "/absolute/path/to/flake").nixosConfigurations.<name>.options'';
          };
          "home-manager" = {
            "expr" = ''(builtins.getFlake "/absolute/path/to/flake").homeConfigurations.<name>.options'';
          };
          "nix-darwin" = {
            "expr" =
              ''(builtins.getFlake "''${workspaceFolder}/path/to/flake").darwinConfigurations.<name>.options'';
          };
        };
      };
    };
  };
}
