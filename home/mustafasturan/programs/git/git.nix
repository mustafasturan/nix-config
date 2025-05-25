{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Mustafa Turan";
    userEmail = "mustafasturan@gmail.com";
    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
    };
    extraConfig = {
      pull.rebase = false;
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}
