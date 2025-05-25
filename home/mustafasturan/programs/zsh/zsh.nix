{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    history.size = 10000;
    shellAliases = {
      ll = "ls -alF";
      gs = "git status";
    };
  };
}
