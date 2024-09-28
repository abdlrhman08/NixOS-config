{ pkgs, unstable, ... }: {
    programs.neovim = let
        readConfig = file: builtins.readFile file;
    in
    {
        enable = true;
        extraConfig = ''
        lua << EOF
            ${readConfig ./lua/init.lua}
            ${readConfig ./lua/telescope.lua}
            ${readConfig ./lua/completions.lua}
            ${readConfig ./lua/lsp.lua}
            ${readConfig ./lua/statusbar.lua}
        EOF'';
        
        package = unstable.neovim-unwrapped;

        plugins = with pkgs.vimPlugins; [	
            plenary-nvim
            aerial-nvim
            telescope-nvim
            nvim-cmp
            cmp_luasnip
            cmp-nvim-lsp
            luasnip
            lualine-nvim
            nvim-treesitter.withAllGrammars
            nvim-lspconfig
            nvim-web-devicons
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
                plugin = nvim-tree-lua;
                type = "lua";
                config = ''
                    require("nvim-tree").setup()
                    vim.keymap.set("n", "<leader>n", function() vim.cmd("NvimTreeToggle") end, {})
                '';
            }
            #{
            #    plugin = kanagawa-nvim;
            #    type = "lua";
            #    config = "vim.cmd(\"colorscheme kanagawa-dragon\")";
            #}
            {
                plugin = onedark-nvim;
                type = "lua";
                config = ''
                    require("onedark").setup {
                        style = "warmer"
                    }
                    require("onedark").load()
                '';

            }
        ];
    };
}
