{ config, pkgs, ... }:

{
  home.username = "abdelrahman";
  home.homeDirectory = "/home/abdelrahman";

  home.packages = with pkgs; [
    fastfetch
    ripgrep

    fzf

    glow
  ];

  programs.git = {
    enable = true;
    userName = "abdlrhman08";
    userEmail = "abdelrahmanhamada65@gmail.com";
  };

  programs.neovim = 
  let
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      {
        plugin = kanagawa-nvim;
	type = "lua";
	config = "vim.cmd(\"colorscheme kanagawa-dragon\")";
      }
      {
        plugin = lualine-nvim;
	config = toLuaFile ./nvim/statusbar.lua;
      }
      nvim-treesitter.withAllGrammars
    ];
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
