{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter
      nvim-lspconfig
      telescope-nvim
      plenary-nvim
      gruvbox-nvim
    ];
    extraConfig = ''
      set number
      colorscheme gruvbox
    '';
  };
}
