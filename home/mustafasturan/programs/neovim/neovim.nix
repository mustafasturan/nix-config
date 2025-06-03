{ pkgs, ... }:
{
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
    ];
    extraConfig = ''
      set number
      set relativenumber
      set tabstop=4 shiftwidth=4 expandtab
      set clipboard=unnamedplus
      set mouse=a
    '';
  };
}
