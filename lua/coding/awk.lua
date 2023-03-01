require('lspconfig').awk_ls.setup({
    cmd = { "awk-language-server" },
    filetypes = {
        "awk",
        "sh",
    },
    single_file_support = true,
    handlers = {
        ['workspace/workspaceFolders'] = function()
          return {{
            uri = 'file://' .. vim.fn.getcwd(),
            name = 'current_dir',
          }}
        end
      },
})
