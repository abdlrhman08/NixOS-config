{ pkgs, unstable, ... }: {
  programs.neovim = 
  let
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;
    extraConfig = toLuaFile ./lua/init.lua;
    package = unstable.neovim-unwrapped;

    plugins = with pkgs.vimPlugins; [	
      plenary-nvim
      {
	plugin = telescope-nvim;
	config = toLuaFile ./lua/telescope.lua;
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
	config = toLuaFile ./lua/completions.lua;
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
	config = toLuaFile ./lua/lsp.lua;
      }
      nvim-web-devicons

      {
        plugin = kanagawa-nvim;
	type = "lua";
	config = "vim.cmd(\"colorscheme kanagawa-dragon\")";
      }
      {
        plugin = lualine-nvim;
	config = toLuaFile ./lua/statusbar.lua;
      }
      nvim-treesitter.withAllGrammars
    ];
  };
}
