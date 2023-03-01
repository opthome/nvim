-- keymap
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- general
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- tree
local tree = require('nvim-tree')
vim.keymap.set("n", "tt", tree.toggle, opts)
vim.keymap.set("n", "tf", "<cmd>NvimTreeFindFile<CR>", opts)

-- ranger
vim.keymap.set("n", "rt", "<cmd>RnvimrToggle<CR>", opts)


-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {}) -- 根据文件名
vim.keymap.set('n', 'fg', builtin.live_grep, {}) -- 根据文件内容
vim.keymap.set('n', 'bb', builtin.buffers, {}) -- 显示缓冲区
vim.keymap.set('n', 'fh', builtin.help_tags, {})

-- lspsaga
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts) -- 显示注释文档
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", opts) -- 显示引用位置
vim.keymap.set("n", "go", "<cmd>Lspsaga outline<CR>", opts) -- 右侧显示文件大纲

vim.keymap.set("n","gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- 转到函数定义位置
vim.keymap.set("n","gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- 转到函数定义位置

vim.keymap.set("n","gt", "<cmd>Lspsaga peek_type_definition<CR>", opts)
vim.keymap.set("n","gt", "<cmd>Lspsaga goto_type_definition<CR>", opts)

vim.keymap.set("n","K", "<cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n","K", "<cmd>Lspsaga hover_doc ++keep<CR>", opts)

vim.keymap.set("n","<Leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts) -- 转到函数定义位置
vim.keymap.set("n","<Leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- 转到函数定义位置
vim.keymap.set("n","<Leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- 转到函数定义位置

-- dap
vim.keymap.set({"i", "n", "v"}, "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)  -- start
vim.keymap.set({"i", "n", "v"}, "<F8>", "<cmd>lua require'dap'.step_into()<CR>", opts) -- next
vim.keymap.set({"i", "n", "v"}, "<F9>", "<cmd>lua require'dap'.step_over()<CR>", opts) -- over
vim.keymap.set({"i", "n", "v"}, "<F4>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)  -- 断点
vim.keymap.set("n", "<Leader>db", require("dapui").toggle, opts)  -- 调试窗口
vim.keymap.set("n", "<Leader>ru", "<cmd>!python3 %<CR>", opts)  -- 运行




