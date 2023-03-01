require('lspconfig').jdtls.setup({
    cmd = { "jdtls", "-configuration", "/home/runner/.cache/jdtls/config", "-data", "/home/runner/.cache/jdtls/workspace" },
    filetypes = { "java" },
    single_file_support = true,
})


