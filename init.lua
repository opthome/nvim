-- loading setting files
require('plugins')
require('init-appearance')
require('init-lsp')
require('init-dap')
require('init-edit')


-- general settings
vim.o.number = true -- 显示行号
vim.o.encoding = 'utf-8' --设置编码
vim.o.title = true
vim.o.termguicolors = true -- 允许使用主题配色
vim.o.cursorline = true -- 高亮所在行
vim.o.signcolumn = 'yes' -- 显示左侧图标指示列
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.autoread = true
vim.o.mouse = "a"

-- colorscheme
vim.o.background = "dark"
-- vim.cmd[[colorscheme tokyonight]]
-- vim.cmd([[colorscheme gruvbox]])
vim.cmd.colorscheme "catppuccin"
-- vim.cmd.colorscheme "onedark"

-- tab
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
-- 新行对齐当前行，空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true


