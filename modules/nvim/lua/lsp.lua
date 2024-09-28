local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local inlay_set = true
function toggle_inlay()
    vim.lsp.inlay_hint.enable(inlay_set, { bufnr = vim.fn.winbufnr(0) })
    inlay_set = not inlay_set
end

-- language server setup
lspconfig.rust_analyzer.setup({
  on_attach = function (bufnr)
    vim.keymap.set("n", "fi", toggle_inlay, {})
  end,
  capabilites = capabilities,
})

lspconfig.pyright.setup({
  capabilites = capabilities,
})
lspconfig.clangd.setup({
  capabilites = capabilities,
})
lspconfig.lua_ls.setup({
  capabilites = capabilities,
})
lspconfig.nixd.setup({
  capabilites = capabilities,
})
vim.keymap.set("n", "gh", vim.lsp.buf.hover, {})

require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>y", "<cmd>AerialToggle!<CR>")
