
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- css
require('lspconfig').cssls.setup({
    cmd = { "vscode-css-languageserver", "--stdio" },
    on_attach = on_attach,
    capabilities = capabilities,
})

-- js
require('lspconfig').tsserver.setup({
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
    single_file_support = true,
})

