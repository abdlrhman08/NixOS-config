local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- language server setup
lspconfig.rust_analyzer.setup({
  on_attach = function (client, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr})
  end,
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
