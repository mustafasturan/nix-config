{ pkgs, ... }: {
  programs.vscode = {
    enable = true;

    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-dotnettools.csharp
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
    ];

    profiles.default.userSettings = {
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "editor.fontSize" = 14;
      "editor.formatOnSave" = true;
      "workbench.colorTheme" = "Default Dark+";
    };
  };
}
