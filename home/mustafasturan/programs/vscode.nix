{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-dotnettools.csharp
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
      ms-vscode.vscode-typescript-next
    ];
  };
}
