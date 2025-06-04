{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-dotnettools.csdevkit
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
      github.copilot
      github.copilot-chat
      jnoortheen.nix-ide
    ];

    profiles.default.userSettings = {
      "editor.formatOnSave" = true;
      "editor.smoothScrolling" = true;
      "editor.mouseWheelScrollSensitivity" = 1;
      "workbench.list.smoothScrolling" = true;
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
