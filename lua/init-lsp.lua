-- autocomplete
require('init-cmp')
require('init-snip')

-- language servers
require('coding.awk')
require('coding.shell')
require('coding.javascript')
require('coding.rust')
require('coding.cpp')
require('coding.python')
require('coding.lua')
require('coding.java')

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pyright', 'tsserver', 'rust_analyzer', 'bashls', 'awk_ls', 'clangd', 'lua_ls', 'jdtls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end



