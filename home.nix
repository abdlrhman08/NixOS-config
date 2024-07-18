{ config, lib, pkgs, inputs, unstable, ... }:

{
  
  home.username = "abdelrahman";
  home.homeDirectory = "/home/abdelrahman";

  home.packages = with pkgs; [
    fastfetch
    ripgrep
    gnome.ghex

    fzf
    glow
    atac
    obsidian
    prismlauncher

    obs-studio

    vscode
    # few language servers
    lua-language-server
    nixd

    # rust toolkit
    (rust-bin.stable.latest.default.override {
      extensions = [
        "rust-src"
        "rust-analyzer"
      ];
    })
  ];

  programs.git = {
    enable = true;
    userName = "abdlrhman08";
    userEmail = "abdelrahmanhamada65@gmail.com";
  };

  programs.zellij = {
    enable = true;
  };

  programs.neovim = 
  let
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;
    extraConfig = toLuaFile ./nvim/init.lua;
    package = unstable.neovim-unwrapped;

    plugins = with pkgs.vimPlugins; [	
      plenary-nvim
      {
	plugin = telescope-nvim;
	config = toLuaFile ./nvim/telescope.lua;
      }
      {
        plugin = dressing-nvim;
	type = "lua";
	config = "require(\"dressing\").setup({})";
      }
      {
        plugin = indent-blankline-nvim;
        type = "lua";
	config = "require(\"ibl\").setup()";
      }
      {
        plugin = nvim-cmp;
	config = toLuaFile ./nvim/completions.lua;
      }	

      cmp_luasnip
      cmp-nvim-lsp
      luasnip
      {
        plugin = nvim-tree-lua;
        type = "lua";
	config = "require(\"nvim-tree\").setup()";
      }
      
      {
        plugin = nvim-lspconfig;
	config = toLuaFile ./nvim/lsp.lua;
      }
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
