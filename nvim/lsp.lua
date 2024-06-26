local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- language server setup
lspconfig.rust_analyzer.setup({
  capabilites = capabilities,
})
lspconfig.lua_ls.setup({
  capabilites = capabilities,
})
lspconfig.nixd.setup({
  capabilites = capabilities,
})
