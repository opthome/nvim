# 基础
:terminal 打开一个新的终端
## 安装我的配置
1、将配置文件clone 放到 ~/.config/nvim
2、安装packer.nvim (https://github.com/wbthomason/packer.nvim)
3、执行 :PackerSync 进行安装插件
4、安装对应语言的 language-server 和 debug 环境
5、修改
	将文件中有具体路径的地方进行修改
	nvim-tree 需要安装补丁字体
## 文件结构
.
├── README.md                             -- 笔记、安装过程
├── ftplugin                              -- Java相关，官网指定的位置
│   └── java.lua
├── init.lua                              -- 配置文件入口
├── lua
│   ├── appearance                        -- 外观
│   │   ├── code-trouble.lua
│   │   ├── colorscheme.lua
│   │   ├── init-bufferline.lua
│   │   ├── init-indent.lua
│   │   ├── init-mason.lua
│   │   ├── init-symbols-outline.lua
│   │   ├── init-tree-sitter.lua
│   │   └── init-tree.lua
│   ├── coding                            -- 代码提示，language-server
│   │   ├── awk.lua
│   │   ├── cpp.lua
│   │   ├── java.lua
│   │   ├── javascript.lua
│   │   ├── lua.lua
│   │   ├── python.lua
│   │   ├── rust.lua
│   │   └── shell.lua
│   ├── dap                               -- 调试设置
│   │   ├── cpp.lua
│   │   └── python.lua
│   ├── edit                              -- 快捷键映射，文件搜索
│   │   ├── init-org-mode.lua
│   │   ├── map.lua
│   │   └── telescope.lua
│   ├── init-appearance.lua               -- appearance文件夹入口
│   ├── init-cmp.lua                      -- 补全设置，不只是代码
│   ├── init-dap.lua                      -- 调试通用设置，dap文件夹入口
│   ├── init-edit.lua                     -- edit文件夹入口
│   ├── init-lsp.lua                      -- language-server
│   ├── init-snip.lua                     -- 代码片段提示
│   ├── plugins.lua                       -- 必须是这个，从这里安装插件
│   └── snippets                          -- 特定的代码补全提示
│       └── snip-python.lua
└── plugin                                -- 系统自动生成
    └── packer_compiled.lua
# 目录结构
## 配置文件结构
注意：
	*每次修改文件时，都需要重新编译，:PackerSync*
	*配置文件不要和模块重名，否则会出错*
~/.config/nvim
	init.lua 配置文件入口，包含其他的配置文件，也可以在任意文件中使用*require('文件夹.文件名')*
	lua
		plugins.lua 插件列表
		.lua 每个插件的配置文件
## init.lua
vim.o. 用与修改参数，编辑器的基本设置
vim.g. 全局变量
### 快捷键映射
```lua
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
map("n", "<leader>fd", "<Cmd>Telescope fd<CR>", opts)
vim.keymap.set("n", "\\", tree.toggle)
```
## plugins.lua
```lua
return require('packer').startup(function(use)
	use '插件'
end)
```
## 其他文件
```lua
require("gruvbox").setup({
	-- 参数配置
})
vim.cmd("colorscheme gruvbox")
```
init.lua文件中配置：
	vim.o.background = "dark"
	vim.cmd([[colorscheme gruvbox]])
# 插件
## 安装
1、在lua下新建plugins.lua
	将要安装的插件加到文件中，插件配置可放到其他文件
2、在init.lua中添加刚写入的文件
	require('文件名')
	执行:PackerSync，安装插件
## Packer
```lua
-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- Regenerate compiled loader file
:PackerCompile

-- Remove any disabled or unused plugins
:PackerClean

-- Clean, then install missing plugins
:PackerInstall

-- Clean, then update and install plugins
-- supports the `--preview` flag as an optional first argument to preview updates
:PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
-- supports the `--preview` flag as an optional first argument to preview updates
:PackerSync

-- Show list of installed plugins
:PackerStatus

-- Loads opt plugin immediately
:PackerLoad completion-nvim ale
```
## 常用插件
### 看插件的github
### 外观界面
#### 主题
*'ellisonleao/gruvbox.nvim'*
*'folke/tokyonight.nvim'*
*"catppuccin/nvim"*
*"navarasu/onedark.nvim"*
#### 界面
*'nvim-tree/nvim-tree.lua'* 文件树
	需要安装字体，重新设置终端的字体，否则会出现图标乱码，用字体册添加
	补丁字体：[https://www.nerdfonts.com](https://www.nerdfonts.com)
	命令：
		:NvimTree...
		-   `o` 打开关闭文件夹
		-   `a` 创建文件
		-   `f` 搜索文件
		-   `r` 重命名
		-   `x` 剪切
		-   `c` 拷贝
		-   `p` 粘贴
		-   `d` 删除
*'akinsho/bufferline.nvim'* 终端上面显示已打开的文件,[https://github.com/akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
	可额外配置文件状态,init-bufferline.lua
```lua
	diagnostics_indicator = function(count, level, diagnostics_dict, context)
	  local s = " "
	  for e, n in pairs(diagnostics_dict) do
	    local sym = e == "error" and " "
	      or (e == "warning" and " " or "" )
	    s = s .. n .. sym
	  end
	  return s
	end
```
*'windwp/windline.nvim'* 状态栏显示
	[https://github.com/windwp/windline.nvim](https://github.com/windwp/windline.nvim)
	推荐的几种（修改plugins.lua的require中的内容即可）：
		require('wlsample.bubble')
		require('wlsample.bubble2')
		require('wlsample.evil_line')
*glepnir/dashboard-nvim*  初始界面美化
*"akinsho/toggleterm.nvim"*  悬浮窗口
### 编辑辅助
*"windwp/nvim-autopairs"* 自动补全括号
*"kylechui/nvim-surround"* 两端进行加减字符
	    Old text                    Command         New text
--------------------------------------------------------------------------------
    surr*ound_words             ysiw)           (surround_words)
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls
*nvim-treesitter/nvim-treesitter* 代码高亮显示
	需要安装对应的语言解析器
	`:TSUpdate`  已安装的解析器更新到最新版本
	`:TSInstall <language_to_install>`
	在 init-tree-sitter.lua 中添加语言解析器
	在官网查看对应的语言，(https://github.com/nvim-treesitter/nvim-treesitter)
	打开nvim，自动安装
*lukas-reineke/indent-blankline.nvim* 显示缩进线，与 tree-sitter 配合使用
*windwp/nvim-autopairs* html括号匹配
*folke/which-key*    命令提示
*nvim-orgmode/orgmode*   orgmode
#### ranger
以下两种未安装，安装试过，也可以使用(https://blog.csdn.net/lxyoucan/article/details/116486176)
*rbgrouleff/bclose.vim*
*francoiscabrol/ranger.vim*
已安装
*kevinhwang91/rnvimr*
	依赖：
		pip install ranger-fm pynvim
		brew install highlight        高亮代码
	`:RnvimrToggle` 打开
	`:RnvimrResize` 循环预设布局
#### 搜索匹配
*nvim-telescope/telescope.nvim*
	https://github.com/nvim-telescope/telescope.nvim
	需要额外安装：
		[BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
			brew install ripgrep
		[sharkdp/fd](https://github.com/sharkdp/fd)（finder）
			brew install fd
		[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)（查找器/预览）
		[neovim LSP](https://neovim.io/doc/user/lsp.html)（采摘者）
		[devicons](https://github.com/kyazdani42/nvim-web-devicons)（图标）
	使用：
		`<C-u>`在预览窗口中向上滚动
		`<C-d>`在预览窗口中向下滚动
		已做快捷键映射
### 代码
#### 补全
```lua
  -- Autocompletion
  -- lsp
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  -- snip
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/vim-vsnip'}
  use {'L3MON4D3/LuaSnip'} -- Snippets plugin
  use {'rafamadriz/friendly-snippets'}
  -- lspkind
  use {'onsails/lspkind-nvim'}
  -- cmp
  use {'hrsh7th/nvim-cmp'} -- Autocompletion plugin
  use {'hrsh7th/cmp-nvim-lsp'} -- LSP source for nvim-cmp
  use {'saadparwaiz1/cmp_luasnip'} -- Snippets source for nvim-cmp
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
```
另外的基本设置放在 lspconfig.lua、cmp.lua ,在 init.lua 中包含此文件
#### 注释
*'numToStr/Comment.nvim'*
	gc: 将选中的区域进行注释或取消
	gcc: 注释一行
#### mason
*williamboman/mason.nvim*  管理 `language-server、dap` 的调试器
	:Mason  使用，i 进行安装
#### 调试
*mfussenegger/nvim-dap* 
*rcarriga/nvim-dap-ui* 
*theHamsta/nvim-dap-virtual-text*
这几个只是调试的工具，需要额外安装对应语言的调试包
##### python
	1、:Mason debugpy  (pip install debugpy) (mason安装的模块未起作用)
	2、配置 dap/python.lua
	3、将文件添加到 init-dap.lua
##### C++/Rust
	(已安装，但是需要在vscode中调试完后，才可以进行，估计是需要找到对应的调试配置文件)
	1、:mason codelldb
	2、配置dap/cpp.lua
	3、将文件添加到init-dap.lua
#### 代码编辑辅助
*'glepnir/lspsaga.nvim'* 显示函数引用位置、函数定义,重构
	已做快捷键映射
*'simrat39/symbols-outline.nvim'* 右侧显示文件大纲
	:symboloutline
*'folke/trouble.nvim'*  错误提示
#### 代码提示
在 lspconfig.lua 中，local servers = {''},里面的内容需要安装,到lspconfig的github上找相应的模块
##### python：
	1、:Mason 安装pyright  (sudo npm install -g pyright)
	2、在init-lsp.lua 中配置server('pyright')
	3、其他配置写到 python.lua
	4、添加配置文件
##### js：
	1、:Mason 安装typescript-language-server  (sudo npm install -g typescript-language-server typescript)
	2、typescript-language-server --stdio
	3、在init-lsp.lua 中配置server('tsserver')
	4、其他配置写到 javascript.lua
	5、添加配置文件
##### rust：
	*simrat39/rust-tools.nvim* rust工具，配置在rust.lua
	1、安装rust环境[[入门]]
	2、:Mason 安装 rust-analyzer  (brew install rust-analyzer)
	3、rust的文件打开必须在rust项目下，否则会提示缺少Cargo.toml文件
##### java：
	1、:mason install jtdls
	2、在init-lsp.lua 中配置server('jtdls')
	3、其他配置写到 coding/java.lua
	4、添加配置文件require('coding.java')
	5、{ use 'mfussenegger/nvim-jdtls' }，需要 Java 17, jdk 配置参见[[java/tools]]
	   此插件的配置文件（需要另外编写）：~/.config/nvim/ftplugin/java.lua
	   配置maven的仓库为默认：/Users/wcj/.m2/repository
##### shell:
	1、:Mason 安装bash-language-server  (sudo npm i -g bash-language-server)
	2、在init-lsp.lua 中配置server('bashls')
	3、其他配置写到shell.lua
	4、添加配置文件
##### AWK:
	1、:Mason 安装awk-language-server  (sudo npm install -g awk-language-server)
	2、在init-lsp.lua 中配置server('awk_ls')
	3、其他配置写到 coding/awk.lua
	4、添加配置文件
##### C++:
	1、本次使用clang，mac自带，无需安装
	2、在init-lsp.lua 中配置server('clangd')
	3、其他配置写到 coding/cpp.lua
	4、添加配置文件
##### lua:
	1、安装，brew install lua
	2、:Mason lua-language-server
	3、在init-lsp.lua 中配置server('lua_ls')
	4、其他配置写到 coding/lua.lua
	5、添加 coding.lua

# Ubuntu安装
区别：
	1、sudo snap install nvim
	2、图标乱码，安装字体
```shell
	将字体文件传到目录内，
	sudo mkdir -p /usr/share/fonts/custom
	sudo mv Monaco.ttf /usr/share/fonts/custom
	sudo chmod 744 /usr/share/fonts/custom/name.ttf
	以下操作在 /usr/share/fonts/custom/
	sudo mkfontscale  -- 生成核心字体信息
	sudo mkfontdir
	sudo fc-cache -fv
```

